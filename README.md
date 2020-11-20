# osu-move
**_Move osu! beatmaps & skins to your osu! wine prefix with ease._**

If you find yourself tired of drag and dropping files like songs and skins to your osu! wine directory, then this simple af script I wrote is for you, whether you were lazy to make one on your own or have absolutely/close to no idea how to write shell script, you can use this freely to completely obliberate the fact of drag-dropping the files.

* The only dependency you need is [unarchiver](https://www.archlinux.org/packages/community/x86_64/unarchiver/) or **unar** for short. Otherwise, **it will not work!**

_But... **`why unarchiver?`**_ 

Well, basically to save some time checking the contents of `.osk` files (skins) before extracting I decided to use unarchiver to let it automatically detect if the archive we're extracting contains a single top-level directory and then extract it as it is, and if it doesn't, then it will create a top-level directory named the same as the `.osk` file and extract the contents inside, **pretty cool... huh?**
It would be a mess if you decide to one day download a skin and then unzip the `.osk` file into the Skins directory and it turns out it didn't have a single top-level folder.

# Installation
Put the script in `$HOME/bin` or whatever you want to put it on.

If this does not work after re-logging, then add an alias to your `.bashrc` or whatever shell you use.

_...or just use the script where you downloaded it to._

```
OPTIONS
	 -b (beatmaps)    will move every file that is a beatmap file (osz)
	 -s (skins)       will move every file is a skin file (osk)
	 -a (all)         move every single osu!-related file into their respective directories

CONFIGURATION
	 -d [OSU_DIR]     set or change the osu! directory
```
If something happens, please check that the script has sufficient permissions, with `chmod +rwx` it should be good.

~~I made this as an excuse to learn shell scripting, cool tbh.~~
