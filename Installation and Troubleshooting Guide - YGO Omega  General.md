---
title: "Installation and Troubleshooting Guide - YGO Omega / General"
source: "https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/3802"
author:
  - "[[Duelists Unite]]"
published: 2021-10-23
created: 2026-02-05
description: "WindowsInstallationMethod 1:The easiest way to install the game is through the Windows installer found here: Release Latest · duelists-unite/omega-releases · GitHub The installer itself is not properly signed…"
tags:
  - "clippings"
---
- [Windows](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#windows-1)
	- [Installation](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#installation-2)
		- [Method 1:](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#method-1-3)
		- [Method 2:](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#method-2-4)
	- [Troubleshooting](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#troubleshooting-5)
		- [Case 1:](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-1-6)
		- [Case 2:](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-2-7)
		- [Case 3:](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-3-8)
		- [Case 4](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-4-9)
		- [Case 5](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-5-10)
- [Linux](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#linux-11)
	- [Requirements for all distributions](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#requirements-for-all-distributions-12)
	- [Installation on Linux](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#installation-on-linux-13)
	- [Troubleshooting Linux](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#troubleshooting-linux-14)
	- [Case 1: My game crashes as soon as it launches](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-1-my-game-crashes-as-soon-as-it-launches-15)
		- [How to check and fix kernel driver (AMD Only)](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#how-to-check-and-fix-kernel-driver-amd-only-16)
		- [Debian-based Distros](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#debian-based-distros-17)
		- [Ubuntu](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#ubuntu-18)
			- [AMD](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#amd-19)
			- [Nvidia](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#nvidia-20)
		- [Fedora](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#fedora-21)
			- [AMD](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#amd-22)
			- [Nvidia](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#nvidia-23)
		- [Arch Linux](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#arch-linux-24)
			- [AMD](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#amd-25)
			- [Nvidia](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#nvidia-26)
			- [Is Vulkan working?](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#is-vulkan-working-27)
	- [Case 2: 9999/9999 Decks Bug](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-2-99999999-decks-bug-28)
	- [Case 3: My game is stuck in a black screen and never shows the opening menu.](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-3-my-game-is-stuck-in-a-black-screen-and-never-shows-the-opening-menu-29)
	- [Case 4: I want to play Online, but my YGO Omega can not detect my Discord. (AKA Discord for Linux)](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#case-4-i-want-to-play-online-but-my-ygo-omega-can-not-detect-my-discord-aka-discord-for-linux-30)
		- [Debian based Distros/Ubuntu](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#debian-based-distrosubuntu-31)
		- [Fedora](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#fedora-32)
		- [Arch Linux](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#arch-linux-33)
	- [How to remove Discord.Snap and Flatpak files.](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#how-to-remove-discord-snap-and-flatpak-files-34)
		- [Snap It Off (How to remove snap Discord)](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#snap-it-off-how-to-remove-snap-discord-35)
			- [Debian Based Distros/Ubuntu](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#debian-based-distrosubuntu-36)
			- [Arch Linux](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#arch-linux-37)
			- [Fedora](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#fedora-38)
		- [How to remove Flatpaks](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/#how-to-remove-flatpaks-39)

[![](https://forum.duelistsunite.org/user_avatar/forum.duelistsunite.org/antimetaman/48/3_2.png)](https://forum.duelistsunite.org/u/antimetaman)

[AntiMetaman](https://forum.duelistsunite.org/u/antimetaman) Founder

[Oct 2021](https://forum.duelistsunite.org/t/installation-and-troubleshooting-guide/3802 "Post date")

## Windows

## Installation

### Method 1:

1. The easiest way to install the game is through the Windows installer found here:
	- The installer itself is not properly signed because that is an expensive process. Because of this, you will get warnings that the file is unsafe. This is normal for programs that are not signed. The installer is 100% safe to use.
2. The game is portable so it means you can move the installation directory and it will still work.
3. The installer opens the “Omegaupdater.exe” which downloads the game and all the updates. In addition, it checks for any other issues like lack of.NET updates or firewall exceptions.
4. The folder in which YGO Omega is installed in, has to be writable or the omegaupdater will fail.

### Method 2:

1. Download the Omega Launcher.zip.
2. Unzip it to any directory in a location that has write permissions.
3. Run the omegaupdater.exe.
4. This will download the entire game. If the omegaupdater fails, you will see an update.zip in the folder. This means it couldn’t extract the update.zip because the folder doesn’t have permissions.
5. You can either right-click on the folder->properites->untick Read-only OR you can just use Method 1.

---

## Troubleshooting

### Case 1:

The most common case is that you run the OmegaUpdater and it is successfully able to download the update.zip but does not have permissions to extract and overwrite the files in the folder. This is because the folder is not writable.

To fix this, move the folder to the desktop or right-click → properties and untick the read only. Then press ok and re-run the omegaupdater.

If this still doesn’t work, then you should try the Windows Installer from the github link above.

### Case 2:

You are on Windows 7 or 8. In this case, your OS is lacking updates which are required to execute the updater. The updater needs all the latest.NET updates but Microsoft no longer supports Windows 7 or 8 so you can no longer get automatic updates.

Upgrading to Windows 10 is free and increases the performance overall of the entire pc. You don’t lose any files by upgrading.

You can download the Windows10Upgrade program from Microsoft here: [https://go.microsoft.com/fwlink/?LinkID=799445](https://go.microsoft.com/fwlink/?LinkID=799445)

NB: Windows 7 is not Supported.

### Case 3:

You get a black screen when opening the game. This is because your system doesn’t have the proper codecs to play video backgrounds. There’s two options and I suggest the first.

1. You download the codec so you can use animated backgrounds from:  
	[Download K-Lite Codec Pack Full](https://www.codecguide.com/download_k-lite_codec_pack_full.htm)

This will install all the necessary required codecs.

1. You can open command prompt. Navigate to the folder where the YGO Omega folder is. Then type `"YGO Omega.exe" --reset`

This will just reset it to static backgrounds.

### Case 4

If your game is freezing, it’s because you are using windowed mode. It’s an inherent issue with Windows / Unity. A fix will come but the workaround is to use Windows 8 compatibility. Also disable the full screen optimizations.

[![unknown](https://duelistsunite.b-cdn.net/optimized/2X/0/0d6bd0363c108601911dd6f65255740d1cf92897_2_10x10.png)](https://duelistsunite.b-cdn.net/original/2X/0/0d6bd0363c108601911dd6f65255740d1cf92897.png "unknown")

### Case 5

If your game launches and immediately gets stuck on the background picture without downloading any bundles, it’s possible that you have something that is blocking [gitlab.com](http://gitlab.com/). This will show up in the player.log in `%userprofile%\appdata\locallow\duelists unite\ygo omega` as an error resolving gitlab. If you use a custom DNS server or something like a Pi-Hole, you may need to make sure that gitlab is whitelisted or at least not on the blacklist and that you can access [gitlab.com](http://gitlab.com/) from your browser. Once you allow gitlab, restart YGO Omega and it should start downloading bundles.

---

## Linux

## Requirements for all distributions

All Linux Distros require an up-to-date Vulkan API. as well as Kerberos 5 (most Distros ship Kerberos preinstalled) In addition some Distros require Sqlite3 development packages

| Distros | Command |
| --- | --- |
| Debian/Ubuntu: | `sudo apt install libsqlite3-dev` |
| Fedora: | `sudo dnf install sqlite-devel` |

Arch currently does not have to worry about this

---

## Installation on Linux

1. The easiest and best way to install the game is through the Linux installer found here:
	[https://github.com/duelists-unite/omega-releases/releases/download/Latest/Omega\_Launcher-Linux.zip](https://github.com/duelists-unite/omega-releases/releases/download/Latest/Omega_Launcher-Linux.zip)
2. Make a directory in which to install YGO Omega into. This can be done by making a new folder in the Desktop interface or by mkdir in the terminal interface. (best practice is to name the folder something relatively simple I.E. ygomega)
3. Extract the.zip into the folder you had previously made. Be sure to make OmegaUpdater an executable file. (Right click → Properties → Permissions)

\*\* To Extract the zip file in cmd line, install

```bash
sudo apt-get install unzip -y
```

and then run

```python
unzip Omega_Launcher-Linux.zip
```
1. Open the terminal, navigate to the same folder as OmegaUpdater and run:  
	`./OmegaUpdater`  
	\* This will download the game for you on that same folder.
2. After that is finished make the YGO Omega executable, this can be done by the right click method in the desktop or by opening the folder in the terminal and typing the command:
```bash
chmod 755 -R
```

When this is complete either run YGO\\ Omega by a double click in the desktop or from the terminal by using this Bash command while in the YGOmega Folder:

```
./YGO\ Omega
```
1. You also need Discord installed and running to connect to the online servers. Make sure you install the version from their site [https://discord.com/](https://discord.com/). No snap or flatpak, whose will not work. This is also covered in depth in “Discord for Linux”

---

## Troubleshooting Linux

## Case 1: My game crashes as soon as it launches

My game does not start at all/ my game crashes as soon as it launches/ when I try to run the game from terminal it says Segmentation fault (Core Dumped) or something.

![Screenshot from 2021-01-14 22-01-50](https://duelistsunite.b-cdn.net/original/2X/5/5f098d45675892dae3c3e207989b60cca0cdd28d.png)

This is normally caused by improperly set up Vulkan drivers OR in case of AMD having the radeon kernel driver loaded instead of amdgpu.

### How to check and fix kernel driver (AMD Only)

To check your kernel driver run `lspci -nnk | grep -iA3 vga` in terminal. (can be done with ctrl+alt+t)

[![Screenshot from 2021-01-14 22-03-29](https://duelistsunite.b-cdn.net/optimized/2X/e/e59f06b0896a2d2bba21322f797047861c62334c_2_10x10.png)](https://duelistsunite.b-cdn.net/original/2X/e/e59f06b0896a2d2bba21322f797047861c62334c.png "Screenshot from 2021-01-14 22-03-29")

if the result like the screen above shows radeon is in use but amdgpu is available do the following:

```bash
echo "blacklist radeon" | sudo tee --append /etc/modprobe.d/blacklist.conf
echo "options amdgpu si_support=1 cik_support=1" | sudo tee --append /etc/modprobe.d/amdgpu.conf
```

then depending on your distribution:

|  | Command |
| --- | --- |
| Debian/Ubuntu: | `sudo update-initramfs -u ` |
| Fedora: | `sudo dracut -v -f` |
| Arch: | `sudo mkinitcpio -P` |

then reboot and rerun ` lspci -nnk | grep -iA3 vga` to verify amdgpu is loaded.

\* If the above does not apply to you or the problem continues I will lay out the ways to set up various drivers, and if need the repositories, to ensure your Vulkan API is up to date.

### Debian-based Distros

You will need to open the terminal (ctrl+alt+t) and enter this in the command line:

|  | Command |
| --- | --- |
| AMD: | `apt install libvulkan1 mesa-vulkan-drivers vulkan-utils` |
| NVIDIA: | `apt install vulkan-utils` |

### Ubuntu

#### AMD

On Ubuntu it is best to enable the repositories for AMD. Its actually a fairly simple command tree.

```bash
sudu add-apt-repository ppa:oibaf/graphics-drivers
sudo apt update
sudo apt upgrade
```

After you run these commands be sure to install the Vulkan drivers:

```
apt install libvulkan1 mesa-vulkan-drivers vulkan-utils
```

#### Nvidia

Nvidia is extremely simple as it has built in Vulkan Drivers and all we need to do is add the repository.

```bash
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
```

After the repository is downloaded be sure to add your drivers:

```bash
sudo apt install nvidia-graphics-drivers-396 nvidia-settings vulkan vulkan-utils
```

### Fedora

#### AMD

Fedora comes out of the box with AMD drivers. If you need to do anything it would only be a simple update.

```
dnf install vulkan vulkan-info
```

#### Nvidia

Nvida is going to be a repository add, but the good thing about repositories is they auto-update.

[![Screenshot from 2021-01-15 04-23-24](https://duelistsunite.b-cdn.net/optimized/2X/3/388481fdaf0446068b649bf7555222715cb5686a_2_10x10.png)](https://duelistsunite.b-cdn.net/original/2X/3/388481fdaf0446068b649bf7555222715cb5686a.png "Screenshot from 2021-01-15 04-23-24")

After you install the repository be sure to install the drivers.

### Arch Linux

#### AMD

Arch has the latest AMD drivers out of the box on install. All you need to do is install Vulkan support.

```
pacman -S vulkan-radeon lib32-vulkan-radeon
```

#### Nvidia

All Nvidia owners need to do here is install the latest drivers. They include Vulkan support.

```
pacman -S nvidia lib32-nvidia-utils
```

#### Is Vulkan working?

No matter your distro or your chosen installation method one thing remains important. Is Vulkan doing its job? There is a very simple command that is relatively the same across all distros to check and see if Vulkan is indeed doing its job.

```
vulkaninfo | less
```

if Vulkan is working you should get a reply similar to this, and yes it will be about 20 pages with less.

[![Screenshot from 2021-01-15 04-39-18](https://duelistsunite.b-cdn.net/optimized/2X/9/96194032cf8b081611e6c8ed6afe6dabffe7f8f4_2_10x10.png)](https://duelistsunite.b-cdn.net/original/2X/9/96194032cf8b081611e6c8ed6afe6dabffe7f8f4.png "Screenshot from 2021-01-15 04-39-18")

As long as you see some information then you know that Vulkan is working.

## Case 2: 9999/9999 Decks Bug

![Screenshot from 2021-04-28 22-32-51](https://duelistsunite.b-cdn.net/original/2X/8/8d60f48a9cfbfa8f24870903b65b91509784e8ac.jpeg)

This is caused by missing Sqlite3 dev pakages simply open a terminal install them as instructed above under Installation on Linux then reboot the system

## Case 3: My game is stuck in a black screen and never shows the opening menu.

This happens from using animated backgrounds in a system where those are not supported. In case of Linux this is a flaw in Unity itself. For a quick fix run the game via terminal but add a ‘–reset’ parameter like this:  
`./YGO\ Omega --reset`  
This will revert your settings to default.

*If you still want to use animated backgrounds in Linux you need to use specifically webm videos with VP8 codex. This type of videos use more cpu than the usual mp4, so try to use small videos around 5-10MB. Make sure you have a working video at the root of Backgrounds folder.*

## Case 4: I want to play Online, but my YGO Omega can not detect my Discord. (AKA Discord for Linux)

This is a very common occurrence with YGO Omega. *YGO Omega will not detect Discord built from.snap files or flatpak files. It is best practice to remove these installations before installing a non sandbox version.* Discord can be a bit tricky as it likes to install from.snap on its website if you are not paying close attention. First I will walk you through all the ways to install Discord from non snap files on most major Distros, then I will walk you through how to remove the snap version of Discord if you happen to be one of the unfortunate many who ended up with it.

#### Debian based Distros/Ubuntu

This can be done one of two ways. First we can go to Discord’s official website

[https://discord.com/download](https://discord.com/download)

Once there you can easily download the deb file by picking it from options.

![Screenshot from 2021-01-19 20-30-22](https://duelistsunite.b-cdn.net/original/2X/9/9e3f6cb3bc75c242734660fb3c0fa1aa6a2078cc.png)

*If you like a more terminal based approach you can download discord by performing the following command in the Terminal Interface.*

Regardless of your chosen download preference both packages can be installed the same way. Open a terminal screen (Ctrl+Alt+T) and enter the following command:

```
sudo dpkg -i /path/to/discord.deb
```

\* Just replace /path/to/discord/ with the actual path to discord.deb

If all goes well, you should be able to link YGO Omega to your discord seamlessly after you log in to Discord.

#### Fedora

Discord can Installed on Fedora via RPM fusion same as the NVIDIA drivers

```ruby
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

then

```bash
sudo dnf install discord
```

#### Arch Linux

To install discord from the terminal execute this simple command:

```bash
sudo pacman -S Discord
```

If simplicity is not your cup of tea follow the directions listed below:

First we will download Discord from the source as I do not like working things around in Arch Linux. We can do this by using curl. Open your terminal and perform the following command.

After Discord is downloaded the installation can be performed with the following command:

```
tar -xzvf discord-0.0.5.tar.qz
```

This command will make a directory and decompress all of discord files. You can run Discord from this file directly or if you so choose ( i hate looking through files every time I want to run a program) you can move it to the desktop by entering the following command:

```bash
sudo mv Discord /usr/local/bin
```

After you log in to Discord, you can open YGO Omega, go online, and enjoy YGO Omega to the fullest.

## How to remove Discord.Snap and Flatpak files.

### Snap It Off (How to remove snap Discord)

#### Debian Based Distros/Ubuntu

First we need to find the snap (its normally just snap Discord, but I thought it better to show the whole process.)  
Open the Terminal and follow these commands:

```
snap list
```

this will pull up a list of installed snap on your system. Locate the snap you wish to remove (in this case Discord) and enter the following command:

```bash
sudo snap remove discord
```

#### Arch Linux

Arch works much the same way as Ubuntu as far as snaps go.

```
snap list
```

will get you a list of all current snaps (again we only want the discord snap.) then execute the following command to remove the snap:

```csharp
snap remove discord
```

#### Fedora

Fedora doesn’t natively use snaps so this shouldn’t be an issue.

### How to remove Flatpaks

Flatpak is very simple to install and remove. I will not be going over flatpak installation of discord as flatpak discord does not work with YGO Omega. I will quickly go over how to remove flatpaks.

In order to remove a flatpak package, in this case Discord, open the terminal and execute the following command:

```
flatpak uninstall discord
```

This will remove the discord flatpak.

- [FAQ - YGO Omega](https://forum.duelistsunite.org/t/faq-ygo-omega/179)
- [Bug cant play the game](https://forum.duelistsunite.org/t/bug-cant-play-the-game/5690/2)
- [YGO Omega Guide](https://forum.duelistsunite.org/t/ygo-omega-guide/519)
- [Black Screen After Online Update](https://forum.duelistsunite.org/t/black-screen-after-online-update/4403/2)
- [Abyss Actor Comic Relief pendulum effect make the game crash](https://forum.duelistsunite.org/t/abyss-actor-comic-relief-pendulum-effect-make-the-game-crash/5799/2)

## Comments

9 months later

  

[Powered by Discourse](https://discourse.org/powered-by)