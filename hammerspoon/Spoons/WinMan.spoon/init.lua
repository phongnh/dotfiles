--- === WinMan ===
---
--- Windows Manipulation
---
--- Download: [https://github.com/phongnh/zero/raw/master/Spoons/WinWin.spoon.zip](https://github.com/phongnh/zero/Spoons/raw/master/Spoons/WinMan.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name     = "WinMan"
obj.version  = "1.0"
obj.author   = "Phong Nguyen <nhphong1406@gmail.com>"
obj.homepage = "https://github.com/phongnh/zero"
obj.license  = "MIT - https://opensource.org/licenses/MIT"

local function normalWindow()
    local win = hs.window.focusedWindow()
    if win and win:isFullScreen() then
        return nil
    end
    return win
end

local function moveWindowToUnit(unit)
    local win = normalWindow()
    if not win then return end
    win:moveToUnit(unit)
end

local function moveWindowToGrid(xcell, ycell, gridSize)
    local win = normalWindow()
    if not win then return end

    local xratio      = (gridSize >= xcell) and (gridSize - xcell) / 2.0 or 0.0
    local yratio      = (gridSize >= ycell) and (gridSize - ycell) / 2.0 or 0.0
    local screenFrame = win:screen():frame()

    win:setFrame({
        x = screenFrame.x + screenFrame.w / gridSize * xratio,
        y = screenFrame.y + screenFrame.h / gridSize * yratio,
        w = screenFrame.w / gridSize * xcell,
        h = screenFrame.h / gridSize * ycell
    })
end

local function moveWindowToScreen(win, newScreen)
    local frame          = win:frame()
    local screenFrame    = win:screen():frame()
    local newScreenFrame = newScreen:frame()

    frame.x = newScreenFrame.x + ((frame.x - screenFrame.x) / screenFrame.w) * newScreenFrame.w
    frame.y = newScreenFrame.y + ((frame.y - screenFrame.y) / screenFrame.h) * newScreenFrame.h
    frame.w = math.min(frame.w, newScreenFrame.w)
    frame.h = math.min(frame.h, newScreenFrame.h)

    win:setFrame(frame)
end

function obj:windowHints(style)
    local currentStyle = hs.hints.style
    hs.hints.style = style or currentStyle
    hs.hints.windowHints()
    hs.hints.style = currentStyle
end

function obj:snapWindow()
    local win = normalWindow()
    if win then hs.grid.snap(win) end
end

function obj:toggleWindowFullScreen()
    local win = hs.window.focusedWindow()
    if not win then return end
    win:toggleFullScreen()
end

function obj:maximizeWindow()
    local win = normalWindow()
    if win then win:maximize() end
end

function obj:minimizeWindow()
    local win = normalWindow()
    if not win then return end

    win:minimize()

    local nextWindow = hs.fnutils.find(hs.window.orderedWindows(), function(win)
        return not win:isMinimized()
    end)

    if nextWindow then nextWindow:focus() end
end

function obj:unminimizeAllWindows()
    local allWindows = hs.fnutils.filter(hs.window.allWindows(), function(win)
        return win:isMinimized()
    end)

    hs.fnutils.each(allWindows, function(win)
        win:unminimize()
    end)

    if #allWindows > 0 then
        allWindows[#allWindows]:focus()
    end
end

function obj:toggleMinimizingWindow()
    local win = hs.window.focusedWindow()

    if not win then
        obj:unminimizeAllWindows()
    else
        obj:minimizeWindow()
    end
end

function obj:centralizeWindow()
    local win = normalWindow()
    if not win then return end

    local winFrame    = win:frame()
    local screenFrame = win:screen():frame()

    win:setFrame({
        x = screenFrame.x + (screenFrame.w - winFrame.w) / 2,
        y = screenFrame.y + (screenFrame.h - winFrame.h) / 2,
        w = winFrame.w,
        h = winFrame.h
    })
end

function obj:moveWindowToNextScreen()
    local win = normalWindow()
    if not win then return end
    local nextScreen = win:screen():next()
    if nextScreen then moveWindowToScreen(win, nextScreen) end
end

function obj:moveWindowToPreviousScreen()
    local win = normalWindow()
    if not win then return end
    local previousScreen = win:screen():previous()
    if previousScreen then moveWindowToScreen(win, previousScreen) end
end

function obj:moveWindowToNextScreenWithScaling()
    local win = normalWindow()
    if not win then return end
    local nextScreen = win:screen():next()
    if nextScreen then win:moveToScreen(nextScreen) end
end

function obj:moveWindowToPreviousScreenWithScaling()
    local win = normalWindow()
    if not win then return end
    local previousScreen = win:screen():previous()
    if previousScreen then win:moveToScreen(previousScreen) end
end

function obj:pushWindowToNextScreen()
    local win = normalWindow()
    if not win then return end
    hs.grid.pushWindowNextScreen(win)
end

function obj:pushWindowToPrevScreen()
    local win = normalWindow()
    if not win then return end
    hs.grid.pushWindowPrevScreen(win)
end

function obj:pushWindowToPreviousScreen()
    self:pushWindowPrevScreen()
end

function obj:moveWindowToTopLeft()
    moveWindowToUnit({ x = 0, y = 0, w = 0.5, h = 0.5 })
end

function obj:moveWindowToTopRight()
    moveWindowToUnit({ x = 0.5, y = 0, w = 0.5, h = 0.5 })
end

function obj:moveWindowToBottomLeft()
    moveWindowToUnit({ x = 0, y = 0.5, w = 0.5, h = 0.5 })
end

function obj:moveWindowToBottomRight()
    moveWindowToUnit({ x = 0.5, y = 0.5, w = 0.5, h = 0.5 })
end

function obj:moveWindowToTopHalf()
    moveWindowToUnit({ x = 0, y = 0, w = 1.0, h = 0.5 })
end

function obj:moveWindowToBottomHalf()
    moveWindowToUnit({ x = 0, y = 0.5, w = 1.0, h = 0.5 })
end

function obj:moveWindowToLeftHalf()
    moveWindowToUnit({ x = 0, y = 0, w = 0.5, h = 1.0 })
end

function obj:moveWindowToRightHalf()
    moveWindowToUnit({ x = 0.5, y = 0, w = 0.5, h = 1.0 })
end

function obj:moveWindowToLeft60()
    moveWindowToUnit({ x = 0, y = 0, w = 0.6, h = 1.0 })
end

function obj:moveWindowToRight40()
    moveWindowToUnit({ x = 0.6, y = 0, w = 0.4, h = 1.0 })
end

function obj:moveWindowToLeft40()
    moveWindowToUnit({ x = 0, y = 0, w = 0.4, h = 1.0 })
end

function obj:moveWindowToRight60()
    moveWindowToUnit({ x = 0.4, y = 0, w = 0.6, h = 1.0 })
end

function obj:moveWindowToLeft65()
    moveWindowToUnit({ x = 0, y = 0, w = 0.65, h = 1.0 })
end

function obj:moveWindowToRight35()
    moveWindowToUnit({ x = 0.65, y = 0, w = 0.35, h = 1.0 })
end

function obj:moveWindowToLeft35()
    moveWindowToUnit({ x = 0, y = 0, w = 0.35, h = 1.0 })
end

function obj:moveWindowToRight65()
    moveWindowToUnit({ x = 0.35, y = 0, w = 0.65, h = 1.0 })
end

function obj:moveWindowToTop65()
    moveWindowToUnit({ x = 0, y = 0, w = 1.0, h = 0.65 })
end

function obj:moveWindowToBottom35()
    moveWindowToUnit({ x = 0, y = 0.65, w = 1, h = 0.35 })
end

function obj:moveWindowToTop35()
    moveWindowToUnit({ x = 0, y = 0, w = 1.0, h = 0.35 })
end

function obj:moveWindowToBottom65()
    moveWindowToUnit({ x = 0, y = 0.35, w = 1, h = 0.65 })
end

function obj:moveWindowTo4x5()
    moveWindowToGrid(4, 5, 8)
end

function obj:moveWindowTo5x6()
    moveWindowToGrid(5, 6, 8)
end

function obj:moveWindowTo6x6()
    moveWindowToGrid(6, 6, 8)
end

function obj:moveWindowTo6x7()
    moveWindowToGrid(6, 7, 8)
end

function obj:moveWindowTo6x8()
    moveWindowToGrid(6, 8, 8)
end

function obj:moveWindowTo7x8_5()
    moveWindowToGrid(7, 8.5, 9)
end

function obj:resizeWindowThinner()
    local win = normalWindow()
    if not win then return end
    hs.grid.resizeWindowThinner(win)
end

function obj:resizeWindowTaller()
    local win = normalWindow()
    if not win then return end
    hs.grid.resizeWindowTaller(win)
end

function obj:resizeWindowShorter()
    local win = normalWindow()
    if not win then return end
    hs.grid.resizeWindowShorter(win)
end

function obj:resizeWindowWider()
    local win = normalWindow()
    if not win then return end
    hs.grid.resizeWindowWider(win)
end


function obj:pushWindowUp()
    local win = normalWindow()
    if not win then return end
    hs.grid.pushWindowUp(win)
end

function obj:pushWindowDown()
    local win = normalWindow()
    if not win then return end
    hs.grid.pushWindowDown(win)
end

function obj:pushWindowLeft()
    local win = normalWindow()
    if not win then return end
    hs.grid.pushWindowLeft(win)
end

function obj:pushWindowRight()
    local win = normalWindow()
    if not win then return end
    hs.grid.pushWindowRight(win)
end

function obj:focusUpWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowNorth() end
end

function obj:focusDownWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowSouth() end
end

function obj:focusLeftWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowWest() end
end

function obj:focusRightWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowEast() end
end

return obj
