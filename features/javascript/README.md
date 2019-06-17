# Gavel.js - JavaScript implementation

[![GitHub repository](https://img.shields.io/badge/repo-apiaryio/gavel.js-000000.svg?style=flat)](https://github.com/apiaryio/gavel.js)
[![npm version](https://badge.fury.io/js/gavel.svg)](https://badge.fury.io/js/gavel)
[![Build Status](https://travis-ci.org/apiaryio/gavel.js.svg?branch=master)](https://travis-ci.org/apiaryio/gavel.js)

Gavel.js is JavaScript implementation of the [Gavel specification](http://www.relishapp.com/apiary/gavel/).

## Installation

```sh
npm install gavel
```

## Introduction

### Usage from JavaScript

```javascript
const gavel = require('gavel');

const expectedResponse = {
  'statusCode': '200',
  'headers': {
    'content-type': 'application/json',
    'date': 'Wed, 03 Jul 2013 13:30:53 GMT',
    'server': 'gunicorn/0.17.4',
    'content-length': '30',
    'connection': 'keep-alive'
  },
  'body': '{\n  "origin": "94.113.241.2"\n}'
};

const realResponse = {
  'statusCode': '200',
  'headers': {
    'content-type': 'application/json',
    'date': 'Wed, 03 Jul 2013 13:30:53 GMT',
    'server': 'gunicorn/0.17.4',
    'content-length': '30',
    'connection': 'keep-alive'
  },
  'body': '{\n  "origin": "94.113.241.2"\n}'
};

const result = gavel.validate(expectedResponse, realResponse);
```

### Command-line interface

Gavel.js implements CLI according to the common [Command-line interface](http://www.relishapp.com/apiary/gavel/docs/command-line-interface) specification.
