# .dotfiles

My various dotfiles for macOS.

## Dependencies

- [RubyGems](https://rubygems.org/pages/download)
- gpg and gpg-agent, e.g. for verified commits in Vim. Install with:

        $ sudo port install gpg gpg-agent

## Installation

1. Make sure the following files are backed up, if applicable:
  - `~/.gitignore`
  - `~/.bash_profile`
  - `~/.composer/composer.json`
  - `~/.composer/composer.lock`
2. Run `./install`

## Special commands

| Command               | Description                                                                      |
| ---------             | -----                                                                            |
| __Aliases__           |                                                                                  |
| `killcache`           | Kill DNS cache                                                                   |  
| __Docker__            |                                                                                  |
| `dockerenv <machine>` |  Set Docker environment variables or get already set ones                        |
| `dockersize`          | Display status of disk space on Docker file systems                              |
| `dockerwipe <option>` | Remove dangling volumes and images. Options:<br><br>`-f` force-remove containers |
