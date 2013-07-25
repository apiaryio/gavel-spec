## Platform independent documentation and specification

> **Gavel is fair to everyone!**

Gavel specification and documentation is written in [Gherkin][gherkin], laguage used by [Cucumber][cucumber], popular BDD tool and lives [here on Relish][gavelrelish].

[Relish][relish] radically changed point of view on Cucumber from BDD tool to **documentation-oriented acceptance testing platform** for collaboration. Examples are made in raw HTTP, in order to focus on implementation independence. It means, thanks to Cucumber, each example in Gavel specification is tested against each Gavel implementation in continous integration. **So Gavel's behavior documentation can never be outdated and Gavel's behavior is consistent across all languages.**

[gherkin]: https://github.com/cucumber/gherkin
[cucumber]: https://github.com/cucumber/cucumber
[gavelrelish]: https://www.relishapp.com/apiary/gavel/docs
[relish]: https://www.relishapp.com/ 

## Issues

[This documentation is open source][github], and a work in progress. If you find it incomplete or confusing, please [submit an issue][issues], or, better yet, a [pull request][pullrequest].

[github]: https://github.com/apiaryio/gavel
[issues]: https://github.com/apiaryio/gavel/issues
[pullrequest]: https://github.com/apiaryio/gavel/pulls

## Contribution to this specification

1. Fork this repo
2. Make changes
3. Bump version (create a tag)
4. Open pull request

Use [GitHub issues](https://github.com/apiaryio/gavel/issues) for discussion. 

## New language implementation (the BDD way)

- Fork this repo
- Assign implementation specific Cucumber tag (e.g. @erlang) in this document
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

