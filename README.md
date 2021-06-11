Github action for linting the C code.
Uses cppcheck.

Example of usage:

```yaml
name: linting

on: [pull_request]
jobs:
  linting:
    name: cppcheck
    runs-on: ubuntu-latest
    steps:
      - name: c-linter
        uses: appliedinnovation/cppcheck-action@master
```

Additional options:

```
 path: <relative path to the code to check> (default .)
 level: <cppcheck level> (default 'warning')
 opts: <additional command line flags and options) 
```
