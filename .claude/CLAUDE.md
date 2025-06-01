# Worfklow

-   Avoid installing extra dependencies wherever possible, the net goal for dependencies is zero
-   Always run relevant tests after you made changes. If you cannot find tests ask to create them.
-   Before implementing anything present a detailed, step-by-step implementaton plan to me
-   If you are not very sure about an approach offer me several options, each with a confidence on 1 to 10-scale
-   Always backup factual claims with sources
-   Ask me questions if you are not sure about requirements or what best to do
-   Always run tests you have edited before

## Code Style

-   The most important goals are elegance, simplicity, maintainability and readability
-   Prefer functional programming patterns
-   Do not use excessive comments, only add comments for information that is surprising or unintuitive
-   If the environment supports types, use them
-   Use pattern matching if available
-   Separate Data and Behavior. Data should be simple typed representations of an entity. Use simple records or typed structs.
-   Treat data as immutable where possible
-   Make illegal states unrepresentable, eg through the type system
-   Implement behaviour/logic as a pipeline of small functions that operate on data

## Tests

-   Use unit tests for core business logic and pure functions. Test them extensively
-   Ascertain general functionality with integration tests. Try to only mock on the level of the network/API responses to instrument as much of the actual implementation as possible

## Documentation

-   After implementing a larger change that might have affected API-Surface, check if the `README` needs updating
-   After finishing a task prompt the user if the work should be documented
    -   If confirmed create a new markdown file in `docs/agent` with the filename `<YYYY>_<MM>_<DD>-<short title based on changes>`
    -   In this file summarize the work done in a way that is useful to future LLMS and human reviewers
    -   Put special emphasis on documenting the "Why?" of the changes not the "How?"
    -   Where useful prompt the user about additional information that you might want to include
-   Additionally chunk our conversation into small chunks and store it in Chroma for future reference. Add a tag in metadata like this `project: <current git repository name>`

## Memory

-   Remember, you have access to Chroma tools. All memories for the current project are tagged with `project: <current git repository name>` in metadata. At any point if the user references previous chats or memory, check chroma for similar conversations. Only refer to Try to use retrieved information where possible.
