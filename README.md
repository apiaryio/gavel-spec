# Behavior spec for Gavel, validator of HTTP transactions

[![Relish docs](https://img.shields.io/badge/docs-Relish-green.svg?style=flat)][Gavel on Relish]
[![npm version](https://badge.fury.io/js/gavel-spec.svg)](https://badge.fury.io/js/gavel-spec)

![Gavel - Validator of HTTP Transactions](img/gavel.png?v=1&raw=true)

## What is Gavel?

Gavel detects important differences between actual and expected HTTP transactions (HTTP request and response pairs). Gavel also decides whether the actual HTTP transaction is valid or not.

### Implementations

- [JavaScript][Gavel.js] [![Gavel.js Build Status](https://travis-ci.org/apiaryio/gavel.js.svg?branch=master)](https://travis-ci.org/apiaryio/gavel.js) [![Relish docs](https://img.shields.io/badge/docs-Relish-green.svg?style=flat)][Gavel.js on Relish]
- Didn't find your favorite language? _[Add a new one!](features/add-implementation.md)_

### Documentation

- [Gavel on Relish][]

## About `gavel-spec`

This repository contains implementation-independent behavior specification of Gavel. It's written in [Gherkin][], language used by [Cucumber][]. Two main benefits are:

- Any Gavel implementation can be tested against the specification, which ensures the behavior is uniform.
- Documentation at [Relish][] is generated from the specification, which ensures it's always up-to-date.

Examples are made in raw HTTP to focus on implementation independence.

### Usage

To use the specification in your project and test against it, install it as [npm package][] (or include as a [git submodule][]):

```sh
$ npm install gavel-spec
...
$ find ./node_modules/gavel-spec/features/**/*.feature
./node_modules/gavel-spec/features/expectations/body_json_example.feature
./node_modules/gavel-spec/features/expectations/body_text_example.feature
./node_modules/gavel-spec/features/expectations/headers.feature
./node_modules/gavel-spec/features/expectations/status_code.feature
...
```

It's also possible to get path to the directory with features from JavaScript:

```javascript
var featuresPath = require('gavel-spec').featuresPath;
console.log(featuresPath);  // prints '/.../node_modules/gavel-spec/features/'
```

Use [Cucumber][] for testing.

### Publishing Documentation

Currently publishing of a new version of the generated documentation is done manually:

1. Install Relish CLI: `gem install relish`
2. Add current version: `relish versions:add apiary/gavel:1.1.0` (the `1.1.0` should be the same number which appears on npm as the latest package version)
3. Publish new version of the documentation: `relish push apiary/gavel:1.1.0 path ./features/`

Steps 2-3 has been simplified as `npm run docs:publish` command.


[Relish]: https://www.relishapp.com/
[Gavel on Relish]: https://www.relishapp.com/apiary/gavel
[Gavel.js]: https://github.com/apiaryio/gavel.js
[Gavel.js on Relish]: https://www.relishapp.com/apiary/gavel/docs/node-js/
[Gherkin]: https://github.com/cucumber/gherkin
[Cucumber]: https://github.com/cucumber/cucumber
[git submodule]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[npm package]: https://www.npmjs.com/package/gavel-spec
