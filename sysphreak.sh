#!/bin/bash
# ╔══════════════════════════════════════════════════════════════╗
# ║                                                              ║
# ║         sysphreak v1.0.0 — by Yasin Ndaba                    ║
# ║                                                              ║
# ╚══════════════════════════════════════════════════════════════╝

CONFIG_FILE="$HOME/.sysphreak.conf"
VERSION="1.0.0"
AUTHOR="Yasin Ndaba"

# ------------------------
# CREATE CONFIG IF MISSING
# ------------------------
if [[ ! -f "$CONFIG_FILE" ]]; then
    cat <<'EOF' > "$CONFIG_FILE"
# ~/.sysphreak.conf — by Yasin Ndaba 😎
# Customize sysphreak however you like

# Colors (red, green, yellow, blue, magenta, cyan, white)
BOX_COLOR="magenta"
QUOTE_COLOR="cyan"
MAP_COLOR="green"
INFO_COLOR="yellow"
USERNAME_COLOR="blue"

# ASCII options
ASCII_FONT="slant"
SHOW_ASCII=true
SHOW_MAP=true

# Quotes (one per line)
QUOTES=(
"The best way to predict the future is to code it... or break into it."
"I'm not breaking the law; I'm testing the boundaries of your reality."
"Keep pushing forward, \$USERNAME."
"Coffee first, code second."
"Even a terminal can be beautiful."
"Did you backup today? No? Do it now."
"Hello \$USERNAME, remember to breathe."
"Every bug is a lesson in disguise."
)
EOF
    echo "First run: Created config at $CONFIG_FILE"
fi

# ------------------------
# LOAD CONFIG
# ------------------------
source "$CONFIG_FILE"

# ------------------------
# SAVE CONFIG FUNCTION
# ------------------------
save_config() {
    local key="$1"
    local value="$2"
    if grep -q "^$key=" "$CONFIG_FILE"; then
        sed -i "s/^$key=.*/$key=\"$value\"/" "$CONFIG_FILE"
    else
        echo "$key=\"$value\"" >> "$CONFIG_FILE"
    fi
}

# ------------------------
# COLOR DEFINITIONS
# ------------------------
declare -A COLOR_CODES=(
    [red]=$(tput setaf 1)
    [green]=$(tput setaf 2)
    [yellow]=$(tput setaf 3)
    [blue]=$(tput setaf 4)
    [magenta]=$(tput setaf 5)
    [cyan]=$(tput setaf 6)
    [white]=$(tput setaf 7)
)
COLOR_BOLD=$(tput bold)
COLOR_RESET=$(tput sgr0)

BOX_COLOR=${COLOR_CODES[$BOX_COLOR]:-${COLOR_CODES[magenta]}}
QUOTE_COLOR=${COLOR_CODES[$QUOTE_COLOR]:-${COLOR_CODES[cyan]}}
MAP_COLOR=${COLOR_CODES[$MAP_COLOR]:-${COLOR_CODES[green]}}
INFO_COLOR=${COLOR_CODES[$INFO_COLOR]:-${COLOR_CODES[yellow]}}
USERNAME_COLOR=${COLOR_CODES[$USERNAME_COLOR]:-${COLOR_CODES[blue]}}

# ------------------------
# DEFAULT SETTINGS
# ------------------------
ASCII_FONT=${ASCII_FONT:-standard}
SHOW_ASCII=${SHOW_ASCII:-true}
SHOW_MAP=${SHOW_MAP:-true}
BOX_WIDTH=80

# ------------------------
# WORLD MAP
# ------------------------
WORLD_MAP=$(cat <<'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⣠⣀⡀⣀⣠⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⢠⣠⣼⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⢠⣤⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣟⣾⣿⣽⣿⣿⣅⠈⠉⠻⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⢀⡶⠒⢉⡀⢠⣤⣶⣶⣿⣷⣆⣀⡀⠀⢲⣖⠒⠀⠀⠀⠀⠀⠀⠀
⢀⣤⣾⣶⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿⣽⡿⠻⣷⣀⠀⢻⣿⣿⣿⡿⠟⠀⠀⠀⠀⠀⠀⣤⣶⣶⣤⣀⣀⣬⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣦⣼⣀⠀
⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠓⣿⣿⠟⠁⠘⣿⡟⠁⠀⠘⠛⠁⠀⠀⢠⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠙⠁
⠀⠸⠟⠋⠀⠈⠙⣿⣿⣿⣿⣿⣿⣷⣦⡄⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣆⢘⣿⣯⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠉⢱⡿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡿⠦⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡗⠀⠈⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣉⣿⡿⢿⢷⣾⣾⣿⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⠿⠿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⣿⣷⣦⣶⣦⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣤⡖⠛⠶⠤⡀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠙⣿⣿⠿⢻⣿⣿⡿⠋⢩⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠧⣤⣦⣤⣄⡀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠘⣧⠀⠈⣹⡻⠇⢀⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣤⣀⡀⠀⠀⠀⠀⠀⠀⠈⢽⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⣴⣿⣷⢲⣦⣤⡀⢀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠂⠛⣆⣤⡜⣟⠋⠙⠂⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠉⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣾⣿⣿⣿⣿⣆⠀⠰⠄⠀⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⠿⠿⣿⣿⣿⠇⠀⠀⢀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢻⡇⠀⠀⢀⣼⠿⠇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠃⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
)

