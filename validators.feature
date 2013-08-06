@draft
Feature: Data validators and output format
  Each validatable entity can be validated with several validators. Usage of a particular validator for a particular entity depends on the format of data used for expression of the expectation. 

  Scenario: JSON diff validator
    **JSON diff validator** is used for validation of [JSON][] data against example given by another JSON. Output data is in the [JSON Patch][] foramt.

    [JSON]: http://tools.ietf.org/html/rfc4627
    [JSON Schema]: http://tools.ietf.org/html/draft-zyp-json-schema-04
    [JSON Patch]: http://tools.ietf.org/html/rfc6902

    Given you express expected data by following 'JSON example':
    """
    { 
      a: 'b', 
      c: {
        d: 'e'
      }
    }
    """    
    
    And you have the following real data:
    """
    { 
      changedKey: 'b',
      c: { 
        d: 'changed value' 
      } 
    }
    """
    
    When you perform the validation on an entity using the 'JSON Diff' validator
    
    Then the validation output data looks like:
    """
    [ 
      { op: 'replace', path: '/c/d', value: 'changed value' },
      { op: 'move', from: '/a',  path: '/changedKey' } 
    ]
    """

  Scenario: Text diff validator
    **Text diff validator** is used to compare textual data. Output is in the format used in [Google Diff, Match and Patch libraries for Plain Text][] which is similar to GNU diff's unidiff format (`diff -u`).
    
    [Google Diff, Match and Patch libraries for Plain Text]: https://code.google.com/p/google-diff-match-patch/wiki/Unidiff

    Given you express expected data by following 'textual examle':
    """
    There are two things that are more difficult than making an after-dinner speech: climbing a wall which is leaning toward you and kissing a girl who is leaning away from you.
    """    
    
    And you have the following real data:
    """
    `Churchill` talked about climbing a wall which is leaning toward you and kissing a woman who is leaning away from you.
    """
    
    When you perform the validation on an entity using the 'Text diff' validator
    
    Then the validation output data looks like:
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

    And the validator is identified by 'textDiff'


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
    
    When you perform the validation on an entity using the 'JSON schema' validator
    
    Then the validation output data looks like:
    """
    [
      {"pointer": "/a", message: "Property is required."}
    ]
    """

    And the validator is identified by 'jsonSchema'

  Scenario: Validators output
    When you perform a validation on any validatable entity
    
    Then the validator error looks like the following JSON:
    """
    {
      "validator": "jsonDiff",
      "data": "[{ \"op\": \"remove\", \"path\": \"/a/b/c\" }]"
    }
    """
    
    And the output JSON contains key 'data' with output from validator
    
    And the output JSON contains key 'validator' with one of the following values:
    | jsonSchema |
    | jsonDiff   |
    | textDiff   |
