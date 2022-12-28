function traceback()
    for lv = 1, math.huge do
        local info = debug.getinfo(lv, "Sl")
        if not info then break end
        if info.what == "C" then
            print("C function")
        else
            print("lua function")
        end
    end
end

