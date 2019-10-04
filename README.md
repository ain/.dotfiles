# .dotfiles

My various dotfiles for macOS.

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
| `claimspace <option>` | Claim all space that can be freed on disk.<br><br>`-d` include Docker<br>`-p` include MacPorts |
| `dockerwipe <option>` | Remove dangling volumes and images. Options:<br><br>`-f` force-remove containers               |
| `emptify <file>`      | Empty given file                                                                               |
| `killcache`           | Kill DNS cache                                                                                 |  
| `whereami`            | Display local and external IPs                                                                 |
