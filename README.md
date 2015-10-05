# .dotfiles

My various dotfiles for Mac OS X Yosemite and upwards.

## Dependencies

- [RubyGems](https://rubygems.org/pages/download)

## Installation

1. Make sure the following files are backed up, if applicable:
  - `~/.gitignore`
  - `~/.bash_profile`
  - `~/.composer/composer.json`
  - `~/.composer/composer.lock`
2. Run `./install`

## Special commands

| Command | Description |
|---------|-----|
| __Git__ | |
| `gitpr <Pull Request ID>` | Check out Pull Request from Github by PR ID |
| __Docker__ | |
| `dockerenv` | Detect and set Docker IP for `DOCKER_HOST` env variable |
| `dockerid` | Display most recent container ID | 
| `dockerexec <command>` | Execute command in most recent container |
| `dockerrun <command>` | Run command in most recent container |
| `dockerbuild` | Alias of `docker-compose build` |
| `dockerup` | Alias of `docker-compose up` |
| `dockerdown` | Alias of `docker-compose down` |
