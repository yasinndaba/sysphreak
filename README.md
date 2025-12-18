
<h1>sysphreak v1.0.0 — by Yasin Ndaba</h1>  

aka **System Freak**

A stylish, customizable terminal dashboard for Linux. Shows your username, a random quote that changes on every instance, system info, and a cool ASCII world map (although it can be anyhting). colors, fonts, and even the ASCII can be fully customized.

---

## 1. Features

- **Welcome banner** with your username (ASCII art optional)  
- **Random quotes** under the username  
- **System info**: OS, Host, Uptime, Resolution, CPU, GPU, Memory  
- **Stylized world map** in ASCII (optional as it is the default ASCII used)  
- **Customizable colors and fonts**  
- **Configurable via `~/.sysphreak.conf`**  
- **CLI options** for on-the-fly changes  
- **Permanent settings** saved automatically  

---

## 2. Installation 

Clone the repo:

	git clone https://github.com/YasinNdaba/sysphreak

## Make the script executable:

	chmod +x sysphreak.sh

## Move it to a folder in your PATH (optional):

	sudo mv sysphreak.sh /usr/local/bin/sysphreak

## Add it to your shell startup file (~/.bashrc or ~/.zshrc):

		echo "sysphreak" >> ~/.zshrc

Next time you open your terminal, sysphreak will appear automatically.

## Requirements for Different Distros

If you have any issues try installing these depending on your distro:

🟢 Ubuntu / Debian / Kali / Pop!_OS

		sudo apt update
		sudo apt install bash figlet coreutils procps util-linux pciutils x11-xserver-utils -y

🔵 Fedora / RHEL / CentOS

		sudo dnf install bash figlet util-linux pciutils procps-ng xorg-x11-server-utils -y

🟣 Arch / Manjaro

		sudo pacman -S bash figlet util-linux pciutils procps-ng xorg-xrandr --needed

🟠 OpenSUSE

		sudo zypper install bash figlet util-linux pciutils procps xrandr

---


## 3. Termux Installation

**Install Requirements**

1️⃣. **Run these in Termux:**

		pkg update && pkg upgrade -y
		pkg install bash figlet util-linux coreutils grep awk sed procps termux-tools -y

These provide everything the script needs (bash, figlet, free, uptime, etc.).

2️⃣. **Clone and Setup**

		git clone https://github.com/YasinNdaba/sysphreak
  	    cd sysphreak
		chmod +x sysphreak.sh
		
Now you can run it directly

		./sysphreak.sh

Maybe, you would like it and want it to run system-wide.

		mv sysphreak.sh $PREFIX/bin/sysphreak

Now you can run it with:

		sysphreak
		
3️⃣. **Auto-run on startup (optional)**

If you want it to start every time you open Termux:

		echo "bash sysphreak" >> ~/.bashrc
	
Or if you’re using zsh in Termux:

		echo "bash sysphreak" >> ~/.zshrc

Now close and reopen Termux — it should load automatically.

**if it still doesnt autostart on Termux launch, try:**

Run this once in Termux:

		echo "bash ~/sysphreak/sysphreak.sh" >> ~/.bash_profile

Or if you’re using zsh in Termux:

		echo "bash ~/sysphreak/sysphreak.sh" >> ~/.zsh_profile

if you dont know your shell, run this:
		echo $SHELL
		
you,ll know by looking at the end of the output. e.g. **usr/bin/bash** or **usr/bin/zsh**

4️⃣. **Minor tweaks for Termux**

Termux doesn’t have a “GPU” or display resolution, so those lines will show:

		Resolution Unknown
		No GPU detected

That’s normal and harmless. You can comment out those lines in the script if you prefer a cleaner look.

**6. Recommended:**

Install figlet fonts if you want to play with fonts:

		pkg install figlet toilet -y

Then list fonts:

		figlet -I2

Use them with:

		sysphreak --font slant
---

## 4. Available Options

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

---

## 5. Customization

Edit the config file ~/.sysphreak.conf or use CLI options to save settings permanently.

**CLI Example:**

		sysphreak --box-color red --font slant --no-map

**Config file Example**

		nano ~/.sysphreak.conf		

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

---


# 6.Removal

1️⃣. **Remove from Shell Startup**

For incase you want to remove this script:

If you added it to your shell config (.bashrc or .zshrc):

For Bash:

		nano ~/.bashrc

For Zsh:

		nano ~/.zshrc

Scroll to the line that says:

		sysphreak

Delete that line, save **(Ctrl+O), exit (Ctrl+X)**.

2️⃣. **Remove the Executable**

If you copied it to a system path like **/usr/local/bin** or **/usr/bin:**

		sudo rm /usr/local/bin/sysphreak

or

		sudo rm /usr/bin/sysphreak


**If you kept it in your project folder, just delete that folder:**

		rm -rf ~/Documents/Projects/sysphreak

3️⃣. **Remove Config File (Optional)**

If you want to completely erase all settings:

		rm ~/.sysphreak.conf
---

## 7. License

MIT License — feel free to fork, tweak, and make it your own.

---

## 8. Note

**Written casually by Yasin Ndaba (VOIDARA).**
If you make tweaks, PRs are welcome!

---
