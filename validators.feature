@draft
Feature: Data validators and output format
  Each validatable entity can be validated with several validators. Usage of a particular validator for a particular entity depends on the format of data used for expression of the expectation. 

  Scenario: Validators output format
    Output JSON keys description:

    **realType**  - required - Media Type of real data
    **expectedType** - optional - Media Type of expected (example) data used for validation
    **validator**  - required - Validator used for validation
    **result** - required -  Raw output data from the validator
    **rawData** - optional - raw output from the validator for later evaluation
    
    When you perform a failing validation on any validatable entity
    Then the validator error looks like the following JSON:
    """
    {
      "realType": "application/json",
      "expectedType": 'application/json'
      "validator": "jsonDiff",
      "rawData": [ { "op": "add", "path\": "/missingKeyInRealData", "value": "23" }],
      "result": [
        {
          "pointer": "/missingKeyInRealData",
          "message": "Key is missing", 
          "severity": "error" 
        }
      ]
    }
    """
    And each result entry under 'result' key must contain 'message' key
    And each result entry under 'result' key must contain 'severity' key
    And validated entity is considered invalid if there is any result message with 'error' severity
    And the output JSON contains key 'validator' with one of the following values:
    | jsonSchema      |
    | jsonDiff        |
    | textDiff        |
    | headersJsonDiff |

  Scenario: Text diff validator
    **Text diff validator** is used to compare textual data. Output is in the format used in [Google Diff, Match and Patch libraries for Plain Text][] which is similar to GNU diff's unidiff format (`diff -u`).
    
    [Google Diff, Match and Patch libraries for Plain Text]: https://code.google.com/p/google-diff-match-patch/wiki/Unidiff

    Given you express expected data by following 'text/plain' example:
    """
    There are two things that are more difficult than making an after-dinner speech: climbing a wall which is leaning toward you and kissing a girl who is leaning away from you.
    """    
    And you have the following 'text/plain' real data:
    """
    `Churchill` talked about climbing a wall which is leaning toward you and kissing a woman who is leaning away from you.
    """
    
    When you perform validation on the entity
    
    Then validator 'textDiff' is used for validation
    And validation 'rawData' looks like:
    """
    @@ -1,84 +1,28 @@
    -There are two things that are more difficult than making an after-dinner speech:
    +%60Churchill%60 talked about
      cli
    @@ -136,12 +80,13 @@
     g a 
    -girl
    +woman
      who
    """
    And validation output 'result' looks like:
    """
    [
      { "message": "Texts does not match.", "severity": "error"}
    ]
    """

 Scenario: HTTP Headers JSON validator 
    **HTTP Headers JSON validator** is used for validation of [HTTP headers][] represented as [JSON][] data againts expected example in the same JSON representation (pseudo media type application/vnd.apiary.http-headers+json). Output data is an array of error objects with each HTTP headers identified by the down-cased header [field name].
    
    [JSON]: http://tools.ietf.org/html/rfc4627
    [HTTP headers]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
    [field name]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2


    Given you express expected data by following 'application/vnd.apiary.http-headers+json':
    """
    {
      "content-type": "application/json"
    }    
    """    
    And you have the following real data:
    """
    {
      "content-type": "text/plain",
      "date": "Fri, 31 Dec 1999 23:59:59 GMT"
    }
    """    
    
    When you perform validation on the entity

    Then validator 'headersJsonDiff' is used for validation
    And validation output 'result' looks like:
    """
    [
      {
        "field": "content-type",
        "message": "Excted different header field value.", 
        "value": "application/json",
        "severity": "error"
      },
      {
        "field": "date",
        "message": "Unknown header field.",
        "severity": "warning"
      },      
    ]
    """
    And each result entry must contain 'header' key

  Scenario: JSON schema validator 
    **JSON schema validator** is used to validate real [JSON][] data againts expected example [JSON Schema][]. Output data from JSON schema validator is an array of error objects with JSON properties identified by the [JSON Pointer][].
    
    [JSON]: http://tools.ietf.org/html/rfc4627
    [JSON Schema]: http://tools.ietf.org/html/draft-zyp-json-schema-04
    [JSON Pointer]: http://tools.ietf.org/html/rfc6901
    
    Given you express expected data by following 'JSON schema':
    """
    {
      "type":"object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "required":true,
      "properties":{
        "object": {
          "type":"object",
          "required":false,
          "properties":{
            "a": {
              "type":"string",
              "required":true
            }
          }
        }
      }
    }    
    """    
    And you have the following real data:
    """
    {
      "object": {
        "c": "d"
      }
    }
    """    
    
    When you perform validation on the entity

    Then validator 'jsonSchema' is used for validation
    And validation output 'result' looks like:
    """
    [
      {"pointer": "/a", message: "Property is required.", "severity": "error"}
    ]
    """
    And each result entry must contain 'pointer' key

  @draft
  Scenario: JSON diff validator
    **JSON diff validator** is used for validation of [JSON][] data against example given by another JSON. Output data is in the [JSON Patch][] foramt.

    [JSON]: http://tools.ietf.org/html/rfc4627
    [JSON Schema]: http://tools.ietf.org/html/draft-zyp-json-schema-04
    [JSON Patch]: http://tools.ietf.org/html/rfc6902

    Given you express expected data by following 'JSON example':
    """
    { 
      "a": "b", 
      "c": {
        "d": "e"
      },
      "missingKeyInRealData": "123"
    }
    """    
    And you have the following real data:
    """
    { 
      "changedKey": "b",
      "c": { 
        "d": "changed value"
      } 
    }
    """
    
    When you perform validation on the entity
    
    Then validator 'jsonDiff' is used for validation
    And validation 'rawData' looks like:
    """
    [ 
      { "op": "add", "path": '/missingKeyInRealData', "value": "23" },
      { "op": "replace", "path": "/c/d", "value": "e" },
      { "op": "move", "from": "/changedKey", "path": "/a" } 
    ]
    """
    And validation output 'result' looks like:
    """
    [
      { "pointer": "/missingKeyInRealData", "message": "Key is required.", "severity": "error" },
      { "pointer": "/a", "message": "Key is required.", "severity": "error" },
      { "pointer": "/changedKey", "message": "Unknow key.", "severity", "warning" },
      { "pointer": "/c/d", message: "Different value.", "severity": "warning" }
    ]
    """
    And each result entry must contain 'pointer' key
  
  @draft
  Scenario: API Blueprint parameters validator
    **Blueprint payload parameters validator** is used for validation of [JSON][] data against its description in [API Blueprint][] format for [parameters description][]. 

    [JSON]: http://tools.ietf.org/html/rfc4627
    [API Blueprint]: http://apiblueprint.org
    [parameters description]: https://github.com/apiaryio/api-blueprint/blob/master/API%20Blueprint%20Specification.md#52-parameters-subsection-payloadparameterssection 
    
    Given you express expected data by following 'API Blueprint parameters':
    """
    - message (string) ... A message from **ACME Blog** API.
    - id = 1234 (number, required) ... Id of a post.
    """    
    And you have the following real data:
    """
    { 
      "now": "something",
      "completely": "different"
    }
    """
    
    When you perform validation on the entity
    
    Then validator 'blueprintParams' is used for validation
    And validation 'result' looks like:
    """
    [
      { "pointer": '/now', "message": "Unknown key.", "severity": "warning" },
      { "pointer": '/completely', "message": "Unknown key.", "severity": "warning" },
      { "pointer": '/message', "message": "Key is not a string.", "severity": "error" },
      { "pointer": '/message', "message": "Key is missing.", "severity": "error" },
      { "pointer": '/id', "message": "Key is not a numer.", "severity": "error" },
      { "pointer": '/id', "message": "Key is missing", "severity": "error" },            
    ]
    """
