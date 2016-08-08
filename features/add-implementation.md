# Adding a New Gavel Implementation

1.  Fork the [gavel-spec][https://github.com/apiaryio/gavel-spec] repository.
2.  Assign new implementation-specific Cucumber tag (e.g. `@python`).
3.  Add the specification to your project:

    - Add your forked repository as a [git submodule][] to the directory where your Cucumber features live in your project.
    - Setup your Cucumber test runner to only use the language tag relevant for your implementation (`-t` option).

4.  As you implement, tag features with your language tag. Do not forget to add Cucumber features for code examples in your language.
5.  Implement Cucumber step definitions (implementation-specific glue code between Cucumber steps and your code).
6.  Run Cucumber and see it failing.
7.  Implement scenarios in your code. Iteratively run Cucumber until the tests are passing.
8.  Once your implementation works and you have language-specific Cucumber features ready, you can send them back to upstream `gavel-spec` in a Pull Request. Don't forget to add your implementation to the list above.
9.  Once it gets merged, new [npm package][] of `gavel-spec` will be released. Then it's up to you if you prefer to add the specification to your project as git submodule of the upstream `gavel-spec` or if it's convenient for you to install it as npm dependency.
10. Publish your project! Be sure to have it tested against the specification (e.g. by [Travis CI][])

If you get lost, don't hesitate to ask in [issues][] or inspect [existing implementations][index.md#implementations].

## Guidelines for Cucumber Tags

-   **Untagged** features and scenarios are considered mandatory in all implementations.

-   **General tags**

    - **@stable** - Stable API or behavior, MUST be implemented
    - **@proposal** - Proposal for stabilization, SHOULD be implemented
    - **@draft** - Feature sketch, thoughts aggregation, MAY be implemented

    See [RFC Requirement Levels][].

-   **Implementation-specific tags**

    - **@nodejs** - Implemented in Node.js, tested
    - **@nodejs-pending** - Planned to implement in Node.js, _NOT_ tested


[git submodule]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[npm package]: https://www.npmjs.com/package/gavel-spec
[issues]: https://github.com/apiaryio/gavel-spec/issues
[Travis CI]: https://travis-ci.org/
[RFC Requirement Levels]: http://www.ietf.org/rfc/rfc2119.txt
