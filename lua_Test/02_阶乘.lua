function Fact (n)
    if n < 0 then
        n = -n
    elseif n == 0 then
        return 1
    else
        return n * Fact(n-1)
    end
end

print("enter a number:")

A = io.read("*n")
print(Fact(A))
