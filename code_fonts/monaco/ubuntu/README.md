Patched Monaco Font for airline or powerline 
=============================================

Monaco font for airline or powerline vim plugin. Which is tested on gnome terminal in Ubuntu 18.04 LTS.
Don't change the name of the font files

INSTALL
=======
```
- Move **Ubuntu Mono derivative Powerline.ttf** to your home folder _~/.fonts_. If .fonts direcory does not exists create it (mkdir  ~/.fonts)
```bash
mkdir ~/.fonts
mv Ubuntu\ Mono\ derivative\ Powerline.ttf ~/.fonts
```
- Change to config directory and move **10-powerline-symbols.conf** to *~/.config/fontconfig/conf.d/*. If folders does not exists create them
```bash
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```
- Execute following in terminal in order to update font cache and close all terminal windows.
```bash
sudo fc-cache
```
- Open gnome terminal and select __Monaco for Powerline__ in terminal configuration window 
