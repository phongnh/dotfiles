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
local cmdKey      = { "cmd" }
local cmdCtrlKey  = { "cmd", "ctrl" }
local altKey      = { "alt" }
local altShiftKey = { "alt", "shift" }
local cocKey      = { "ctrl", "alt", "cmd" }

-- Load Spoons
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

spoon.SpoonInstall:andUse("FnMate", {})

spoon.SpoonInstall:andUse("ReloadConfiguration", {
    hotkeys = {
        reloadConfiguration = { altShiftKey, "R" }
    },
    start = true
})

-- spoon.SpoonInstall:andUse("MouseCircle", {
--     disable = true,
--     hotkeys = {
--         show = { altShiftKey, "C" }
--     },
--     start = false
-- })

spoon.SpoonInstall:andUse("FadeLogo", {
    config = {
        run_time = 0.75,
    },
    start = true
})

-- Caffeine Menu
spoon.SpoonInstall:andUse("Caffeine", {
    hotkeys = {
        toggle = { altKey, "Z" }
    },
    start = true
})

-- Network Speed Menu
spoon.SpoonInstall:andUse("SpeedMenu", {
    start = true
})

-- spoon.SpoonInstall:andUse("MenubarFlag", {
--     disable = true,
--     config = {
--         colors = {
--             ["U.S."] = {},
--             ["Simple Telex"] = { hs.drawing.color.x11.red },
--         },
--     },
--     start = false
-- })

-- Show shortcuts for current application
spoon.SpoonInstall:andUse("KSheet", {
    hotkeys = { toggle = { altKey, "/" } }
})

-- Show Clock
-- spoon.SpoonInstall:andUse("CircleClock", {
--     disable = true,
--     start = false
-- })

-- Show Horizontal Calendar
-- spoon.SpoonInstall:andUse("HCalendar", {
--     disable = true,
--     start = false
-- })

-- Download and set wallpaper from BingDaily / Unsplash
spoon.SpoonInstall:andUse("BingDaily", {})
-- spoon.SpoonInstall:andUse("UnsplashZ", {
--     disable = true
-- })
-- spoon.SpoonInstall:andUse("UnsplashRandom", {
--     disable = true
-- })

-- Toggle Hammerspoon console
-- hs.hotkey.bind(altShiftKey, "Z", function() hs.toggleConsole() end)

-- Open Hammerspoon manual
-- hs.hotkey.bind(altShiftKey, "M", function()
--     hs.doc.hsdocs.forceExternalBrowser(true)
--     hs.doc.hsdocs.moduleEntitiesInSidebar(true)
--     hs.doc.hsdocs.help()
-- end)

-- Rescan network
hs.hotkey.bind(altKey, "S", function() spoon.SpeedMenu:rescan() end)
hs.hotkey.bind(altShiftKey, "S", function() spoon.SpeedMenu:toggle() end)

-- Lock Screen (Private API)
hs.hotkey.bind(altShiftKey, "L", function() hs.caffeinate.lockScreen() end)

-- Start Screensaver
hs.hotkey.bind(altKey, "L", function() hs.caffeinate.startScreensaver() end)

-- Grid Show
hs.hotkey.bind(altKey, "G", function() hs.grid.show() end)

-- Open my initial applications
-- hs.hotkey.bind(cocKey, "0", function()
--     hs.alert.show("Opening initial applications...")
--     hs.application.launchOrFocus("Slack")
--     hs.application.launchOrFocus("Google Chrome")
--     hs.application.launchOrFocus("Alacritty Light")
-- end)

-- Window Switcher
hs.window.switcher.ui.onlyActiveApplication = false -- only show windows of the active application
hs.window.switcher.ui.showTitles            = false -- show window titles
hs.window.switcher.ui.showThumbnails        = true  -- show window thumbnails
hs.window.switcher.ui.thumbnailSize         = 144   -- size of window thumbnails in screen points
hs.window.switcher.ui.showSelectedThumbnail = true  -- show a larger thumbnail for the currently selected window
hs.window.switcher.ui.selectedThumbnailSize = 384
hs.window.switcher.ui.showSelectedTitle     = false -- show larger title for the currently selected window

-- Default window switcher: only visible windows, all Spaces
windowSwitcher = hs.window.switcher.new()
hs.hotkey.bind(altKey, "Tab", "Next window", function() windowSwitcher:next() end, nil, function() windowSwitcher:next() end)
hs.hotkey.bind(altShiftKey, "Tab", "Previous window", function() windowSwitcher:previous() end, nil, function() windowSwitcher:previous() end)

-- Switcher for minimized/hidden windows in current Space
-- windowsInSpaceSwitcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{})
-- hs.hotkey.bind(altKey, "Q", "Next window", function() windowsInSpaceSwitcher:next() end, nil, function() windowsInSpaceSwitcher:next() end)
-- hs.hotkey.bind(altShiftKey, "Q", "Previous window", function() windowsInSpaceSwitcher:previous() end, nil, function() windowsInSpaceSwitcher:previous() end)

-- Switcher for predefined browsers
browserSwitcher = hs.window.switcher.new{ "Safari", "Google Chrome", "Google Chrome Canary", "Chromium", "Brave Browser", "Firefox", "Opera", "Microsoft Edge" }
hs.hotkey.bind(altKey, "B", "Next browser", function() browserSwitcher:next() end, nil, function() browserSwitcher:next() end)
hs.hotkey.bind(altShiftKey, "B", "Previous browser", function() browserSwitcher:previous() end, nil, function() browserSwitcher:previous() end)

