Feature: HTTTP message

  Hit model can by represented by following JSON structure. We use [MongoDB dot notation](http://docs.mongodb.org/manual/core/document/) and JSON data types for model attributes description. 
  
  HTTP hit - http message
  http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html

  **url** *(string, optional)*

  **method** *(string, optional)* 

  http://www.w3.org/Protocols/rfc2616/rfc2616-sec6.html
  **request** *(object, required)* Container for real and expected HTTP request data

  **request.expected** *(object)* Expected request object
  **request.expected.body** *(text, optional)* expected HTTP body
  **request.expected.bodySchema** *(object, optional)* JSON schema of expected HTTP request body
  **request.expected.headers** *(object, optional)* expected HTTP reqeust headers
  
  **request.real** *(object)* Real HTTP request object
  **request.real.body** *(text, required)* Real raw HTTP request object
  **request.real.headers** *(object, required)* Real raw HTTP headers

  http://www.w3.org/Protocols/rfc2616/rfc2616-sec6.html

  **response** *(object, required)* Container for real and expected HTTP response data

  **response.expected** *(object, required)* Expected response obejct
  **response.expected.body** *(text, object, optional)* Expected HTTP resposne body 
  **response.expected.bodySchema** *(object, optional)* JSON schema of expected HTTP response body
  **response.expected.headers** *(object, optional)* Expected HTTP response headers 
  
  **response.real** *(object, required)* Real HTTP request object 
  **response.real.body** *(text, required)* Real raw HTTP request body
  **response.real.headers** *(object, required)* Real HTTP headers 
  **response.real.statusCode** *(integer, required)* Real HTTP status code
  

  Scenario: 