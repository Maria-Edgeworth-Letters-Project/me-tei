# me-tei
Repository holding TEI XML and documentation for MELP.


## Running Tests

Tests can be run locally by doing the following:

Install shunit2.  On MacOs this can be done with:

```
brew install shunit2
```

You can check if you already have it installed by doing this from the command line:

```
which shunit2
```

Then, run tests by doing:

```
cd tests && ./validate_records.sh
```