# ------------------------
# UTILITY FUNCTIONS
# ------------------------
cmd_exists() { command -v "$1" >/dev/null 2>&1; }
get_username() { whoami; }
get_os() { uname -o 2>/dev/null || echo "Unknown OS"; }
get_host() { hostname; }
get_uptime() { uptime -p; }
get_resolution() { cmd_exists xrandr && xrandr | grep '*' | awk '{print $1}' | head -n1 || echo "Resolution Unknown"; }
get_cpu() { lscpu | grep "Model name:" | sed 's/Model name:\s*//'; }

get_gpus() {
    if cmd_exists nvidia-smi; then
        nvidia-smi --query-gpu=name --format=csv,noheader 2>/dev/null || echo "No NVIDIA GPU"
    elif cmd_exists lspci; then
        lspci 2>/dev/null | grep -Ei 'vga|3d|display' | sed -E 's/.*: (.*)/\1/' || echo "No GPU detected"
    else
        echo "No GPU detected"
    fi
}

get_mem() {
    if cmd_exists free; then
        free -h | awk '/^Mem:/ {printf "%s TOTAL -- %s USED -- %s FREE\n", $2,$3,$4}'
    elif [[ -r /proc/meminfo ]]; then
        awk '/MemTotal/ {t=$2}/MemAvailable/ {f=$2} END {printf "%dGB TOTAL -- %dGB USED -- %dGB FREE\n", t/1024/1024, (t-f)/1024/1024, f/1024/1024}' /proc/meminfo
    else
        echo "Memory info unavailable"
    fi
}

print_box_line() {
    local char="${1:--}"
    local width=${2:-$BOX_WIDTH}
    printf "${BOX_COLOR}"
    printf '%*s\n' "$width" '' | tr ' ' "$char"
    printf "${COLOR_RESET}"
}

# ------------------------
# COMMAND-LINE OPTIONS
# ------------------------
while [[ "$1" != "" ]]; do
    case $1 in
        --help|-h)
            echo "Usage: sysphreak [options]"
            echo "Options:"
            echo "  --help, -h               Show this help message"
            echo "  --version, -v            Show version information"
            echo "  --no-map                 Hide the world map"
            echo "  --no-ascii               Hide ASCII username"
            echo "  --font <name>            Set figlet font for username"
            echo "  --box-color <color>      Change box color"
            echo "  --quote-color <color>    Change quote color"
            echo "  --map-color <color>      Change map color"
            echo "  --info-color <color>     Change system info color"
            echo "  --username-color <color> Change ASCII username color"
            exit 0
            ;;
        --version|-v)
            echo "sysphreak $VERSION"
            echo "Author: $AUTHOR"
            echo "Config: $CONFIG_FILE"
            exit 0
            ;;
        --no-map) SHOW_MAP=false; save_config SHOW_MAP false ;;
        --no-ascii) SHOW_ASCII=false; save_config SHOW_ASCII false ;;
        --font) shift; ASCII_FONT="$1"; save_config ASCII_FONT "$1" ;;
        --box-color) shift; BOX_COLOR=${COLOR_CODES[$1]:-$BOX_COLOR}; save_config BOX_COLOR "$1" ;;
        --quote-color) shift; QUOTE_COLOR=${COLOR_CODES[$1]:-$QUOTE_COLOR}; save_config QUOTE_COLOR "$1" ;;
        --map-color) shift; MAP_COLOR=${COLOR_CODES[$1]:-$MAP_COLOR}; save_config MAP_COLOR "$1" ;;
        --info-color) shift; INFO_COLOR=${COLOR_CODES[$1]:-$INFO_COLOR}; save_config INFO_COLOR "$1" ;;
        --username-color) shift; USERNAME_COLOR=${COLOR_CODES[$1]:-$USERNAME_COLOR}; save_config USERNAME_COLOR "$1" ;;
        *) echo "Unknown option: $1"; echo "Use --help for valid options."; exit 1 ;;
    esac
    shift
done

# ------------------------
# MAIN DASHBOARD
# ------------------------
clear
USERNAME=$(get_username)

# Welcome
echo -e "${USERNAME_COLOR}${COLOR_BOLD}Welcome, $USERNAME!${COLOR_RESET}\n"

# ASCII username
if $SHOW_ASCII && cmd_exists figlet; then
    figlet -f "$ASCII_FONT" "$USERNAME" | while IFS= read -r line; do
        echo -e "${USERNAME_COLOR}${line}${COLOR_RESET}"
    done
fi

# Random quote
if [[ ${#QUOTES[@]} -gt 0 ]]; then
    RANDOM_QUOTE="${QUOTES[RANDOM % ${#QUOTES[@]}]}"
    RANDOM_QUOTE="${RANDOM_QUOTE//\$USERNAME/$USERNAME}"
    echo -e "${QUOTE_COLOR}${RANDOM_QUOTE}${COLOR_RESET}\n"
fi

# World map
if $SHOW_MAP; then
    echo -e "${MAP_COLOR}"
    echo "$WORLD_MAP"
    echo -e "${COLOR_RESET}\n"
fi

# Box separator
print_box_line

# System info
echo -e "${INFO_COLOR}OS:        ${COLOR_RESET}$(get_os)"
echo -e "${INFO_COLOR}Host:      ${COLOR_RESET}$(get_host)"
echo -e "${INFO_COLOR}Uptime:    ${COLOR_RESET}$(get_uptime)"
echo -e "${INFO_COLOR}Resolution:${COLOR_RESET} $(get_resolution)"
echo -e "${INFO_COLOR}CPU:       ${COLOR_RESET}$(get_cpu)"
echo -e "${INFO_COLOR}GPUs:      ${COLOR_RESET}$(get_gpus)"
echo -e "${INFO_COLOR}Memory:    ${COLOR_RESET}$(get_mem)"

print_box_line
