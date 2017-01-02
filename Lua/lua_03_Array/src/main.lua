local function main()


arr={1, 2, 3, 4, "hello"} --索引从1开始

for key, var in pairs(arr) do
	print(key, var)
end

print("---------------------")

arr={}
for var=1, 100 do
	table.insert(arr,1,var)  --在第1个位置插入   每次都在第1个位置插入
end
for key, var in pairs(arr) do
	print(key, var)
end

print(table.maxn(arr))  --表的最大索引   也就是表的大小 长度


end
main()
