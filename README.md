# .dotfiles

My various dotfiles for macOS.

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

| Command               | Description                                                                                    |
| ---------             | -----                                                                                          |
| __Functions__         |                                                                                                |
| `claimspace`          | Claim all space that can be freed on disk.<br><br>`-d` include Docker<br>`-p` include MacPorts |
| __Aliases__           |                                                                                                |
| `killcache`           | Kill DNS cache                                                                                 |  
| __Docker__            |                                                                                                |
| `dockerwipe <option>` | Remove dangling volumes and images. Options:<br><br>`-f` force-remove containers               |
