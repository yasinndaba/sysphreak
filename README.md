
**sysphreak v1.0.0** — by Yasin Ndaba  

A stylish, customizable terminal dashboard for Linux. Shows your username, a random quote, system info, and a cool ASCII world map (although it can be changed). Colors, fonts, and even the ASCII can be fully customized.  

---

## Features

- **Welcome banner** with your username (ASCII art optional)  
- **Random quotes** under the username  
- **System info**: OS, Host, Uptime, Resolution, CPU, GPU, Memory  
- **Stylized world map** in ASCII (optional as it is the default ASCII used)  
- **Customizable colors and fonts**  
- **Configurable via `~/.sysphreak.conf`**  
- **CLI options** for on-the-fly changes  
- **Permanent settings** saved automatically  

---

## Installation 

Clone the repo:

	git clone https://github.com/YasinNdaba/sysphreak

## Make the script executable:

	chmod +x sysphreak.sh

## Move it to a folder in your PATH (optional):

	sudo mv sysphreak.sh /usr/local/bin/sysphreak

## Add it to your shell startup file (~/.bashrc or ~/.zshrc):

		echo "sysphreak" >> ~/.zshrc

Next time you open your terminal, sysphreak will appear automatically.

---

## Options
**--help, -h** : Show help

**--version, -v** : Show version info

**--no-map** : Hide the ASCII world map

**--no-ascii** : Hide ASCII username

**--font (font name)** : Set figlet font for username

**--box-color (color name)** : Change box color

**--quote-color (color name)** : Change quote color

**--map-color (color name)** : Change map color

**--info-color (color name** : Change system info color

**--username-color (color name** : Change ASCII username color

## Colors Supported: 
		red, green, yellow, blue, magenta, cyan, white


## Customization

Edit the config file ~/.sysphreak.conf or use CLI options to save settings permanently.

**Example:**

sysphreak --box-color red --font slant --no-map

**All changes are saved automatically for the next terminal session.**

**Quotes**

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


## License

MIT License — feel free to fork, tweak, and make it your own.

## Note

**Written casually by Yasin Ndaba (VOIDARA).**
If you make tweaks, PRs are welcome!
