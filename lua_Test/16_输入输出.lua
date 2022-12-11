-- -- 不需要连接符，用逗号分开即可
-- io.write("sin(3) = ", math.sin(3), "\n")
-- --配合format更好的控制
-- io.write(string.format("sin(3) = %.4f\n", math.sin(3)))


local lines = {}
print(lines)
for line in io.lines("16_data.txt") do
    lines[#lines+1] = line
end
--table.sort(lines)

for _, l in ipairs(lines) do
    io.write(l, "\n")
end