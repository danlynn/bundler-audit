This image allows you to run [`bundler-audit`](https://github.com/rubysec/bundler-audit/) against any rails app without having to install any gems into your rails app or perform any rakefile changes. ([MIT License](https://github.com/danlynn/bundler-audit/blob/master/LICENSE))

![stars](https://img.shields.io/docker/stars/danlynn/bundler-audit.svg) ![pulls](https://img.shields.io/docker/pulls/danlynn/bundler-audit.svg) ![automated](https://img.shields.io/docker/cloud/automated/danlynn/bundler-audit.svg) ![status](https://img.shields.io/docker/cloud/build/danlynn/bundler-audit.svg) ![MIT License](https://img.shields.io/github/license/danlynn/bundler-audit.svg)

`bundler-audit 0.9.1`

### Supported tags and respective `Dockerfile` links

+ [`0.9.1`,`latest` (0.9.1/Dockerfile)](https://github.com/danlynn/bundler-audit/blob/0.9.1/Dockerfile)

## How to use

Basically, navigate to your rails project directory and then copy/paste the following command:

```bash
$ docker run --rm -v "$PWD":/myapp danlynn/bundler-audit
```

This will share your current rails project directory with the container then run the `bundler-audit check --update` command which first updates the internal `ruby-advisory-db` then performs a check on your project's `Gemfile.lock` file.

If you are a little less trusting about what you share with the docker container then you can share ONLY your project's Gemfile.lock when running the audit via:

```bash
$ docker run --rm -v "$PWD/Gemfile.lock":/myapp/Gemfile.lock danlynn/bundler-audit
```

If you want to specify your own options for the bundler-audit command (see bundler-audit [README.md](https://github.com/rubysec/bundler-audit/blob/master/README.md)) then append your own bundler-audit command to the end:

```bash
$ docker run --rm -v "$PWD":/myapp danlynn/bundler-audit bundler-audit check --update --format json
```
