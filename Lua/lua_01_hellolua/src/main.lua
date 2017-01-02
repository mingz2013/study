local function main()

print("hello lua")

num = 100
print(num)

HelloFunc()

print(max(12, 13))


for var=1, 100 do
	print(var)
end

end


function HelloFunc()
	print("hello function")
end

function max(a, b)
	if a>b then
		return a
	else
	 return b
	end
end


main()
