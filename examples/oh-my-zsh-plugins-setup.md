# Oh-My-Zsh Plugins Setup

This script helps you quickly set up useful oh-my-zsh plugins on any new laptop.

## What it does

The `install-oh-my-zsh-plugins` script automatically:

1. **Checks** if oh-my-zsh is installed
2. **Backs up** your current `.zshrc` configuration
3. **Installs** recommended plugins:
   - `z` - Smart directory jumping
   - `git-extras` - Additional git commands
   - `git-auto-fetch` - Auto-fetch from remotes
   - `github` - GitHub CLI integration
4. **Installs** git-extras package if needed (via Homebrew, apt, or yum)

## Usage

```bash
# Run the script
./bin/install-oh-my-zsh-plugins

# Or from anywhere if you have this repo cloned
cd /path/to/cool-agent
./bin/install-oh-my-zsh-plugins
```

## Prerequisites

- oh-my-zsh must be installed
- For git-extras installation: Homebrew (macOS), apt (Ubuntu/Debian), or yum (RHEL/CentOS)

## What you get

### z plugin
- `z <directory>` - Jump to frequently visited directories
- `z` - List most visited directories
- Learns from your navigation patterns

### git-extras plugin
- `git ignore` - Add files to .gitignore
- `git summary` - Repository summary
- `git effort` - Show effort statistics
- `git changelog` - Generate changelog
- `git setup` - Set up new repository

### git-auto-fetch plugin
- Automatically fetches updates from remote repositories
- Keeps your repos up to date

### github plugin
- GitHub CLI integration
- Useful aliases for GitHub operations

## Safety features

- Creates timestamped backup of your `.zshrc`
- Preserves existing plugins
- Removes duplicate plugins
- Error handling and colored output

## After installation

Run `source ~/.zshrc` or restart your terminal to activate the new plugins. 