# Cool Agent - CLI Utilities

A collection of convenient CLI commands and aliases for everyday productivity.

## Features

- **Move Recent Downloads**: Quickly move the most recently downloaded files to your current directory
- **Extensible Alias System**: Easy setup and management of custom CLI aliases

## Quick Start

1. Clone this repository
2. Run the setup script: `./setup.sh`
3. Reload your shell or run `source ~/.zshrc`

## Commands

### `move-recent-downloads` (alias: `mrd`)

Moves the most recently downloaded files from your Downloads folder to the current working directory.

Usage:
```bash
# Move the most recent download
mrd

# Move the 3 most recent downloads  
mrd 3

# Move downloads from the last 5 minutes
mrd --minutes 5
```

## Installation

### Automatic Setup
```bash
./setup.sh
```

### Manual Setup
1. Add the `bin` directory to your PATH
2. Source the aliases file in your shell profile

## Adding New Commands

1. Add your script to the `bin/` directory
2. Make it executable: `chmod +x bin/your-command`
3. Add an alias in `aliases/aliases.sh` if desired
4. Run `./setup.sh` to update your shell

Author: Yuwei Liang