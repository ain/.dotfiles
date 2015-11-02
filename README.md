# .dotfiles

My various dotfiles for Mac OS X Yosemite or later.

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
| `dockerenv [machine] [container]` | Set Docker environment variables or get already set ones |
| `dockerid` | Display ID of main container | 
| `dockerexec <command>` | Execute command in main container |
| `dockerrun <command>` | Run command in main container |
| `dockerbuild <options>` | Alias of `docker-compose build`. Supports `--no-cache` option. |
| `dockerup` | Alias of `docker-compose up` |
| `dockerdown` | Alias of `docker-compose down` |
| `dockerbounce` | Alias of `docker-compose restart` |
