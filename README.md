  ______   ______  _____ ____  _____    _    _  __
 / ___\ \ / / ___||  ___|  _ \| ____|  / \  | |/ /
 \___ \\ V /\___ \| |_  | |_) |  _|   / _ \ | ' / 
  ___) || |  ___) |  _| |  _ <| |___ / ___ \| . \ 
 |____/ |_| |____/|_|   |_| \_\_____/_/   \_\_|\_\
                                                  

**sysphreak v1.0.0** — by Yasin Ndaba  

A stylish, customizable terminal dashboard for Linux. Shows your username, a random quote, system info, and a cool ASCII world map(although can be changed). Colors, fonts, and even the ASCII can be fully customized.  

---

## Features

- **Welcome banner** with your username (ASCII art optional)
- **Random quotes** under the username
- **System info**: OS, Host, Uptime, Resolution, CPU, GPU, Memory
- **Stylized world map** in ASCII (optional as it is the default ASCII I used)
- **Customizable colors and fonts**
- **Configurable via `~/.sysphreak.conf`**
- **CLI options** for on-the-fly changes
- **Permanent settings** saved automatically  

---

## Installation

1. Clone the repo:

```bash
git clone https://github.com/YasinNdaba/sysphreak.git
cd sysphreak

    Make the script executable:

chmod +x sysphreak.sh

    Move it to a folder in your PATH (optional):

sudo mv sysphreak.sh /usr/local/bin/sysphreak

    Add it to your shell startup file (~/.bashrc or ~/.zshrc):

echo "sysphreak" >> ~/.zshrc

Next time you open your terminal, sysphreak will appear automatically.
Usage

sysphreak [options]

Options

    --help, -h Show help

    --version, -v Show version info

    --no-map Hide the ASCII world map

    --no-ascii Hide ASCII username

    --font <name> Set figlet font for username

    --box-color <color> Change box color

    --quote-color <color> Change quote color

    --map-color <color> Change map color

    --info-color <color> Change system info color

    --username-color <color> Change ASCII username color

Colors supported: red, green, yellow, blue, magenta, cyan, white
Customization

Edit the config file ~/.sysphreak.conf or use CLI options to save settings permanently. Example:

sysphreak --box-color red --font slant --no-map

All changes are saved automatically for the next terminal session.
Quotes

By default, sysphreak cycles through these quotes randomly:

    "The best way to predict the future is to code it... or break into it."

    "I'm not breaking the law; I'm testing the boundaries of your reality."

    "Keep pushing forward, $USERNAME."

    "Coffee first, code second."

    "Even a terminal can be beautiful."

    "Did you backup today? No? Do it now."

    "Hello $USERNAME, remember to breathe."

    "Every bug is a lesson in disguise."

You can edit or add quotes in ~/.sysphreak.conf.
License

MIT License — feel free to fork, tweak, and make it your own.
Note

Written casually by Yasin Ndaba (VOIDARA).
If you make tweaks, PRs are welcome!


---

If you want, I can **also add a cool ASCII logo and badges section** for GitHub so your repo looks fully polished and “pro hacker vibes” on first glance.  

Do you want me to do that?
