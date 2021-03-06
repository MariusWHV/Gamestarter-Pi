# Gamestarter Pi
![Gamestarter-logo](https://github.com/bite-your-idols/gamestarter/raw/master/assets/gamestarter-logo-dark.jpg)

English/[Spanish](https://github.com/bite-your-idols/gamestarter/blob/master/README-ES.md)


## Retrogamig addon for Raspberry Pi's Kodi.

If you use a Raspberry Pi as a media center running Kodi on [LibreELEC](https://libreelec.tv/) or [OpenELEC](http://openelec.tv/), you like retrogaming and you want to launch games just as you do with movies and tv shows without dual-booting, swaping SD memories, complex installations... Here you have the definitve solution.

With this addon you will continue with your own customized Kodi but empowered including: 
- AMIGA (UAE4ARM or lr uae4arm), ARCADE (lr Mame2003 with hiscores and lr FBA next), Atari 2600 (lr stella), Atari Lynx (lr handy), Sega GameGear (lr picodrive), Sega Master System (lr picodrive), Sega Megadrive/MegaCD (lr picodrive), Nintendo Game Boy/Game Boy Color (lr Gambatte), Nintendo NES (lr fceumm), Super Nintendo (lr pocketsnes), Nintendo Game Boy Advanced (lr gpsp), Nintendo 64 (lr glupen64), MSX (lr bluemsx), Magnavox Odyssey/Phillips Videopac (lr o2em), NeoGeo (lr FBA next), Turbografx/PC Engine/PC Engine CD (lr mednafen_pce_fast), Sony Playstation (lr pcsx_rearmed), Sony PSP (lr ppsspp), ZX Spectrum (lr fuse), PC Ports (libretro CaveStory, Quake and Doom).

- Everything integrated in your Kodi library thanks to AdvacedLauncher/Advanced Emulator Launcher addon, using Retroarch as frontend for configuration and settings (including joypad configs) and some test freeware roms.

Also, you will have the choice of one-click installation of:
- Emulationstation frontend,
- Internet Archive ROM Launcher addon to launch games from the "cloud",
- 3 GameMaker Pi ports including modern masterpiece "Maldita Castilla".


## Installation Instructions
Download the latest release of the addon from [Releases Page](https://github.com/bite-your-idols/Gamestarter-Pi/releases/latest), copy into your Raspberry Pi and select "install from zip" in Settings>Addons menu. The first time the addon is launched it will perform some settings. Then copy your [roms and bios](https://github.com/libretro/Lakka/wiki/ROMs-and-BIOSes) to /storage/emulators/ folder via ftp or [samba](http://wiki.openelec.tv/index.php/Accessing_Samba_Shares) and reboot.

Then you can open addon settings to install additional features such as Internet Archive ROM Launcher, EmulationStation frontend and so on.

![screenshot-addon](https://github.com/bite-your-idols/gamestarter/raw/master/assets/screenshot-gamestarter.png)



.


## RetroArch:
The easiest and fastest way of retrogaming is using [Retroarch](http://www.libretro.com/). This will start by default the first time you launch the Gamestarter addon after the first-time-installation. Also, you can access it when playing even if you launch the game from kodi or emulationstation.

The first time RetroArch is launched I recommend to update (Settings menu> Online Updater) databases and download boxarts/thumbnails. Then you can create your own playlists, start games, change cores, user dynamic wallpapers... just like in [Lakka](http://www.lakka.tv/) distro!!

![screenshot-retroarch](https://github.com/bite-your-idols/gamestarter/raw/master/assets/screenshot-retroarch.gif)

.

## AdvancedLauncher:

The most "Kodi-like" way to launch games is using [AdvancedLauncher](https://github.com/edwtjo/advanced-launcher), located also under Program Addons. Using this you will get all your games integrated in Kodi's library, just like your movies or music.


![screenshot-advlauncher-context](https://github.com/bite-your-idols/gamestarter/raw/master/assets/screenshot-advlauncher-context.png)


There is a default/example launchers/games list I created. You can edit list, scan for your games, edit emulator cores... everything using contextual menu.


![screenshot-advlauncher-edit](https://github.com/bite-your-idols/gamestarter/raw/master/assets/screenshot-advlauncher-edit.png)


![screenshot-advlauncher-edit](https://github.com/bite-your-idols/Gamestarter-Pi/raw/master/assets/screenshot-gamestarter-advlauncher-mimic.png)
Example of Kodi's game "library" with [Mimic Skin](http://kodi.wiki/view/Add-on:mimic).
.

----


## Bonus

#### EmulationStation:
From addon setting you can install [EmulationStation](https://github.com/Herdinger/EmulationStation) frontend.
You can customize system lists editing /storage/.config/emulationstation/es_systems.cfg file
![screenshot-emulationstation](https://github.com/bite-your-idols/gamestarter/raw/master/assets/screenshot-emulationstation.png)

.

> This frontend does not work in OE6-.

.

#### Amiga emulation:

Amiga Emulation is a little tricky and you can choose between uae4arm-libretro experiemntal core and  [UAE4ARM Pi](https://www.raspberrypi.org/forums/viewtopic.php?t=110488) port. You can not launch emulator into GUI by now, but you can launch games from Kodi's Advanced Launcher or Emulationstation. Games must be ".adf" files. All files from Multi-disk games must be named the same adding "_Disk1.adf", "_Disk2.adf"... like this:

> name of the game_Disk1.adf

> name of the game_Disk2.adf

> name of the game_Disk3.adf

> ...

With non libretro emulator you will need a mouse in order to start games and a keyboard to exit, save/load states...

.


#### GameMaker Pi:
As an extra feature, there is an optional installation of three free games from [GameMaker Team](http://yoyogames.com/pi) using addon settings.

> These games only work with Xbox Controller :(

> These games have sound issues in OE7+.

More info [here](https://github.com/bite-your-idols/gamemaker-pi).

.


#### Internet Archive ROM Launcher:

Finally, after installing from Addon settings, you can use Video Addons > IARL addon, it will launch Games hosted on the Internet Archive. 

More info: [IARL](https://github.com/zach-morris/plugin.program.iarl/wiki)


.



## Credits

- Original RetroArch addon by [Mezo](http://openelec.tv/forum/128-addons/72972-retroarch-addon-arm-rpi)

- UAE4ARM & EmulationStation compiled by [Escalade](https://forum.libreelec.tv/thread-302.html)

- AdvancedLauncher "skin" images by [tronkyfran](https://github.com/HerbFargus/es-theme-tronkyfran)







