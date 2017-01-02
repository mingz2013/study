print("function.................")

function Wow()
	print(" ")
	print("Wow, that was awesome!")
	print(" ")
end

function SetName(myString)
	print(" ")
	print("Your name is:", myString)
	print(" ")
end

function MyInfo(myName, myAge)
	print(" ")
	print("Your name is: ", myName)
	print("Your age is: ", myAge)
	print(" ")
end

function HowMany(...)
	print(table.getn(arg))	--something wrong with maxn
	if table.getn(arg) > 0 then
		for index = 1, arg.n do
			local myString = string.format("%s%d", "Argument ", index, ":")
			print(myString, arg[index])
		end
	else
		print("No variables entered.")
	end
end

function Multiply(val1, val2, ...)
	--the default is one
	local myString
	if arg.n == 0 then
		myString = string.format("%d%s%d%s%d", val1, " * ", val2, " = ", val1 * val2)
	else
		local val3 = val1 * val2 * arg[1]
		myString = string.format("%d%s%d%s%d%s%d", val1, " * ", val2, " * ", arg[1], " = ", val3)
	end
	print(myString)
end

function TimesTwo(myValue)
	myValue = myValue * 2
	return myValue
end

function ThreeDice()
	d1 = math.random(1, 6)
	d2 = math.random(1, 6)
	d3 = math.random(1, 6)
	myTotal = d1 + d2 + d3
	return d1, d2, d3, myTotal
end

function main()
	Wow()
	SetName("MingZ")
	MyInfo("MingZ", 23)
	
	--HowMany("a", "b", "c", "d", "e")
	--Multiply(100, 2, 3)
	
	local myValue = 2
	local myString = string.format("%d%s", myValue, " * 2 = ")
	print(myString, TimesTwo(myValue))
	
	a, b, c, d = ThreeDice()
	print(a, b, c, d)
end

main()