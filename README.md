# Gavel - HTTP validator

## What is Gavel? 

Gavel is a guide and tooling for comparison of real HTTP traffic against given examples of:  

- HTTP Headers
- Textual HTTP body
- JSON HTTP body
- HTTP body defined by JSON schema
- HTTP Status code
- Method
- URI

## When is it useful?

In general, when you are considering which API call is valid and which not.

- to help consider which differences in HTTP API calls matters
- You can use it as a DRY assertion library in tests on both frontend and backend 
- For testing API documentation
- When you need to diff two HTTP requests or responses
- To achieve proper HTTP API traffic introspection
- If you are bored ofwriting tons of assertins in your API acceptance tests

## Brief behavior description

- Headers can't miss
- Header values metters
- JSON keys in bodies can't miss
- Textual body must match exactly 


## Known Gavel implementations

- **Gavel.js** JavaScript library [![Build Status](https://travis-ci.org/apiaryio/hit-validation.png?branch=master)](https://travis-ci.org/apiaryio/hit-validation)

- **Apiary** HTTP API traffic inspector

## Specification and documentation

Gavel's specification lives on [Reslish](https://www.relishapp.com/apiary/gavel/docs) and it's written in [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin), language used by [Cucumber](https://github.com/cucumber/cucumber/wiki/Gherkin), popular [BDD](http://en.wikipedia.org/wiki/Behavior-driven_development) tool, so behavior is specified by examples. [Relish](https://www.relishapp.com/) radically changed point of view on Cucumber from BDD tool to documentation-oriented acceptance testing platform. It means, thanks to Cucumber, each example in the specification can be tested against Gavel implementation, so **Gavel's documentation is always up-to-date.** 

**In order to focus on implementation independence of this specification, examples are provided in raw HTTP.** 

## Used Cucumber tags

*Untagged features and scenarios are considered mandatory in all imlpementations*

### General tags

**@draft** - proposal

### Implementation specific tags

**@nodejs** - Implemented in Node.js, tested

**@nodejs-pending** Planned to implement in Node.js, not tested

## Contribution to specification

- Fork this repo
- Make change to existing features or add features  
- Bump version (create tag)
- Open pull request

## New implementation (the BDD way)

- Fork this repo
- Assign implementation specific Cucumebr tag (e.g. @erlang) in this document 
- Create pull request
- Add this repo as submodule to your repository (as cucumber `feature` directory)
- Setup your Cucumber test runner to use only this tag (-t option) to filter out other implementations
- Implement Cucumber step definitions (glue code between Cucumber steps and your code)
- Run Cucumber and see it failing
- Implement scenario in your code 
- Run Cucumber and see examples passing (Make cukes green)
- Add your project to Travis-CI and add its badge to this document 
- Do not forget to add Cucumber features for code exapmles for your implementation

