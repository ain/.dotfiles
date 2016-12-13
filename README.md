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

| Command               | Description                                                                              |
| ---------             | -----                                                                                    |
| __Aliases__           |                                                                                          |
| `killcache`           | Kill DNS cache                                                                           |  
| __Docker__            |                                                                                          |
| `dockerenv <machine>` |  Set Docker environment variables or get already set ones                                |
| `dockersize`          | Display status of disk space on Docker file systems                                      |
| `dockerwipe <option>` | Remove dangling volumes and images, optionally force-remove (`dockerwipe -f`) containers |
