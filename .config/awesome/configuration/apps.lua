local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'ko',
    screenshot = 'flameshot full -p ~/Pictures/flameshot',
    region_screenshot = 'flameshot gui -p ~/Pictures/flameshot',
    delayed_screenshot = 'flameshot full -p ~/Pictures/flameshot -d 5000',
    browser = 'firefox-developer-edition',
    editor = 'sublime', -- gui text editor
    social = 'discord',
    game = rofi_command,
    files = 'nemo',
    music = 'spotify' 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'pnmixer', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
     'xfce4-power-manager', -- power manager
     'flameshot',
     'synology-drive -minimized',
     '/usr/bin/barrier',
     '/usr/bin/copyq',
     'nitrogen --restore &',
     '~/.local/bin/wallpaper', -- wallpaper-reddit script
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}