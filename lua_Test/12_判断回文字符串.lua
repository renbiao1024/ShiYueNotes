function isPali(s)
    if s:reverse() == s then
        return true
    else 
        return false
    end
end

print(isPali("Hello World"))
print(isPali("HelleH"))