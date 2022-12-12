network = {
    {name = "a", IP = 123},
    {name = "b", IP = 234},
    {name = "c", IP = 452}
}

table.sort(network, function(a,b) return (a.IP > b.IP) end)


function derivative(f, delta)
    delta = delta or 1e-4
    return function(x)
        return (f(x+delta) - f(x)) / delta
    end
end

c = derivative(math.sin)
print(math.cos(4), c(4))