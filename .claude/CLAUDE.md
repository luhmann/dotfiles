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

## Documentation

-   After implementing a larger change that might have affected API-Surface, check if the `README` needs updating
-   After finishing a task prompt the user if the work should be documented
    -   If confirmed create a new markdown file in `docs/agent` with the filename `<YYYY>_<MM>_<DD>-<short title based on changes>`
    -   In this file summarize the work done in a way that is useful to future LLMS and human reviewers
    -   Put special emphasis on documenting the "Why?" of the changes not the "How?"
    -   Where useful prompt the user about additional information that you might want to include
