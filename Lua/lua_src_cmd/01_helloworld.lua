-- Game Development with Lua
-- Lua script example
-- Helloworld
print("1.helloworld----------------------")
myString = "Hello world"
print(myString)

print("2.comment----------------------------")
-- this is a comment in Lua that is on its own line
myValue = 7 -- you can also add a comment to a line of script
--[[
there is a area comment in Lua 

--]]

print("3.type-----------------------------------")
print("Lua 中有5种变量类型：nil, Boolean, string, Number, table")

myValue = 7
print(myValue, "type is ", type(myValue))
myValue = "hello" -- a string variable
print(myValue, "type is ", type(myValue))
myValue = nil --this deletes the variable
print(myValue, "type is ", type(myValue))
local myValue --this creates a local variable with an initial nil value
print(myValue, "type is ", type(myValue))
myValue = true --creates a boolean varibale with a value of true
print(myValue, "type is ", type(myValue))
print("\a") -- 响铃 会发出 嘟 的声音

myNumber = 7
myNumber = 0.765
myNumber = 7.65e8
myNumber = 7.65e-2

myTable = {2, 4, 6, 8, 10}
print(myTable[3])
myTable[6] = 12
print(myTable[6])

print("4.variable--------------------")
local myValue --the variable is declared and has a value of nil
local myValue2 = 3 --the variable has an initial value of 3


myValue = 17
if myValue < 6 then
	print("")
elseif myValue < 11 then
elseif myValue < 21 then
else
end

index = 1
while index < 10 do
	print("loop pass: ", index)
	index = index + 1
end

index = 1
repeat
	print("loop pass: ", index)
	index = index + 1
until index > 10

for index = 10, 1, -1 do
	print(index)
end

for index = 1, 100, 2 do
	print(index)
	if index == 53 then
		print("52--ouch! ")
		break
	end
end

