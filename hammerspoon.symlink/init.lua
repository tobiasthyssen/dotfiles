-- Autoreload config on changes
auto_reload = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
    hs.reload()
end)
auto_reload:start()
hs.alert.show("🤖")

-- Mouse back / forward
-- NOTE: If on a keyboard with danish layout, this only works by modifying safari shortcut to "cmd + å" and "cmc + ¨".
--       Hammerspoon translates the missing key ("[" and "]") to keycode 30 and 33, which the system translates to "å" and "¨"
mouse_back_forward = hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, function(event)
    if event:getButtonState(3) then
        hs.eventtap.keyStroke({"cmd"}, "[")
        return true
    elseif event:getButtonState(4) then
        hs.eventtap.keyStroke({"cmd"}, "]")
        return true
    else
        return false
    end
end)
mouse_back_forward:start()

-- Window management
local hyper = {"cmd", "alt", "ctrl"}

hs.grid.GRIDHEIGHT = 6
hs.grid.GRIDWIDTH = 6
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

hs.window.animationDuration = 0

hs.hotkey.bind(hyper, "Left", function()
    local window = hs.window.focusedWindow()

    hs.grid.set(window, {
        x = 0,
        y = 0,
        w = 3,
        h = 6
    })
end)

hs.hotkey.bind(hyper, "Right", function()
    local window = hs.window.focusedWindow()

    hs.grid.set(window, {
        x = 3,
        y = 0,
        w = 3,
        h = 6
    })
end)

hs.hotkey.bind(hyper, "Up", function()
    local window = hs.window.focusedWindow()

    hs.grid.set(window, {
        x = 0,
        y = 0,
        w = 6,
        h = 6
    })
end)

hs.hotkey.bind(hyper, "1", function()
    local window = hs.window.focusedWindow()

    hs.grid.set(window, {
        x = 0,
        y = 0,
        w = 2,
        h = 6
    })
end)

hs.hotkey.bind(hyper, "2", function()
    local window = hs.window.focusedWindow()

    hs.grid.set(window, {
        x = 2,
        y = 0,
        w = 2,
        h = 6
    })
end)

hs.hotkey.bind(hyper, "3", function()
    local window = hs.window.focusedWindow()

    hs.grid.set(window, {
        x = 4,
        y = 0,
        w = 2,
        h = 6
    })
end)

-- Caffeine menubar item
function refreshTitle(menubarItem)
    if hs.caffeinate.get("displayIdle") then
        menubarItem:setTitle("☀︎")
    else
        menubarItem:setTitle("☾")
    end
end

caffeine = hs.menubar.new()
caffeine:setClickCallback(function()
    hs.caffeinate.toggle("displayIdle")
    refreshTitle(caffeine)
end)
refreshTitle(caffeine)
