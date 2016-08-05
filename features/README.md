## Behavior spec for Gavel, validator of HTTP transactions

[![GitHub repository](https://img.shields.io/badge/repo-apiaryio/gavel--spec-000000.svg?style=flat)](https://github.com/apiaryio/gavel-spec)
[![npm version](https://badge.fury.io/js/gavel-spec.svg)](https://badge.fury.io/js/gavel-spec)

![Gavel - Validator of HTTP Transactions](https://raw.github.com/apiaryio/gavel/master/img/gavel.png?v=1)

### What is Gavel?

Gavel detects important differences between actual and expected HTTP transactions (HTTP request and response pairs). Gavel also decides whether the actual HTTP transaction is valid or not.

Input:

- Expected HTTP request and corresponding response
- Actual HTTP request and corresponding response

Output:

- Validation _verdict_ (boolean) or validation _result_ (complex information about what's different)

Gavel is useful specifically in testing HTTP APIs. It enables [specification by example][] and [BDD][] approach. The most prominent project built on top of Gavel is [Dredd][], framework which tests HTTP APIs against their documentation.

<a name="implementations"></a>
### Implementations

- [JavaScript][Gavel.js] [![Gavel.js Build Status](https://travis-ci.org/apiaryio/gavel.js.svg?branch=master)](https://travis-ci.org/apiaryio/gavel.js)

- Didn't find your favorite language? _[Add a new one!](add-implementation.md)_

### Command-line Interface

Gavel's CLI works well together with `curl --trace` and the [curl-trace-parser](https://github.com/apiaryio/curl-trace-parser) utility:

```sh
$ curl --trace - http://httpbin.org/ip | curl-trace-parser > expected
$ curl --trace - http://httpbin.org/ip | curl-trace-parser > actual
$ cat actual | gavel expected
$ echo $?
0
```

To learn more about the CLI, head to the [Command-line interface](http://www.relishapp.com/apiary/gavel/docs/command-line-interface) topic.

### Expectations

See following paragraphs for a basic overview of how Gavel works. To learn more about the expectations, head to the [General validation behavior](http://www.relishapp.com/apiary/gavel/docs/expectations) topic.

#### Response status

Status code of the _expected_ response must be the same as the one in the _actual_ response.

#### Request and response headers

- All _expected_ request headers must be present in the _actual_ request. The same applies for responses.
- Names of headers are validated in case-insensitive way.
- Only values of headers significant for content negotiation are validated.
- All other header values can differ.

For more information see the [respective topic](https://www.relishapp.com/apiary/gavel/docs/expectations/headers).

#### Request and response body

- If the body is JSON, Gavel [validates only its structure](https://www.relishapp.com/apiary/gavel/docs/expectations/body-json-example).
- Bodies in any other format are [validated as plain text](https://www.relishapp.com/apiary/gavel/docs/expectations/body-text-example).
- If Gavel is provided with JSON Schema, it [overrides the default validation behavior](https://www.relishapp.com/apiary/gavel/docs/expectations/body-json-schema).


[Dredd]: https://github.com/apiaryio/dredd
[Gavel.js]: https://github.com/apiaryio/gavel.js
[specification by example]: http://en.wikipedia.org/wiki/Specification_by_example
[BDD]: http://en.wikipedia.org/wiki/Behavior-driven_development
