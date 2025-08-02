#!/bin/zsh

# Cool Agent CLI Aliases
# Author: Yuwei Liang

# Get the directory where this script is located
COOL_AGENT_DIR="$(cd "$(dirname "${(%):-%x}")/.." && pwd)"

# Add the bin directory to PATH if not already there
if [[ ":$PATH:" != *":$COOL_AGENT_DIR/bin:"* ]]; then
    export PATH="$COOL_AGENT_DIR/bin:$PATH"
fi

# === File and Directory Operations ===

# Move recent downloads
alias mrd='move-recent-downloads'
alias downloads='move-recent-downloads'

# Quick utilities
alias note='quick-note'
alias qn='quick-note'
alias git-clean='git-clean-branches'

# Enhanced ls commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ltr='ls -ltr'  # List by time, most recent last
alias lth='ls -lth'  # List by time, most recent first

# Enhanced directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Quick directory access
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias desk='cd ~/Desktop'

# === Git Shortcuts ===

alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'

# === System Utilities ===

# Process management
alias psg='ps aux | grep'
alias k9='kill -9'

# Network
alias myip='curl -s https://ifconfig.me'
alias localip='ipconfig getifaddr en0'
alias ports='lsof -i -P -n | grep LISTEN'

# Disk usage
alias du1='du -h -d 1'
alias dus='du -sh * | sort -hr'

# === Development ===

# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias serve='python3 -m http.server'

# Node.js
alias ni='npm install'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'

# === Kubernetes Utilities ===

# K8s sync
alias ksync='k8s-sync'
alias k8s-watch='k8s-sync'

# === Utility Functions ===

# Create and enter directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find and kill process by name
killp() {
    if [[ -z "$1" ]]; then
        echo "Usage: killp <process_name>"
        return 1
    fi
    
    local pids=($(pgrep -f "$1"))
    if [[ ${#pids[@]} -eq 0 ]]; then
        echo "No processes found matching '$1'"
        return 1
    fi
    
    echo "Found processes:"
    ps -p "${pids[@]}" -o pid,comm,args
    echo -n "Kill these processes? (y/N): "
    read response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        kill "${pids[@]}"
        echo "Processes killed."
    else
        echo "Cancelled."
    fi
}

# Extract various archive formats
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick file backup
backup() {
    if [[ -z "$1" ]]; then
        echo "Usage: backup <file_or_directory>"
        return 1
    fi
    
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_name="${1}.backup_${timestamp}"
    
    cp -r "$1" "$backup_name"
    echo "Backup created: $backup_name"
}

# === Cool Agent Specific ===

# Show available cool-agent commands
cool-help() {
    echo "Cool Agent CLI Utilities"
    echo "========================"
    echo ""
    echo "Commands:"
    echo "  mrd, downloads          - Move recent downloads to current directory"
    echo "  note, qn               - Quick timestamped notes"
    echo "  git-clean              - Clean up merged Git branches"
    echo "  ksync, k8s-watch       - Watch folder and sync to Kubernetes pod"
    echo "  cool-help              - Show this help"
    echo "  cool-update            - Update cool-agent aliases"
    echo ""
    echo "Run any command with --help for detailed usage."
}

# Update cool-agent
cool-update() {
    echo "Updating cool-agent aliases..."
    source "$COOL_AGENT_DIR/aliases/aliases.sh"
    echo "Cool-agent aliases updated!"
}

echo "Cool Agent CLI utilities loaded! Type 'cool-help' for available commands."