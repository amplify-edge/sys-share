# CI

CI setup scripts for a repo.

The idea is for the ci.mk make file to use this folder for any boostraping needed.

Currently we use Github actions

Logic
- detect the path your at inside a repo and use it for the start of the CI script where we detrmine what paths to watch. The idea is we want to watch just your code.

Code (TODO)
- Will need to make the CI script a go template.
- make a tool/ci that can run the tmeplate given the correct args
- then the ci.mk can call the golang code to pump out a CI script into the .github/workflows

