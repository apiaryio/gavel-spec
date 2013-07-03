@draft
Feature: Validation errors

  Scenario: JSON body error
    Given expected HTTP body is defined by following "JSON example":
    """
    {
      "a": "b"
    }
    """
    When real HTTP body is following:
    """
    {
      "b": "c"
    }
    """
    Then validation error looks like:
    """
    { '0': 
      { property: [ 'object', 'a' ],
        propertyValue: undefined,
        attributeName: 'required',
        attributeValue: true,
        message: 'The ‘object,a’ property is required.',
        validator: 'required',
        validatorName: 'required',
        validatorValue: true },
      length: 1,
    }
    """
  
  Scenario: Text body error 
    Given expected HTTP body is defined by following "textual example":
    """
    Red, green, blue...
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    When real HTTP body is following:
    """
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    Red, green, blue...
    """
    Then validation error looks like:
    """
    1d0
    < Red, green, blue...
    4c3,4
    < Dog, cat, mouse!
    \ No newline at end of file
    ---
    > Dog, cat, mouse!
    > Red, green, blue...
    """

  Scenario: Body type mismatch error
    Given expected HTTP body is defined by following "JSON example":
    """
    {
      "a": "b"
    }
    """
    When real HTTP body is following:
    """
    Red, green, blue...
    One, two, free, four.
    Orange, strawberry, banana?
    """
    Then validation error looks like:
    """
      Type mismatch. Can't validate Text against JSON
    """