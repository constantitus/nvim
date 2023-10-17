<h1 align="center">
    <br>
    My Neovim config
    <br>
</h1>

![screenshot](screenshots/1.png)

## About
My neovim config. Mostly stuff I've learned/stolen from other nvim users.
I'm doing my best to learn vim and use it as my main text editor and IDE.

## Installing:
This config is now using [lazy.nvim](https://github.com/folke/lazy.nvim), which can install itself.\
If you have previously used packer.nvim, make sure to delete `~/.local/share/nvim/site/pack/packer`.

Clone this repository into your $HOME.config folder and run `nvim +PackerSync`.\
Then run `:checkhealth` in nvim and install what you need with your package manager.

Configure to your liking

PS: I use CAPSLOCK instead instead of Esc in vim. 
My CAPSLOCK key is bound to escape and the capslock function is bound to SHIFT+CAPSLOCK.
>/etc/X11/xorg.conf.d/00-keyboard.conf
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "Xkblayout" "us"
        Option "XkbOptions" "caps:escape_shifted_capslock"

EndSection
```
>hyprland.conf
```
input {
    kb_layout = us
    kb_options = caps:escape_shifted_capslock
}
```



## TODO
- [ ] god, i need a vertical monitor so bad
- [x] tweak the  configs and change the keybinds
- [x] actually learn vim, lmao
- [x] greeter with cool ascii
