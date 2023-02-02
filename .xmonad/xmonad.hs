-- My Xmonad Config that works (kinda)
--
-- some features of this config are:
-- 1. 4 layouts: Simple Tall, ThreeCol , tabbed
-- 2. Tabbed sublayout
-- 3. named scratchpad
-- 4. toggleable polybar ( kinda works. see below)
-- 5. smartGaps (gaps disappear if only one window) and toggleable gaps(works gud!)
-- 6. FlashFocus instead of Borders
-- TODO: 1. Fix toggleable polybar 
--          { it works by toggling of struts and sending polybar-msg to unhide/hide. 
--          the problem is it toggles the struts of only the current workspace. 
--          so if you hide the bar on 1 wks, switch to another wks(remember struts are enabled on this by default)
--          and then unhide the bar on this wks it gets fucked up
--      2. Experimentation with DynamicProjects (seems interesting)
--      3. Explore XMonad.Layout.BoringWindows
--
import XMonad
import System.Exit

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WindowSwallowing

import qualified XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

import XMonad.Actions.RotSlaves
import XMonad.Actions.WithAll
import XMonad.Actions.CopyWindow
import XMonad.Actions.MouseResize
import XMonad.Actions.DynamicProjects

import XMonad.Prompt 
import XMonad.Prompt.ConfirmPrompt

import XMonad.Layout.Simplest
import XMonad.Layout.SubLayouts
import qualified XMonad.Layout.BoringWindows as BoringWindows
import XMonad.Layout.WindowNavigation
import XMonad.Layout.Tabbed
-- import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ShowWName
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Renamed
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedWindows  --window titles in tabbed layout
import XMonad.Util.WindowProperties

myTerminal = "alacritty"
myBrowser = "firefox"

myBorderWidth = 3

-- myNormalBorderColor = "#222222"
myNormalBorderColor = "#282828"

-- myFocusedBorderColor = "#4f4f4f"
myFocusedBorderColor = "#3c3836"

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myShowWNameTheme :: SWNConfig
myShowWNameTheme = def
    { swn_font              = "xft:FiraCode Nerd Font:Regular:size=120"
    , swn_fade              = 0.5
    , swn_bgcolor           = "#161616"
    , swn_color             = "#cfcfcf"
    }

myTabConfig = def
                { fontName            = "xft:Inter:regular:size=11:antialias=true:hinting=true"
                 , activeColor         = "#161616"
                 , inactiveColor       = "#1D2021"
                 , activeBorderColor   = "#161616"
                 , inactiveBorderColor = "#1D2021"
                 , activeTextColor     = "#ffffff"
                 , inactiveTextColor   = "#d0d0d0"
                 , activeBorderWidth = 0
                 , inactiveBorderWidth = 0
                 , urgentBorderWidth = 0
                 -- , activeColor         = "#1D2021"
                 -- , inactiveColor       = "#161616"
                 -- , activeBorderColor   = "#1D2021"
                 -- , inactiveBorderColor = "#161616"
                 -- , activeTextColor     = "#cfcfcf"
                 -- , inactiveTextColor   = "#808080"
                 }

myPromptTheme = def
    { font                  = "xft:Inter:regular:size=11:antialias=true:hinting=true"
    , bgColor               = "#161616"
    , fgColor               = "#cfcfcf"
    , fgHLight              = "#808080"
    , bgHLight              = "#ffffff"
    , borderColor           = "#808080"
    , promptBorderWidth     = 0
    , height                = 30
    , position              = Top
    }

hotPromptTheme = myPromptTheme
    { bgColor               = "#fa5f5f"
    , fgColor               = "#000000"
    , position              = Top
    }



myScratchPads = [ NS "terminal" openTerminal isTerminal centerFloat
                , NS "discord" openDiscord isDiscord centerFloat
                , NS "music" openMusic isMusic centerFloat
                ] where
                    openTerminal = myTerminal ++ " -t scratchpad"
                    isTerminal = title =? "scratchpad"
                    centerFloat = customFloating $ W.RationalRect l t w h
                        where 
                            h = 0.7
                            w = 0.7 -- use 0.9 for bigger
                            t = 0.85 -h -- with 0.9 h,w use 0.95 -h,w
                            l = 0.85 -w

                    openDiscord = "discord"
                    isDiscord = className =? "discord"

                    openMusic = myTerminal ++ " -t ncmpcpp" ++ " -e ncmpcpp"
                    isMusic = title =? "ncmpcpp"

projects :: [Project]
projects = 
    [ Project { projectName = "uni"
              , projectDirectory = "~/Documents"
              , projectStartHook = Just $ do spawn myTerminal
                                             spawn "google-chrome-stable"
              }
    ]

-- STARTUP -------------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
    setWMName "LG3D"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "setxkbmap -option caps:escape"
    spawnOnce "setxkbmap us -variant colemak_dh"
    spawnOnce "kmonad ~/.config/kmonad/60coldh.kbd &"
    --spawnOnce "exec ~/.local/bin/pulse-volume-watcher.py | xob &"
    spawnOnce "mpd &"
    spawn "nitrogen --restore &"
    -- spawn "exec ~/.bin/eww daemon"
    spawn "exec ~/.config/polybar/launch.sh"
    -- spawnOnce "tint2 -c .config/tint2/vertical.tint2rc"
    -- spawnOnce "tint2 -c .config/tint2/systray.tint2rc"
    spawnOnce "dunst &"
    --spawnOnce "flashfocus &"
    spawnOnce "picom  &"
    spawnOnce "blueman-applet &"
    spawnOnce "nm-applet &"

------------------------------------------------------------------
--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
mySpacingalt :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacingalt i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True


-- LAYOUTS -------------------------------------------------------

tall = renamed [Replace "tall"]
        $ smartBorders
        $ addTabs shrinkText myTabConfig
        $ subLayout [] ( Simplest) -- make sure do not add  below this
        -- might be a placebo but when fked with the order of mySpacing 
        -- it adds spacing between tabs of tabbed sublayout (idk for real tho)
        $ mySpacingalt 10
        $ ResizableTall 1 (3/100) (1/2) []

threeCol = renamed [Replace "threeCol"]
            $ smartBorders
            $ addTabs shrinkText myTabConfig 
            $ subLayout [] ( Simplest )
            $ mySpacingalt 10
            $ ThreeColMid 1 (3/100) (1/2)

tabs = renamed [Replace "tabs"]
        $ noBorders
        $ tabbed shrinkText myTabConfig

myLayoutHook =  avoidStruts $ configurableNavigation noNavigateBorders $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
                where
                  myDefaultLayout = tall
                                ||| threeCol
                                ||| tabs

------------------------------------------------------------------

-- MANAGEHOOKS ---------------------------------------------------

myManageHook :: ManageHook
myManageHook = composeAll
     [ resource =? "confirm"         --> forceCenterFloat
     , resource =? "file_progress"   --> forceCenterFloat
     , resource =? "dialog"          --> forceCenterFloat
     , resource =? "download"        --> forceCenterFloat
     , resource =? "error"           --> forceCenterFloat
     , resource =? "notification"    --> doFloat
     , resource =? "pinentry-gtk-2"  --> doFloat
     , resource =? "splash"          --> doFloat
     , resource =? "toolbar"         --> doFloat
     , stringProperty "WM_WINDOW_ROLE" =? "GtkFileChooserDialog"              --> forceCenterFloat
     --, title =? "Oracle VM VirtualBox Manager"  --> doFloat
     --, className =? "Gimp"            --> doShift ( myWorkspaces !! 8 )
     , className =? "YouTube Music"    --> doShift (myWorkspaces !! 8 )
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
     ] <+> namedScratchpadManageHook myScratchPads

-- Custom hook helper
-- requires XMonad.Hooks.ManageHelpers
-- credit: https://github.com/altercation/dotfiles-tilingwm/blob/master/.xmonad/xmonad.hs
forceCenterFloat :: ManageHook
forceCenterFloat = doFloatDep move
  where
    move :: W.RationalRect -> W.RationalRect
    move _ = W.RationalRect x y w h

    w, h, x, y :: Rational
    w = 0.5
    h = 0.75
    x = (1-w)/2
    y = (1-h)/2

--------------------------------------------------------------------

myKeys :: [(String, X ())]
myKeys =
        [
          ("M-C-r", spawn "xmonad --recompile")
        , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
        , ("M-S-q", confirmPrompt hotPromptTheme "Quit Xmonad" $ io (exitWith ExitSuccess))

        , ("M-<Backspace>", kill1)
        , ("M-S-<Backspace>", confirmPrompt hotPromptTheme "kill all" $ killAll)

        , ("M-<Return>", spawn (myTerminal))
        , ("M1-<Space>", spawn "rofi  -show drun -drun-icon-theme \"Papirus-Dark\" " )
        , ("M-S-<Return>", spawn "rofi -show window -modi run,drun,window  -window-icon-theme \"Papirus-Dark\" ")

        -- requires windowNavigation
        , ("M-n", sendMessage $ Go D)
        , ("M-e", sendMessage $ Go U)
        , ("M-m", sendMessage $ Go L)
        , ("M-i", sendMessage $ Go R)
        , ("M-S-n", sendMessage $ Swap D)
        , ("M-S-e", sendMessage $ Swap U)
        , ("M-S-m", sendMessage $ Swap L)
        , ("M-S-i", sendMessage $ Swap R)

        , ("M-h", sendMessage Shrink)   -- Shrink horiz window width
        , ("M-l", sendMessage Expand)   -- Expand horiz window width
        , ("M-M1-j", sendMessage MirrorShrink)  --Inc vert window height
        , ("M-M1-k", sendMessage MirrorExpand)  --Dec vert window height

        , ("M-S-t", sinkAll)    -- Push ALL floating windows to tile

        , ("M-S-<Tab>", rotSlavesDown)    -- Rotate all windows except master
        , ("M-C-<Tab>", rotAllDown)       -- Rotate all the windows in the current stack
        , ("M-<Tab>", sendMessage NextLayout)

        -- SubLayouts
        , ("M-C-h", sendMessage $ pullGroup L)
        , ("M-C-l", sendMessage $ pullGroup R)
        , ("M-C-k", sendMessage $ pullGroup U)
        , ("M-C-j", sendMessage $ pullGroup D)
        , ("M-C-m", withFocused (sendMessage . MergeAll))
        , ("M-C-u", withFocused (sendMessage . UnMerge))
        , ("M-C-/", withFocused (sendMessage . UnMergeAll))
        , ("M-C-.", onGroup W.focusUp')    -- Switch focus to next tab
        , ("M-C-,", onGroup W.focusDown')  -- Switch focus to prev tab

        -- SCRATCHPADS
        , ("M1-t", namedScratchpadAction myScratchPads "terminal")
        , ("M1-c", namedScratchpadAction myScratchPads "discord")
        , ("M1-m", namedScratchpadAction myScratchPads "music")

        -- PROJECTS
        , ("M-x", switchProjectPrompt myPromptTheme)
        , ("M-S-x", shiftToProjectPrompt myPromptTheme)
         
        -- toggles polybar and adds struts while doing so
        , ("M1-b", sendMessage ToggleStruts <+> spawn "polybar-msg cmd toggle") 
        -- , ("M1-b", spawn "polybar-msg cmd toggle") 
        -- toggles full mode ( defined earlier as mkToggle)
        -- , ("M-<Space>", sendMessage $ Toggle NBFULL)
        , ("M-<Space>", sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)
        -- toggles "gaps" = screenspace + window space
        , ("M1-g", toggleScreenSpacingEnabled <+> toggleWindowSpacingEnabled )
        -- , ("M1-S-g", toggleWindowSpacingEnabled)

        -- SCRIPTS
        -- , ("M-<Esc>", spawn "~/.local/bin/lock.sh")            -- lock script
        , ("M-<Esc>", spawn "betterlockscreen -l dim")  --using betterlockscreen
        , ("M-S-<Esc>", spawn "~/.local/bin/powermenu")   -- rofi powermenu
        , ("<Print>", spawn "~/.local/bin/screenshot ssfull")  --screenshot
        , ("S-<Print>", spawn "~/.local/bin/screenshot ssselect") --select screenshot
        , ("C-<Print>", spawn "~/.local/bin/screenshot ssclip") --copy screenshot to clipboard
        -- uncomment these for dunst volume bar
        , ("<XF86AudioMute>", spawn "pamixer -t")       --toggle mute
        , ("<XF86AudioLowerVolume>", spawn "pamixer --decrease 5") -- dec volume 5%
        , ("<XF86AudioRaiseVolume>", spawn "pamixer --increase 5") -- inc volume 5%
        , ("C-<Esc>", spawn "dunstctl history-pop") -- show past notifications
        -- , ("<XF86AudioMute>", spawn "~/.local/bin/volume mute")       --toggle mute
        -- , ("<XF86AudioLowerVolume>", spawn "~/.local/bin/volume down") -- dec volume 5%
        -- , ("<XF86AudioRaiseVolume>", spawn "~/.local/bin/volume up") -- inc volume 5%
        , ("<XF86MonBrightnessUp>", spawn "brightnessctl s +1%") -- inc brightness 1%
        , ("<XF86MonBrightnessDown>", spawn "brightnessctl s 1%-") --dec brightness 1%
        ]

main :: IO ()
main = xmonad $ ewmh . docks $ dynamicProjects projects $ def
    {
      modMask = mod4Mask 
    , terminal = myTerminal
    , borderWidth = myBorderWidth
    -- spacingRaw ... part below adds spacing with smart spacing and smart borders
    -- ,layoutHook = showWName' myShowWNameTheme $ spacingRaw True (Border 10 10 10 10) True (Border 10 10 10 10) True $ myLayoutHook
    , layoutHook = showWName' myShowWNameTheme $ myLayoutHook
    , handleEventHook = swallowEventHook (className =? "Alacritty") (return True)
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , manageHook = myManageHook <+> manageDocks
    , startupHook = myStartupHook
    , workspaces = myWorkspaces
    } `additionalKeysP` myKeys