--------------------------------------------------------------------------------
-- WinMan.spoon
--------------------------------------------------------------------------------
-- Load WinMan
hs.loadSpoon("WinMan")

-- Show windows with hints
hs.hotkey.bind(cmdKey, "Escape", function() spoon.WinMan:windowHints("") end)
hs.hotkey.bind(altKey, "Escape", function() spoon.WinMan:windowHints() end)

-- Snap window
hs.hotkey.bind(cocKey, "Space", function() spoon.WinMan:snapWindow() end)

-- Toggle fullscreen
hs.hotkey.bind(cocKey, "Return", function() spoon.WinMan:toggleWindowFullScreen() end)

-- Maximize
hs.hotkey.bind(cocKey, "M", function() spoon.WinMan:maximizeWindow() end)

-- Toggle minimizing
hs.hotkey.bind(cocKey, "\\",  function() spoon.WinMan:toggleMinimizingWindow() end)

-- Centralize
hs.hotkey.bind(cocKey, "/", function() spoon.WinMan:centralizeWindow() end)

-- Move window to next / previous screen
hs.hotkey.bind(cocKey, "N", function() spoon.WinMan:moveWindowToNextScreen() end)
hs.hotkey.bind(cocKey, "P", function() spoon.WinMan:moveWindowToPreviousScreen() end)

hs.hotkey.bind(cocKey, "[", function() spoon.WinMan:pushWindowToPrevScreen() end)
hs.hotkey.bind(cocKey, "]", function() spoon.WinMan:pushWindowToNextScreen() end)

hs.hotkey.bind(cocKey, "-", function() spoon.WinMan:moveWindowToNextScreenWithScaling() end)
hs.hotkey.bind(cocKey, "=", function() spoon.WinMan:moveWindowToPreviousScreenWithScaling() end)

hs.hotkey.bind(cocKey, ",", function() spoon.WinMan:moveWindowToLeft65() end)
hs.hotkey.bind(cocKey, ".", function() spoon.WinMan:moveWindowToRight35() end)

hs.hotkey.bind(cocKey, "H", function() spoon.WinMan:moveWindowToLeftHalf() end)
hs.hotkey.bind(cocKey, "J", function() spoon.WinMan:moveWindowToBottomHalf() end)
hs.hotkey.bind(cocKey, "K", function() spoon.WinMan:moveWindowToTopHalf() end)
hs.hotkey.bind(cocKey, "L", function() spoon.WinMan:moveWindowToRightHalf() end)

hs.hotkey.bind(cocKey, "4", function() spoon.WinMan:moveWindowTo4x5() end)
hs.hotkey.bind(cocKey, "5", function() spoon.WinMan:moveWindowTo5x6() end)
hs.hotkey.bind(cocKey, "6", function() spoon.WinMan:moveWindowTo6x6() end)
hs.hotkey.bind(cocKey, "7", function() spoon.WinMan:moveWindowTo6x7() end)
hs.hotkey.bind(cocKey, "8", function() spoon.WinMan:moveWindowTo6x8() end)
hs.hotkey.bind(cocKey, "9", function() spoon.WinMan:moveWindowTo7x8_5() end)

hs.hotkey.bind(cocKey, "Y", function() spoon.WinMan:resizeWindowThinner() end)
hs.hotkey.bind(cocKey, "U", function() spoon.WinMan:resizeWindowTaller() end)
hs.hotkey.bind(cocKey, "I", function() spoon.WinMan:resizeWindowShorter() end)
hs.hotkey.bind(cocKey, "O", function() spoon.WinMan:resizeWindowWider() end)

hs.hotkey.bind(cocKey, "UP",    function() spoon.WinMan:pushWindowUp() end)
hs.hotkey.bind(cocKey, "DOWN",  function() spoon.WinMan:pushWindowDown() end)
hs.hotkey.bind(cocKey, "LEFT",  function() spoon.WinMan:pushWindowLeft() end)
hs.hotkey.bind(cocKey, "RIGHT", function() spoon.WinMan:pushWindowRight() end)

hs.hotkey.bind(cmdCtrlKey, "H", function() spoon.WinMan:pushWindowUp() end)
hs.hotkey.bind(cmdCtrlKey, "J", function() spoon.WinMan:pushWindowDown() end)
hs.hotkey.bind(cmdCtrlKey, "K", function() spoon.WinMan:pushWindowLeft() end)
hs.hotkey.bind(cmdCtrlKey, "L", function() spoon.WinMan:pushWindowRight() end)

-- Focus application by directions
-- hs.hotkey.bind(cmdCtrlKey, "H", function() spoon.WinMan:focusLeftWindow() end)
-- hs.hotkey.bind(cmdCtrlKey, "J", function() spoon.WinMan:focusDownWindow() end)
-- hs.hotkey.bind(cmdCtrlKey, "K", function() spoon.WinMan:focusUpWindow() end)
-- hs.hotkey.bind(cmdCtrlKey, "L", function() spoon.WinMan:focusRightWindow() end)

hs.alert.show("Hammerspoon started!")
