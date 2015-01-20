# Who Broke My App?

A small ruby script that will look up all of the release dates of the gem versions in a given Gemfile.lock and print out which gems were released in a given number of days.

The main purpose of this script is to track down which dependencies had recently released versions that potentially introduced an issue into your application or gem.

    Usage: who-broke-my-app [options]
        -p, --path [PATH]                Path to the Gemfile.lock
        -d, --days [DAYS]                Number of days to to search (default is 1)

