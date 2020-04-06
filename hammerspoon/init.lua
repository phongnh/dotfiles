-- Global log level
hs.logger.defaultLogLevel = "info"

-- Hotkeys
hs.hotkey.alertDuration = 0

-- Disable window animation
hs.window.animationDuration = 0

-- Hints
hs.hints.style           = "vimperator"
hs.hints.showTitleThresh = 0

-- Grid
hs.grid.setMargins({ x = 0, y = 0 }).setGrid("6x4")
hs.grid.ui.textSize = 150

-- Default key
local cocKey = { "ctrl", "alt", "cmd" }

-- Load Spoons
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

spoon.SpoonInstall:andUse("FnMate", {})

spoon.SpoonInstall:andUse("ReloadConfiguration", {
    hotkeys = {
        reloadConfiguration = { cocKey, "R" }
    },
    start = true
})

spoon.SpoonInstall:andUse("MouseCircle", {
    disable = true,
    hotkeys = {
        show = { cocKey, "C" }
    }
})

spoon.SpoonInstall:andUse("FadeLogo", {
    config = {
        run_time = 1.0,
    },
    start = true
})

-- Caffeine Menu
spoon.SpoonInstall:andUse("Caffeine", {
    hotkeys = {
        toggle = { cocKey, "Z" }
    },
    start = true
})

-- Network Speed Menu
spoon.SpoonInstall:andUse("SpeedMenu", {
    start = true
})

spoon.SpoonInstall:andUse("MenubarFlag", {
    disable = true,
    config = {
        colors = {
            ["U.S."] = {},
            ["Simple Telex"] = { hs.drawing.color.x11.red },
        },
    },
    start = true
})

-- Show Clock
spoon.SpoonInstall:andUse("CircleClock", {})

-- Show Horizontal Calendar
spoon.SpoonInstall:andUse("HCalendar", {})

-- Download and set wallpaper from BingDaily / Unsplash
spoon.SpoonInstall:andUse("BingDaily", {})
-- spoon.SpoonInstall:andUse("UnsplashZ", {
--     disable = true
-- })
-- spoon.SpoonInstall:andUse("UnsplashRandom", {
--     disable = true
-- })


--------------------------------------------------------------------------------
-- KEY BINDINGS
--------------------------------------------------------------------------------
local cmd    = { "cmd" }
local winKey = { "ctrl", "alt", "cmd" }
local appKey = { "ctrl", "alt", "cmd", "shift" }

-- Load WinMan
hs.loadSpoon("WinMan")

-- Show windows with hints
hs.hotkey.bind(cmd, "Escape", function() spoon.WinMan:windowHints() end)

-- Snap window
hs.hotkey.bind(winKey, "Space", function() spoon.WinMan:snapWindow() end)

-- Toggle fullscreen
hs.hotkey.bind(winKey, "Return", function() spoon.WinMan:toggleWindowFullScreen() end)

-- Maximize
hs.hotkey.bind(winKey, "M", function() spoon.WinMan:maximizeWindow() end)

-- Toggle minimizing
hs.hotkey.bind(winKey, "\\",  function() spoon.WinMan:toggleMinimizingWindow() end)

-- Centralize
hs.hotkey.bind(winKey, "/", function() spoon.WinMan:centralizeWindow() end)

-- Move window to next / previous screen
hs.hotkey.bind(winKey, "N", function() spoon.WinMan:moveWindowToNextScreen() end)
hs.hotkey.bind(winKey, "P", function() spoon.WinMan:moveWindowToPreviousScreen() end)

hs.hotkey.bind(winKey, "[", function() spoon.WinMan:pushWindowToPrevScreen() end)
hs.hotkey.bind(winKey, "]", function() spoon.WinMan:pushWindowToNextScreen() end)

hs.hotkey.bind(winKey, "-", function() spoon.WinMan:moveWindowToNextScreenWithScaling() end)
hs.hotkey.bind(winKey, "=", function() spoon.WinMan:moveWindowToPreviousScreenWithScaling() end)

hs.hotkey.bind(winKey, ",", function() spoon.WinMan:moveWindowToLeft65() end)
hs.hotkey.bind(winKey, ".", function() spoon.WinMan:moveWindowToRight35() end)

hs.hotkey.bind(winKey, "H", function() spoon.WinMan:moveWindowToLeftHalf() end)
hs.hotkey.bind(winKey, "J", function() spoon.WinMan:moveWindowToBottomHalf() end)
hs.hotkey.bind(winKey, "K", function() spoon.WinMan:moveWindowToTopHalf() end)
hs.hotkey.bind(winKey, "L", function() spoon.WinMan:moveWindowToRightHalf() end)

hs.hotkey.bind(winKey, "4", function() spoon.WinMan:moveWindowTo4x5() end)
hs.hotkey.bind(winKey, "5", function() spoon.WinMan:moveWindowTo5x6() end)
hs.hotkey.bind(winKey, "6", function() spoon.WinMan:moveWindowTo6x6() end)
hs.hotkey.bind(winKey, "7", function() spoon.WinMan:moveWindowTo6x7() end)
hs.hotkey.bind(winKey, "8", function() spoon.WinMan:moveWindowTo6x8() end)
hs.hotkey.bind(winKey, "9", function() spoon.WinMan:moveWindowTo7x8_5() end)

hs.hotkey.bind(winKey, "Y", function() spoon.WinMan:resizeWindowThinner() end)
hs.hotkey.bind(winKey, "U", function() spoon.WinMan:resizeWindowTaller() end)
hs.hotkey.bind(winKey, "I", function() spoon.WinMan:resizeWindowShorter() end)
hs.hotkey.bind(winKey, "O", function() spoon.WinMan:resizeWindowWider() end)

hs.hotkey.bind(winKey, "UP",    function() spoon.WinMan:pushWindowUp() end)
hs.hotkey.bind(winKey, "DOWN",  function() spoon.WinMan:pushWindowDown() end)
hs.hotkey.bind(winKey, "LEFT",  function() spoon.WinMan:pushWindowLeft() end)
hs.hotkey.bind(winKey, "RIGHT", function() spoon.WinMan:pushWindowRight() end)

-- Grid Show
hs.hotkey.bind(winKey, "G", function() hs.grid.show() end)

-- Open my initial applications
hs.hotkey.bind(winKey, "0", function()
    hs.alert.show("Opening initial applications...")
    hs.application.launchOrFocus("Slack")
    hs.application.launchOrFocus("Google Chrome")
    hs.application.launchOrFocus("Alacritty Light")
end)

-- Start Screensaver
hs.hotkey.bind(winKey, "DELETE", function() hs.caffeinate.startScreensaver() end)

-- Focus application by directions
hs.hotkey.bind(appKey, "H", function() spoon.WinMan:focusLeftWindow() end)
hs.hotkey.bind(appKey, "J", function() spoon.WinMan:focusDownWindow() end)
hs.hotkey.bind(appKey, "K", function() spoon.WinMan:focusUpWindow() end)
hs.hotkey.bind(appKey, "L", function() spoon.WinMan:focusRightWindow() end)


-- hs.alert.show("Hammerspoon started!")
