# Gavel - HTTP API validator

![Gavel logo](https://raw.github.com/apiaryio/gavel/master/img/gavel.png?login=netmilk&token=73e03867f59ec1870842429ca2f7e8b9)

## What is Gavel? 

> **Gavel is a tool for deciding which HTTP API call is valid and which not.** 

It's useful for:

- [Specification by example](http://en.wikipedia.org/wiki/Specification_by_example) and [BDD](http://en.wikipedia.org/wiki/Behavior-driven_development) for HTTP (RESTful) APIs
- Diff HTTP Requests and Responses
- Testing API documentations
- DRY test assertion engine for REST API's HTTP request and response



## Getting started

- Start with [Node.js guide and examples](https://www.relishapp.com/apiary/gavel/docs/node-js) in JavaScript
- Read [specification and ducumentation](https://www.relishapp.com/apiary/gavel/docs)

## How does it work?

Gavel filters out boring noise in API communication and helps you understand important differences between real and expected HTTP messages. You can provide use for examples of:

- HTTP Headers
- Textual HTTP body
- JSON HTTP body
- body defined by JSON Shema
- HTTP body defined by JSON schema
- HTTP Status code
- Method
- URI

## Known implementations
- [Gavel.js](https://github.com/apiaryio/gavel.js) JavaScript library for Node.js [![Build Status](https://travis-ci.org/apiaryio/gavel.js.png?branch=master)](https://travis-ci.org/apiaryio/gavel.js)
- [Apiary interactive API documentation](http://apiary.io/)

## Brief behavior description

- Headers can't miss
- Header values metters
- JSON keys in bodies can't miss
- Textual body must match exactly 

## Platform independent documentation and specification

> **Gavel is fair to everyone!**

Gavel's specification lives on [Relish](https://www.relishapp.com/apiary/gavel/docs) and it's written in [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin), language used by [Cucumber](https://github.com/cucumber/cucumber/wiki/Gherkin), popular BDD tool.

[Relish](https://www.relishapp.com/) radically changed point of view on Cucumber from BDD tool to documentation-oriented acceptance testing platform for collaboration. It means, thanks to Cucumber, each example in Gavel specification can be tested against Gavel implementations, **so Gavel's behavior documentation is always up-to-date.** 

**Examples are made on raw HTTP, in order to focus on implementation independence of this specification and behavior consistency across all implementations.** 

## Contribution to specification

1. Fork this repo
2. Make change to existing features or add features  
3. Bump version (create tag)
4. Open pull request

Use [GitHub issues](https://github.com/apiaryio/gavel/issues) for discussion. 

## New language implementation (the BDD way)

- Fork this repo
- Assign implementation specific Cucumebr tag (e.g. @erlang) in this document
- Add forked repo as cucumber feature directory in your project
- Setup your Cucumber-like test runner to use only this tag (-t option) to filter out other implementations
- Tag features with your language tag as you implement
- Implement Cucumber step definitions (glue code between Cucumber steps and your code)
- Run Cucumber and see it failing
- Implement scenario in your code
- Run Cucumber and see examples passing (Make cukes green)
- Do not forget to add Cucumber features for code exapmles for your implementation
- Add your repository to Travis-CI and add badge in this document
- Publish your repository

## Cucumber tags

*Untagged features and scenarios are considered mandatory in all imlpementations*

### General tags

**@draft** - proposal

### Implementation specific tags

**@nodejs** - Implemented in Node.js, tested

**@nodejs-pending** Planned to implement in Node.js, NOT tested