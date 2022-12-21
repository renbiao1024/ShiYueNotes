local geometry = require("geometry")
local C1 = geometry.Circle(0,0,0.5)
geometry.Plot(geometry.Diff(C1, geometry.Trans(C1, 0.3, 0)), 100, 50)


local function searcher(name,path)
    assert(type(name) == "string","invalid name")
    assert(type(path) == "string","invalid path")
    local filename = package.searchpath(name,path)
    local err = ""
    if filename then
        print("loadfile")
        local f = loadfile(filename)
        if not f then
            print("loadlib")
            f = assert(package.loadlib(filename),filename .. " load failed")
        end
        return f
    else
        err = "\n\tno file '".. name .." can be loaded"
    end
    return nil,err
end
package.searchers[#package.searchers + 1] = searcher