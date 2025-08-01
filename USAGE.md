# Cool Agent Usage Guide

## Quick Start

After running `./setup.sh`, you'll have access to these commands:

## 🔽 Move Recent Downloads

**Primary Command**: `move-recent-downloads` (alias: `mrd`, `downloads`)

### Basic Usage
```bash
# Move the most recent download to current directory
mrd

# Move the 3 most recent downloads
mrd 3

# Move downloads from the last 10 minutes
mrd --minutes 10
```

### Examples
```bash
# You just downloaded a PDF and want it in your current project
cd ~/projects/my-project
mrd                    # Moves the most recent file

# You downloaded several images for your website
cd ~/website/assets/images
mrd 5                  # Moves the 5 most recent files

# You want all files downloaded in the last hour
mrd --minutes 60       # Moves all files from last 60 minutes
```

## 📝 Quick Notes

**Command**: `quick-note` (alias: `note`, `qn`)

```bash
# Quick note from command line
note "Remember to update the documentation"

# Interactive note (type, then Ctrl+D to save)
note
```

Notes are saved to `~/Documents/quick-notes/` with timestamps.

## 🌿 Git Branch Cleanup

**Command**: `git-clean-branches` (alias: `git-clean`)

```bash
# Clean up branches that have been merged to main/master
cd your-git-repo
git-clean
```

This command:
- Switches to your default branch (main/master)
- Pulls the latest changes
- Shows you merged branches
- Asks for confirmation before deleting

## 🔧 Utility Aliases

The repository also includes many helpful aliases:

### File Operations
- `ll` - Detailed file listing
- `la` - Show hidden files
- `ltr` - List by time (recent last)
- `..`, `...`, `....` - Navigate up directories

### Git Shortcuts
- `gs` - git status
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- `glog` - Pretty git log

### System Utils
- `psg <process>` - Find process by name
- `myip` - Show your public IP
- `ports` - Show listening ports
- `du1` - Disk usage for current directory

### Utility Functions
- `mkcd <dir>` - Create and enter directory
- `extract <file>` - Extract any archive format
- `backup <file>` - Create timestamped backup

## 🚀 Cool Agent Management

- `cool-help` - Show available commands
- `cool-update` - Reload aliases without restarting terminal

## Real-World Scenarios

### Scenario 1: Web Development
```bash
# Download a new library, move it to your project
cd ~/projects/my-website
# Download jquery.min.js from browser
mrd                    # Moves it to your project

# Quick note about the change
note "Added jQuery 3.6.0 for carousel functionality"
```

### Scenario 2: Document Organization
```bash
# Move recent PDFs to a specific folder
cd ~/Documents/receipts
mrd --minutes 30       # Get all PDFs from last 30 minutes

# Or move specific number of recent files
cd ~/Documents/contracts
mrd 2                  # Move 2 most recent downloads
```

### Scenario 3: Project Cleanup
```bash
# Clean up your git repository
cd ~/projects/my-app
git-clean              # Remove merged branches
```

## Tips

1. **Use `mrd` frequently** - It's much faster than opening Finder and dragging files
2. **Combine with `cd` shortcuts** - Use `docs`, `dl`, `desk` to quickly navigate
3. **Create project-specific notes** - Use `note` to document quick thoughts
4. **Regular git cleanup** - Run `git-clean` weekly to keep repos tidy

## Adding Your Own Commands

See `examples/add-new-command.md` for a detailed guide on extending Cool Agent with your own utilities.

---

*Author: Yuwei Liang*