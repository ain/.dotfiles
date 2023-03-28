# .dotfiles

My various dotfiles for macOS.

## Installation

1. Make sure the following files are backed up, if applicable:
  - `~/.gitignore`
  - `~/.bash_profile`
  - `~/.zprofile`
  - `~/.zsh_profile`
  - `~/.composer/composer.json`
  - `~/.composer/composer.lock`
2. Move to `.dotfiles` folder
3. Run `./install`

## Special commands

| Command               | Description                                                                                                             |
| ---------             | -----                                                                                                                   |
| `claimspace <option>` | Claim all space that can be freed on disk.<br><br>`-d` include Docker<br>`-p` include MacPorts                          |
| `dockerwipe`          | Remove build cache, all stopped containers, and all networks, volumes, images that are not used by at least 1 container. Alias of `docker system prune -a --volumes`. |
| `emptify <file>`      | Empty given file                                                                                                        |
| `killcache`           | Kill DNS cache                                                                                                          |  
| `whereami`            | Display local and external IPs                                                                                          |
