{-# OPTIONS -fno-warn-missing-signatures #-}
import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import System.IO()

myConfig = defaultConfig {
  modMask = mod4Mask,
  logHook = updatePointer (Relative 0.5 0.5),
  borderWidth = 3,
  focusedBorderColor = "#333333",
  normalBorderColor = "#111111",
  terminal = "urxvt",
  startupHook = do
    spawn "feh --bg-scale /usr/share/backgrounds/gnome/Dark_Ivy.jpg"
    spawn "xset r rate 400 40"
    spawn "xscreensaver -no-splash"
    spawn "unclutter -grab -idle 3"
}
    `additionalKeysP`
      [ ("M-f", spawn "nautilus --no-desktop ~/Downloads")
      , ("M-S-b", spawn "firefox")
      , ("M-S-c", spawn "chromium")
      , ("M-S-g", spawn "google-chrome-stable")
      , ("M-S-e", spawn "emacs")
      , ("<XF86MonBrightnessUp>", spawn "xbacklight +10")
      , ("<XF86MonBrightnessDown>", spawn "xbacklight -10")
      , ("M-S-,", spawn "gnome-control-center")
      , ("M-S-l", spawn "xscreensaver-command -lock") ]

main = xmonad =<< xmobar myConfig
