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
This config is now using [lazy.nvim](https://github.com/folke/lazy.nvim), which doesn't require additional steps to install.\
Just clonning this repository into your `$HOME/.config` should be enough.\
If you have previously used packer.nvim, make sure to delete `~/.local/share/nvim/site/pack/packer`.\
Then open up nvim, run `:checkhealth` and install what you need with your package manager.

Configure to your liking

On top of my vim config, I've set my `CAPS LOCK` key to be mapped to `Esc` and my key repeat delay lower from my wayland compositor's config file.
>hyprland.conf
```
input {
    kb_layout = us
    kb_options = caps:escape_shifted_capslock
    repeat_delay = 350;
}
```

## TODO
- [ ] god, i need a vertical monitor so bad
- [x] tweak the  configs and change the keybinds
- [x] actually learn vim, lmao
