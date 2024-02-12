This image allows you to run [`bundler-audit`](https://github.com/rubysec/bundler-audit/) against any rails app without having to install any gems into your rails app or perform any rakefile changes. ([MIT License](https://github.com/danlynn/bundler-audit/blob/master/LICENSE))

![stars](https://img.shields.io/docker/stars/danlynn/bundler-audit.svg) ![pulls](https://img.shields.io/docker/pulls/danlynn/bundler-audit.svg) ![automated](https://img.shields.io/docker/cloud/automated/danlynn/bundler-audit.svg) ![status](https://img.shields.io/docker/cloud/build/danlynn/bundler-audit.svg) ![MIT License](https://img.shields.io/github/license/danlynn/bundler-audit.svg)

`bundler-audit 0.9.1`

### Supported tags and respective `Dockerfile` links

+ [`0.9.1`,`latest` (0.9.1/Dockerfile)](https://github.com/danlynn/bundler-audit/blob/0.9.1/Dockerfile)

### How to use

Basically, navigate to your rails project directory and then copy/paste the following command:

```bash
$ docker run --rm -v "$PWD":/myapp danlynn/bundler-audit
```

This will share your current rails project directory with the container then run the `bundler-audit check --update` command which first updates the internal `ruby-advisory-db` then performs a check on your project's `Gemfile.lock` file.

If you are a little less trusting about what you share with the docker container then you can share ONLY your project's Gemfile & Gemfile.lock when running the audit via:

```bash
$ docker run --rm -v "$PWD/Gemfile":/myapp/Gemfile -v "$PWD/Gemfile.lock":/myapp/Gemfile.lock danlynn/bundler-audit
```

If you want to specify your own options for the bundler-audit command (see bundler-audit [README.md](https://github.com/rubysec/bundler-audit/blob/master/README.md)) then append your own bundler-audit command to the end:

```bash
$ docker run --rm -v "$PWD":/myapp danlynn/bundler-audit bundler-audit check --update --format json
```

### Command Options

Append `bundler-audit --help` to the end of `docker run --rm -v "$PWD":/myapp danlynn/bundler-audit` to see the general usage:

```bash
$ docker run --rm -v "$PWD":/myapp danlynn/bundler-audit bundler-audit --help

Commands:
  bundler-audit check [DIR]     # Checks the Gemfile.lock for insecure depend...
  bundler-audit download        # Downloads ruby-advisory-db
  bundler-audit help [COMMAND]  # Describe available commands or one specific...
  bundler-audit stats           # Prints ruby-advisory-db stats
  bundler-audit update          # Updates the ruby-advisory-db
  bundler-audit version         # Prints the bundler-audit version
```

To get help on a particular command (like `check`) try appending `bundler-audit --help check` to the end:

```bash
$ docker run --rm -v "$PWD":/myapp danlynn/bundler-audit bundler-audit --help check

Usage:
  bundler-audit check [DIR]

Options:
  -q, [--quiet], [--no-quiet]
  -v, [--verbose], [--no-verbose]
  -i, [--ignore=one two three]
  -u, [--update], [--no-update]
  -D, [--database=DATABASE]
                                     # Default: /root/.local/share/ruby-advisory-db
  -F, [--format=FORMAT]
                                     # Default: text
  -c, [--config=CONFIG]
                                     # Default: .bundler-audit.yml
  -G, [--gemfile-lock=GEMFILE_LOCK]
                                     # Default: Gemfile.lock
  -o, [--output=OUTPUT]

Checks the Gemfile.lock for insecure dependencies
```
