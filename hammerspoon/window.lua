function windowHints()
    local win = hs.window.focusedWindow()
    if win then
        hs.hints.windowHints(win:otherWindowsAllScreens())
    else
        hs.hints.windowHints()
    end
end

function getNormalWindow()
    local win = hs.window.focusedWindow()
    if win and win:isFullScreen() then win = nil end
    return win
end

function snapWindow()
    local win = getNormalWindow()
    if win then hs.grid.snap(win) end
end

function toggleWindowFullScreen()
    local win = hs.window.focusedWindow()
    if not win then return end
    win:toggleFullScreen()
end

function maximizeWindow()
    local win = getNormalWindow()
    if win then win:maximize() end
end

function minimizeWindow()
    local win = getNormalWindow()
    if not win then return end

    win:minimize()

    local nextWindow = hs.fnutils.find(hs.window.orderedWindows(), function(win)
        return not win:isMinimized()
    end)

    if nextWindow then nextWindow:focus() end
end

function unminimizeAllWindows()
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

function toggleMinimizingWindow()
    local win = hs.window.focusedWindow()

    if not win then
        unminimizeAllWindows()
    else
        minimizeWindow()
    end
end

function centralizeWindow()
    local win = getNormalWindow()
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

function moveWindowToScreen(win, newScreen)
    local frame           = win:frame()
    local screenFrame     = win:screen():frame()
    local nextScreenFrame = newScreen:frame()

    frame.x = nextScreenFrame.x + ((frame.x - screenFrame.x) / screenFrame.w) * nextScreenFrame.w
    frame.y = nextScreenFrame.y + ((frame.y - screenFrame.y) / screenFrame.h) * nextScreenFrame.h
    frame.w = math.min(frame.w, nextScreenFrame.w)
    frame.h = math.min(frame.h, nextScreenFrame.h)

    win:setFrame(frame)
end

function moveWindowToNextScreen()
    local win = getNormalWindow()
    if win and win:screen():next() then moveWindowToScreen(win, win:screen():next()) end
end

function moveWindowToPreviousScreen()
    local win = getNormalWindow()
    if win and win:screen():previous() then moveWindowToScreen(win, win:screen():previous()) end
end

function moveWindowToNextScreenWithScaling()
    local win = getNormalWindow()
    if win and win:screen():next() then win:moveToScreen(win:screen():next()) end
end

function moveWindowToPreviousScreenWithScaling()
    local win = getNormalWindow()
    if win and win:screen():previous() then win:moveToScreen(win:screen():previous()) end
end

function moveWindowToUnit(unit)
    local win = getNormalWindow()
    if win then win:moveToUnit(unit) end
end

function handleWindowWithFunction(fn)
    return function()
        local win = getNormalWindow()
        if not win then return end
        fn()
    end
end

function moveWindowToUnit(unit)
    local win = getNormalWindow()
    if win then win:moveToUnit(unit) end
end

function moveWindowToTopLeft()
    moveWindowToUnit({ x = 0, y = 0, w = 0.5, h = 0.5 })
end

function moveWindowToTopRight()
    moveWindowToUnit({ x = 0.5, y = 0, w = 0.5, h = 0.5 })
end

function moveWindowToBottomLeft()
    moveWindowToUnit({ x = 0, y = 0.5, w = 0.5, h = 0.5 })
end

function moveWindowToBottomRight()
    moveWindowToUnit({ x = 0.5, y = 0.5, w = 0.5, h = 0.5 })
end

function moveWindowToTopHalf()
    moveWindowToUnit({ x = 0, y = 0, w = 1.0, h = 0.5 })
end

function moveWindowToBottomHalf()
    moveWindowToUnit({ x = 0, y = 0.5, w = 1.0, h = 0.5 })
end

function moveWindowToLeftHalf()
    moveWindowToUnit({ x = 0, y = 0, w = 0.5, h = 1.0 })
end

function moveWindowToRightHalf()
    moveWindowToUnit({ x = 0.5, y = 0, w = 0.5, h = 1.0 })
end

