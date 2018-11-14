-- Disable window animation
hs.window.animationDuration = 0

hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
hs.grid.GRIDHEIGHT = 10
hs.grid.GRIDWIDTH  = 10

--------------------------------------------------------------------------------
-- HELPERS
--------------------------------------------------------------------------------
function hs.application:standardWindows()
    return hs.fnutils.filter(self:allWindows(), function(w)
        return w:id() and w:isStandard() and w:title() ~= ""
    end)
end

function hs.appfinder.appsFromName(name)
    return hs.fnutils.filter(hs.application.runningApplications(), function(app)
        return app:title() == name
    end)
end

--------------------------------------------------------------------------------
-- KEY BINDINGS
--------------------------------------------------------------------------------
local cmd    = { "cmd" }
local winKey = { "ctrl", "alt", "cmd" }
local appKey = { "ctrl", "alt", "cmd", "shift" }

require "window"

-- Show windows with hints
hs.hotkey.bind(cmd, "Escape", windowHints)

-- Snap window
hs.hotkey.bind(winKey, "Space", snapWindow)

-- Toggle fullscreen
hs.hotkey.bind(winKey, "Return", toggleWindowFullScreen)

-- Maximize
hs.hotkey.bind(winKey, "M", maximizeWindow)

-- Toggle minimizing
hs.hotkey.bind(winKey, "\\",  toggleMinimizingWindow)

-- Centralize
hs.hotkey.bind(winKey, "/", centralizeWindow)

-- Move window to next / previous screen
hs.hotkey.bind(winKey, "N", moveWindowToNextScreen)
hs.hotkey.bind(winKey, "P", moveWindowToPreviousScreen)

hs.hotkey.bind(winKey, "[", handleWindowWithFunction(hs.grid.pushWindowPrevScreen))
hs.hotkey.bind(winKey, "]", handleWindowWithFunction(hs.grid.pushWindowNextScreen))

hs.hotkey.bind(winKey, "-", moveWindowToNextScreenWithScaling)
hs.hotkey.bind(winKey, "=", moveWindowToPreviousScreenWithScaling)

hs.hotkey.bind(winKey, ",", moveWindowToLeft65)
hs.hotkey.bind(winKey, ".", moveWindowToRight35)

hs.hotkey.bind(winKey, "H", moveWindowToLeftHalf)
hs.hotkey.bind(winKey, "J", moveWindowToBottomHalf)
hs.hotkey.bind(winKey, "K", moveWindowToTopHalf)
hs.hotkey.bind(winKey, "L", moveWindowToRightHalf)

hs.hotkey.bind(winKey, "6", moveWindowTo6x6)
hs.hotkey.bind(winKey, "7", moveWindowTo6x7)
hs.hotkey.bind(winKey, "8", moveWindowTo6x8)
hs.hotkey.bind(winKey, "9", moveWindowTo7x8_5)

hs.hotkey.bind(winKey, 'Y', handleWindowWithFunction(hs.grid.resizeWindowThinner))
hs.hotkey.bind(winKey, 'U', handleWindowWithFunction(hs.grid.resizeWindowTaller))
hs.hotkey.bind(winKey, 'I', handleWindowWithFunction(hs.grid.resizeWindowShorter))
hs.hotkey.bind(winKey, 'O', handleWindowWithFunction(hs.grid.resizeWindowWider))

hs.hotkey.bind(winKey, 'UP',    handleWindowWithFunction(hs.grid.pushWindowUp))
hs.hotkey.bind(winKey, 'DOWN',  handleWindowWithFunction(hs.grid.pushWindowDown))
hs.hotkey.bind(winKey, 'LEFT',  handleWindowWithFunction(hs.grid.pushWindowLeft))
hs.hotkey.bind(winKey, 'RIGHT', handleWindowWithFunction(hs.grid.pushWindowRight))

-- Open my initial applications
hs.hotkey.bind(winKey, "0", openInitialApplications)

-- Start Screensaver
hs.hotkey.bind(winKey, "DELETE", hs.caffeinate.startScreensaver)

-- Launch and focus applications
local apps = {
    { key = "1", name = "System Preferences" },
    { key = "2", name = "App Store"          },
    { key = "3", name = "iTunes"             },

    { key = "W", name = "Safari"             },
    { key = "E", name = "Mail"               },
    { key = "R", name = "Preview"            },
    { key = "T", name = "Sublime Text"       },
    { key = "Y", name = "Terminal"           },
    { key = "U", name = "Upwork"             },
    { key = "I", name = "iTerm2"             },
    { key = "O", name = "LibreOffice"        },
    { key = "P", name = "pgAdmin3"           },

    { key = "A", name = "Android Studio"     },
    { key = "S", name = "Skype"              },
    { key = "D", name = "GoldenDict"         },
    { key = "F", name = "Finder"             },
    { key = "G", name = "Google Chrome"      },

    { key = "Z", name = "Freeplane"          },
    { key = "X", name = "Xcode"              },
    { key = "C", name = "Chromium"           },
    { key = "V", name = "MacVim"             },
    { key = "B", name = "Firefox"            },
    { key = "N", name = "Evernote"           },
    { key = "M", name = "Monosnap"           }
}

hs.fnutils.each(apps, function(app)
    hs.hotkey.bind(appKey, app.key, openApplicationFunction(app.name))
end)

-- Activate application
apps = {
    { key = "[", name = "Git Gui" },
    { key = "]", name = "Wish"    }
}

hs.fnutils.each(apps, function(app)
    hs.hotkey.bind(appKey, app.key, activateApplicationFunction(app.name))
end)

-- Focus application by directions
hs.hotkey.bind(appKey, "H", focusLeftWindow)
hs.hotkey.bind(appKey, "J", focusDownWindow)
hs.hotkey.bind(appKey, "K", focusUpWindow)
hs.hotkey.bind(appKey, "L", focusRightWindow)


-- MOUSE CURSOR HIGHLIGHT
require "mouse"
hs.hotkey.bind(winKey, "C", mouseHighlight)


hs.pathwatcher.new(hs.configdir, hs.reload):start()

hs.alert.show("Hammerspoon started!")
