Feature: Data validators and output format
  Each validatable HTTP component can be validated with several validators. Usage of a particular validator for a particular HTTP component depends on the format of data used for expression of the expectation.

  @stable @nodejs
  Scenario: Validators output format
  Output JSON keys description:

    **realType**  - required - Media Type of real data
    **expectedType** - optional - Media Type of expected (example) data used for validation
    **validator**  - optional - Data validator used for real and expected data comparison
    **results** - required -  Validation result errors and warnings
    **rawData** - optional - Raw output from the data validator

    When you perform a failing validation on any validatable HTTP component
    Then the validator output for the HTTP component looks like the following JSON:
    """
    {
      "results": [
        {
          "pointer": "/c",
          "severity": "error",
          "message": "At '/c' Missing required property: c"
        }
      ],
      "realType": "application/json",
      "expectedType": "application/json",
      "validator": "JsonExample",
      "rawData": {
        "0": {
          "property": [
            "c"
          ],
          "attributeValue": true,
          "message": "At '/c' Missing required property: c",
          "validatorName": "error"
        },
        "length": 1
      }
    }
    """
    And the validator output for the HTTP component is valid against "GavelValidatorOutput" model JSON schema:
    """
    {
        "type": "object",
        "$schema": "http://json-schema.org/draft-04/schema",
        "id": "#",
        "required": [ "realType", "results" ],
        "properties": {
            "realType": {
                "type": "string",
                "default": "application/json"
            },
            "expectedType": {
                "type": "string",
                "default": "application/json"
            },
            "validator": {
                "type": "string",
                "default": "jsonExample"
            },
            "rawData": {
                "default": [
                    {
                        "op": "add",
                        "path": "/missingKeyInRealData",
                        "value": "23"
                    }
                ]
            },
            "results": {
                "default": {
                    "pointer": "/missingKeyInRealData",
                    "message": "Key is missing",
                    "severity": "error"
                },
                "type": "array",
                "items": {
                    "type": "object",
                    "required": ["message", "severity"],
                    "properties": {
                        "message": {
                            "type": "string",
                            "default": "No validator found for real data type."
                        },
                        "severity": {
                            "type": "string",
                            "default": "errors"
                        }
                    }
                }
            }
        }
    }
    """
    And each result entry under "results" key must contain "message" key
    And each result entry under "results" key must contain "severity" key
    And validated HTTP component is considered invalid
    And the output JSON contains key "validator" with one of the following values:
      | JsonSchema         |
      | JsonExample        |
      | TextDiff           |
      | HeadersJsonExample |

  @nodejs @stable
  Scenario: Text diff validator
    **Text diff validator** is used to compare textual data. Output is in the format used in [Google Diff, Match and Patch libraries for Plain Text][] which is similar to GNU diff's unidiff format (`diff -u`).

  [Google Diff, Match and Patch libraries for Plain Text]: https://code.google.com/p/google-diff-match-patch/wiki/Unidiff

    Given you want validate "body" HTTP component
    And you express expected data by the following "text/plain" example:
    """
    There are two things that are more difficult than making an after-dinner speech: climbing a wall which is leaning toward you and kissing a girl who is leaning away from you.
    """
    And you have the following "text/plain" real data:
    """
    `Churchill` talked about climbing a wall which is leaning toward you and kissing a woman who is leaning away from you.
    """

    When you perform validation on the HTTP component

    Then validator "TextDiff" is used for validation
    And validation key "rawData" looks like the following "text":
    """
    @@ -1,28 +1,84 @@
    -%60Churchill%60 talked about
    +There are two things that are more difficult than making an after-dinner speech:
      cli
    @@ -136,13 +136,12 @@
     g a
    -woman
    +girl
      who
    """
    And validation key "results" looks like the following "JSON":
    """
    [
      {
        "message": "Real and expected data does not match.",
        "severity": "error"
      }
    ]
    """

  @nodejs @stable
  Scenario: JSON schema validator
    **JSON schema validator** is used to validate real [JSON][] data againts expected example [JSON Schema][]. Output data from JSON schema validator is an array of error objects with JSON properties identified by the [JSON Pointer][].

  [JSON]: http://tools.ietf.org/html/rfc4627
  [JSON Schema]: http://tools.ietf.org/html/draft-zyp-json-schema-04
  [JSON Pointer]: http://tools.ietf.org/html/rfc6901

    Given you want validate "body" HTTP component
    And you express expected data by the following "application/schema+json" example:
    """
    {
      "type":"object",
      "$schema": "http://json-schema.org/draft-04/schema",
      "required":["a"],
      "properties":{
        "a": {
          "type":"string"
        }
      }
    }
    """
    And you have the following "application/json" real data:
    """
    {
      "b": "c"
    }
    """

    When you perform validation on the HTTP component

    Then validator "JsonSchema" is used for validation
    And validation key "results" looks like the following "JSON":
    """
    [
      {
        "pointer": "/a",
        "severity": "error",
        "message": "At '/a' Missing required property: a"
      }
    ]
    """
    And each result entry must contain "pointer" key

  @nodejs @stable
  Scenario: JSON example validator
    **JSON example validator** is used for validation of [JSON][] data against example given by another JSON. This validator generates recursively a [JSON schema] from given example to perform validation. All keys in JSON example are considered [required][] and all values must match [primitive type][] from example.

  [JSON]: http://tools.ietf.org/html/rfc4627
  [JSON Schema]: http://tools.ietf.org/html/draft-zyp-json-schema-04
  [JSON Patch]: http://tools.ietf.org/html/rfc6902
  [required]: http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.7
  [primitive type]: http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.1

    Given you want validate "body" HTTP component
    And you express expected data by the following "application/json" example:
    """
    {
      "a": "b",
      "c": {
        "d": "e"
      },
      "missingKeyInRealData": "123"
    }
    """
    And you have the following "application/json" real data:
    """
    {
      "changedKey": "b",
      "c": {
        "d": ["foo","bar"]
      }
    }
    """

    When you perform validation on the HTTP component
    Then validator "JsonExample" is used for validation
    And validation key "results" looks like the following "JSON":
    """
    [
      {
        "pointer": "/a",
        "severity": "error",
        "message": "At '/a' Missing required property: a"
      },
      {
        "pointer": "/missingKeyInRealData",
        "severity": "error",
        "message": "At '/missingKeyInRealData' Missing required property: missingKeyInRealData"
      }
    ]
    """
    And each result entry must contain "pointer" key
