# ci

Single file for CI

Its vital that we change this CI file so as mch as possible uses the makefile
- Golang and flutter can be installed with the actions
- After that its all just calling into the make files.
- Its the same concept as how Boostrap/OsO works and so local and CI environments are using the exact same approach and so we will get parity locally and in CI and so its easy to test locally and know it works in CI.

Also this will make it easy to move away from github actions and onto our own CI hardware.

Still to determine best name value pairs that need to be injected into the template.
- 

Environment overrides also need handling such as:
- secrets.GKE_PROJECT

These require manually setting them up.