function moveWindowToLeft60()
    moveWindowToUnit({ x = 0, y = 0, w = 0.6, h = 1.0 })
end

function moveWindowToRight40()
    moveWindowToUnit({ x = 0.6, y = 0, w = 0.4, h = 1.0 })
end

function moveWindowToLeft40()
    moveWindowToUnit({ x = 0, y = 0, w = 0.4, h = 1.0 })
end

function moveWindowToRight60()
    moveWindowToUnit({ x = 0.4, y = 0, w = 0.6, h = 1.0 })
end

function moveWindowToLeft65()
    moveWindowToUnit({ x = 0, y = 0, w = 0.65, h = 1.0 })
end

function moveWindowToRight35()
    moveWindowToUnit({ x = 0.65, y = 0, w = 0.35, h = 1.0 })
end

function moveWindowToLeft35()
    moveWindowToUnit({ x = 0, y = 0, w = 0.35, h = 1.0 })
end

function moveWindowToRight65()
    moveWindowToUnit({ x = 0.35, y = 0, w = 0.65, h = 1.0 })
end

function moveWindowToGrid(xcell, ycell, gridSize)
    local win = getNormalWindow()
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

function moveWindowTo6x6()
    moveWindowToGrid(6, 6, 8)
end

function moveWindowTo6x7()
    moveWindowToGrid(6, 7, 8)
end

function moveWindowTo6x8()
    moveWindowToGrid(6, 8, 8)
end

function moveWindowTo7x8_5()
    moveWindowToGrid(7, 8.5, 9)
end

function focusUpWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowNorth() end
end

function focusDownWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowSouth() end
end

function focusLeftWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowWest() end
end

function focusRightWindow()
    local win = hs.window.focusedWindow()
    if win then win:focusWindowEast() end
end


--------------------------------------------------------------------------------
-- OPEN OR ACTIVATE APPLICATION
--------------------------------------------------------------------------------
local NAMES = { iTerm2 = "iTerm", iTerm = "iTerm" }

function findNextWindow(app, win)
    local windows = app:standardWindows()

    table.sort(windows, function(a, b)
        return a:id() < b:id()
    end)

    local nextWindow = hs.fnutils.find(windows, function(w)
        return w:id() > win:id()
    end)

    return (nextWindow or windows[1])
end

function findNextApplication(apps, app)
    local applications = hs.fnutils.copy(apps)

    table.sort(applications, function(a, b)
        return a:pid() < b:pid()
    end)

    local nextApplication = hs.fnutils.find(applications, function(a)
        return a:pid() > app:pid()
    end)

    return (nextApplication or applications[1])
end

function activateApplicationWithWindow(app, win)
    local mainWindow

    if win then mainWindow = findNextWindow(app, win) end

    if not mainWindow then
        local windows = app:standardWindows()
        mainWindow = app:mainWindow() or windows[#windows]
    end

    if mainWindow then mainWindow:unminimize() end

    app:activate(false)
end

function activateApplication(name, applications)
    local apps = applications or hs.appfinder.appsFromName(name)

    if #apps == 0 then return end

    local win = hs.window.focusedWindow()

    if #apps == 1 then
        if win and win:application():pid() == apps[1]:pid() then
            activateApplicationWithWindow(apps[1], win)
        else
            activateApplicationWithWindow(apps[1])
        end
    else
        local app = apps[#apps]

        if win then app = findNextApplication(apps, win:application()) end

        activateApplicationWithWindow(app)
    end
end

function activateApplicationFunction(name)
    return function()
        activateApplication(name)
    end
end

function openApplication(name)
    local apps = hs.appfinder.appsFromName(name)

    if #apps == 0 or (#apps == 1 and #apps[1]:allWindows() < 2) then
        hs.application.launchOrFocus(NAMES[name] or name)
    else
        activateApplication(name, apps)
    end
end

function openApplicationFunction(name)
    return function()
        openApplication(name)
    end
end

function openInitialApplications()
    hs.alert.show("Opening initial applications...")
    openApplication("Slack")
    openApplication("Skype")
    openApplication("Google Chrome")
    openApplication("iTerm2")
end
