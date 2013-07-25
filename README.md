# Gavel—HTTP validator

![Gavel logo](https://raw.github.com/apiaryio/gavel/master/img/gavel.png?login=netmilk&token=73e03867f59ec1870842429ca2f7e8b9)

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
$ cat real | gavel expected_message
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
- [x] [JSON HTTP body](https://www.relishapp.com/apiary/gavel/docs/expectations/body-json-exapmle)
- [x] [HTTP body defined by JSON Shema](https://www.relishapp.com/apiary/gavel/docs/expectations/body-json-schema)
- [ ] [Status code](https://www.relishapp.com/apiary/gavel/docs/expectations/status-code)
- [ ] [Method](https://www.relishapp.com/apiary/gavel/docs/expectations/request-method)
- [ ] [URI](https://www.relishapp.com/apiary/gavel/docs/expectations/request-uri)

[message]: https://www.relishapp.com/apiary/gavel/docs/data-model#http-message
[request]: https://www.relishapp.com/apiary/gavel/docs/data-model#http-request
[response]: https://www.relishapp.com/apiary/gavel/docs/data-model#http-response

## Brief behavior description

- Headers can't miss
- Header values metters
- JSON keys in bodies can't miss
- Textual body must match exactly

See detailed [expectation behavior specification](https://www.relishapp.com/apiary/gavel/docs/expectations)

## Known implementations

- [JavaScript][gavel.js] [![Gavel.js Travis-CI badge](https://travis-ci.org/apiaryio/gavel.js.png?branch=master)](https://travis-ci.org/apiaryio/gavel.js)
- [Apiary](http://apiary.io/) interactive documentation


[gavel.js]: https://github.com/apiaryio/gavel.js

## Platform independent documentation and specification

> **Gavel is fair to everyone!**

Gavel specification and documentation is written in [Gherkin][gherkin], laguage used by [Cucumber][cucumber], popular BDD tool and lives [here on Relish][gavelrelish].

[Relish][relish] radically changed point of view on Cucumber from BDD tool to **documentation-oriented acceptance testing platform** for collaboration. Examples are made on raw HTTP, in order to focus on implementation independence. It means, thanks to Cucumber, each example in Gavel specification is tested against each Gavel implementation in continous integration. **So Gavel's behavior documentation can never be outdated and Gavel's behavior is consistent across all languages.**

[gherkin]: https://github.com/cucumber/gherkin
[cucumber]: https://github.com/cucumber/cucumber
[gavelrelish]: https://www.relishapp.com/apiary/gavel/docs
[relish]: https://www.relishapp.com/ 

## Contribution to this specification

1. Fork this repo
2. Make change to existing features or add features  
3. Bump version (create tag)
4. Open pull request

Use [GitHub issues](https://github.com/apiaryio/gavel/issues) for discussion. 

## New language implementation (the BDD way)

- Fork this repo
- Assign implementation specific Cucumebr tag (e.g. @erlang) in this document
- Add forked repo as [git submodule][git submodule] to cucumber feature directory in your project
- Setup your Cucumber-like test runner to use only this tag (-t option) to filter out other implementations
- Tag features with your language tag as you implement
- Implement Cucumber step definitions (glue code between Cucumber steps and your code)
- Run Cucumber and see it failing
- Implement scenario in your code
- Run Cucumber and see examples passing (Make cukes green)
- Do not forget to add Cucumber features for code exapmles for your implementation
- Add your repository to Travis-CI and add badge in this document
- Publish your repository


[git submodule]: http://git-scm.com/book/en/Git-Tools-Submodules

## Cucumber tags

*Untagged features and scenarios are considered mandatory in all imlpementations*

### General tags

**@stable** - Stable API or behavior - MUST be implemented

**@proposal** - proposal for stabilization - SHOULD be implemented

**@draft** - feature sketch, thoughts aggregation - MAY be implmemented

See [RFC Requirement levels](http://www.ietf.org/rfc/rfc2119.txt) 

### Implementation specific tags

**@nodejs** - Implemented in Node.js, tested

**@nodejs-pending** Planned to implement in Node.js, NOT tested

## Licence

Gavel is released under [MIT licence](https://github.com/apiaryio/gavel/blob/master/LICENSE).

