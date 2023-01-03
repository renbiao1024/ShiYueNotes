local obj = CS.Lesson8()

print("行："..obj.array:GetLength(0))
print("列："..obj.array:GetLength(1))
print(obj.array:GetValue(0,0))

for i = 0, obj.array:GetLength(0) - 1 do
    for j = 0, obj.array:GetLength(1) - 1 do
        print(obj.array:GetValue(i,j))
    end
end