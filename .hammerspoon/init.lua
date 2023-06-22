local hyper = {"cmd", "alt", "ctrl"}

-- Load spoons
-- hs.loadSpoon("EmmyLua")

-- Reload hammerspoon config
hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

-- Multi window layout
hs.hotkey.bind(hyper, "L", function()
    local coursePath = "~/Documents/Physics/current-course"
    KittyWatch = function (name, eventType, app)
        if string.find(name, "kitty") and (eventType == hs.application.watcher.launched or eventType == hs.application.watcher.activated) then
            print("kitty activated")
            local kittyWindow = app:mainWindow()
            kittyWindow:setFullScreen(true)
            hs.eventtap.keyStroke({ "cmd" }, "T", app)
            hs.eventtap.keyStrokes(string.format("vim %s/*.tex",coursePath), app)
            hs.eventtap.keyStroke({}, "return", app)
            kittyWindow:focus()
            -- moving summary pdf here is not possible with current hammerspoon
        end
    end
    AppWatch = hs.application.watcher.new(KittyWatch)
    AppWatch:start()
    hs.execute(string.format("open %s/*.pdf", coursePath))
    hs.application.launchOrFocus("kitty") -- Note that if kitty is already in focus this won't work as no event will be sent
    hs.timer.doAfter(2, function ()
        AppWatch:stop()
    end)
end)
