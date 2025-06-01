# Worfklow

-   Avoid installing extra dependencies wherever possible, the net goal for dependencies is zero
-   Always run relevant tests after you made changes. If you cannot find tests ask to create them.

## Code Style

-   The most important goals are simplicity, maintainability, readability and elegance
-   Prefer functional programming patterns
-   Do not use excessive comments, only add comments for information that is surprising or unintuitive
-   If type definitions are available in the active programming language use them
-   Use pattern matching where available through already installed libraries or the language itself
-   Adhere to Data Oriented Programming Principles where possible:
    -   Separate Data and Behavior. Data should be simple typed representations of entity. Pure functions should work on it without needing context
    -   Treat data as immutable where possible
    -   Make illegal states unrepresentable, eg through the type system

## Documentation

-   After implementing a larger change that might have affected API-Surface, check if the `README` needs updating
-   After finishing a task prompt the user if the work should be documented
    -   If confirmed create a new markdown file in `docs/agent` with the filename `<YYYY>_<MM>_<DD>-<short title based on changes>`
    -   In this file summarize the work done in a way that is useful to future LLMS and human reviewers
    -   Put special emphasis on documenting the "Why?" of the changes not the "How?"
    -   Where useful prompt the user about additional information that you might want to include
