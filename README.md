# Cool Agent - CLI Utilities

A collection of convenient CLI commands and aliases for everyday productivity.

## Features

- **Move Recent Downloads**: Quickly move the most recently downloaded files to your current directory
- **Kubernetes File Sync**: Watch a folder and automatically sync files to Kubernetes pods
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

### `k8s-sync` (alias: `ksync`)

Watch a folder and automatically sync files to a Kubernetes pod. Perfect for development workflows where you need to keep local files synchronized with a remote pod.

**Features:**
- Git-aware syncing (default: only syncs modified/staged/untracked files)
- Real-time file watching with `fswatch`
- Configurable file filtering and exclusions
- Support for multiple containers and namespaces
- Dry-run mode for testing

Usage:
```bash
# Basic sync (Git mode - only modified files)
k8s-sync /path/to/source my-pod

# Sync to specific namespace and container
k8s-sync /path/to/source my-pod -n production -c app-container -r /app/src

# Sync all files (not just Git-tracked)
k8s-sync /path/to/source my-pod --all-files

# Preview what would be synced
k8s-sync /path/to/source my-pod --dry-run

# Debug mode to see detailed information
k8s-sync /path/to/source my-pod --debug

# Exclude certain file types
k8s-sync /path/to/source my-pod -e "*.log" -e "*.tmp"

# Only sync specific file types
k8s-sync /path/to/source my-pod -i "*.py" -i "*.js"
```

**Dependencies:**
- `kubectl` (must be configured)
- `fswatch` (install with: `brew install fswatch`)
- `git` (for Git mode, which is default)

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