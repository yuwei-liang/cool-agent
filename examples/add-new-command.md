# Adding New Commands to Cool Agent

This guide shows how to add new CLI utilities to your Cool Agent repository.

## Step 1: Create Your Script

Create a new executable script in the `bin/` directory:

```bash
# Create the script file
touch bin/my-new-command

# Make it executable
chmod +x bin/my-new-command
```

## Step 2: Write Your Script

Here's a template for a new command:

```bash
#!/bin/zsh

# my-new-command - Brief description of what it does
# Author: Yuwei Liang

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Help function
show_help() {
    echo "Usage: my-new-command [OPTIONS] [ARGUMENTS]"
    echo ""
    echo "Description of what your command does."
    echo ""
    echo "OPTIONS:"
    echo "  -h, --help       Show this help message"
    echo "  -v, --verbose    Verbose output"
    echo ""
    echo "EXAMPLES:"
    echo "  my-new-command              # Basic usage"
    echo "  my-new-command --verbose    # With verbose output"
    echo ""
    echo "Author: Yuwei Liang"
}

# Parse arguments
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -*)
            echo -e "${RED}Error: Unknown option $1${NC}"
            echo "Use -h or --help for usage information."
            exit 1
            ;;
        *)
            # Handle positional arguments here
            echo -e "${BLUE}Processing: $1${NC}"
            shift
            ;;
    esac
done

# Your command logic goes here
if [[ "$VERBOSE" == true ]]; then
    echo -e "${YELLOW}Running in verbose mode...${NC}"
fi

echo -e "${GREEN}✓ Command completed successfully!${NC}"
```

## Step 3: Add an Alias (Optional)

Edit `aliases/aliases.sh` to add convenient aliases:

```bash
# Add this to the appropriate section in aliases/aliases.sh
alias mnc='my-new-command'
```

## Step 4: Update Help Documentation

Update the `cool-help` function in `aliases/aliases.sh`:

```bash
# In the cool-help function, add your command:
echo "  mnc                    - My new command description"
```

## Step 5: Test and Deploy

```bash
# Re-run setup to update everything
./setup.sh

# Or just reload aliases
source ~/.zshrc

# Test your new command
my-new-command --help
mnc --help
```

## Examples of Useful Commands to Add

- **File organizers**: Sort files by type, size, or date
- **Project generators**: Create boilerplate code for different frameworks
- **System monitors**: Check disk space, memory usage, or running processes
- **API tools**: Quick HTTP requests or JSON formatting
- **Text processors**: String manipulation utilities
- **Development helpers**: Build scripts, test runners, or deployment tools

## Best Practices

1. **Always include help text** with `--help` option
2. **Use colors** for better user experience
3. **Handle errors gracefully** with meaningful messages
4. **Follow naming conventions** (lowercase with hyphens)
5. **Include your name** as the author
6. **Test thoroughly** before committing
7. **Document in README** if the command is complex

Happy scripting! 🚀