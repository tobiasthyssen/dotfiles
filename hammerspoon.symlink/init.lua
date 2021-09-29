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
