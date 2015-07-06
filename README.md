# Gavel—HTTP validator

![Gavel logo](https://raw.github.com/apiaryio/gavel/master/img/gavel.png)

## What is Gavel?

> **Gavel is a tool for deciding which HTTP API call is valid and which is not.**

It's useful for:

- [Specification by example][sbe] and [BDD][bdd] for HTTP (RESTful) APIs
- Diff HTTP Requests and Responses
- Testing API documentation
- DRY test assertion engine for REST API's HTTP request and response
- API client (SDK) validations

[sbe]: http://en.wikipedia.org/wiki/Specification_by_example
[bdd]: http://en.wikipedia.org/wiki/Behavior-driven_development

## Usage

```
$ curl --trace - http://httpbin.org/ip | curl-trace-parser  > expected
$ curl --trace - http://httpbin.org/ip | curl-trace-parser  > real
$ cat real | gavel expected
$ echo $?
0
```

- [JavaScript guide and examples](https://www.relishapp.com/apiary/gavel/docs/node-js)
- [Specification and documentation](https://www.relishapp.com/apiary/gavel/docs)
- [Curl trace parser used in example](https://github.com/apiaryio/curl-trace-parser)

## How does it work?

Gavel` filters out boring noise in API communication and helps you understand important differences between real and expected [HTTP messages][message] (HTTP [request][request] and [response][response]). You can use Gavel with examples for:

- [x] [HTTP Headers](https://www.relishapp.com/apiary/gavel/docs/expectations/headers)
- [x] [Textual HTTP body](https://www.relishapp.com/apiary/gavel/docs/expectations/body-text-example)
- [x] [JSON HTTP body](https://www.relishapp.com/apiary/gavel/docs/expectations/body-json-example)
- [x] [HTTP body defined by JSON Shema](https://www.relishapp.com/apiary/gavel/docs/expectations/body-json-schema)
- [X] [Status code](https://www.relishapp.com/apiary/gavel/docs/expectations/status-code)
- [ ] [Method](https://www.relishapp.com/apiary/gavel/docs/expectations/request-method)
- [ ] [URI](https://www.relishapp.com/apiary/gavel/docs/expectations/request-uri)

[message]: https://www.relishapp.com/apiary/gavel/docs/data-model#http-message
[request]: https://www.relishapp.com/apiary/gavel/docs/data-model#http-request
[response]: https://www.relishapp.com/apiary/gavel/docs/data-model#http-response

## Brief behavior description

- Headers cannot be missing
- Header values matter
- JSON keys in bodies cannot be missing
- Textual body must match exactly

See detailed [expectation behavior specification](https://www.relishapp.com/apiary/gavel/docs/expectations).

## Known implementations

- [JavaScript][gavel.js] [![Gavel.js Travis-CI badge](https://travis-ci.org/apiaryio/gavel.js.png?branch=master)](https://travis-ci.org/apiaryio/gavel.js)
- [Apiary][Apiary] interactive documentation

[gavel.js]: https://github.com/apiaryio/gavel.js
[Apiary]: http://apiary.io/


## Call for contributions

Looking for your language? Gavel has [platform independent Cucumber specification][platind]. So feel feel to contribute! We are looking forward to see library for your language. 

[platind]: https://www.relishapp.com/apiary/gavel/docs/about



