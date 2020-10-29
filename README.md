# Ruby Code test for Arena flowers

Parse a log file of page views, and output an ordered list of highest viewed
pages. First by any page view, and secondly by unique views.

## Usage

```
$ bin/parser.rb /path/to/log/file
```

## Running tests

Tests can be run using the following command:

```
$ bundle exec rspec
```

You can also use guard to automatically run tests following code changes:

```
$ bundle exec guard
```

## To improve (didn't have time to implement)

- Properly test bin/parser.rb. Not actually testing the nature of the output
  here. Maybe move this logic into its own class. Also its output bleeds into
  test output which isn't ideal.
- Read the log file more efficiently. Currently it loads the entire file into
  memory.
- Review purpose of LogParser file, it's not really doing a lot.