People={} --模拟类

People.sayHi=function(self)
	print("People say Hi:"..self.name)
end

function People.sayHello()
	print("People say Hello")
end

People.new = function(name)
	local self = clone(People)
	self.name=name
	return self
end
------------------------------------
--Man类 继承People
Man={}
Man.new=function(name)
  self = People.new(name)
  copy(self, Man)
  return self
end

Man.sayHello = function ()
	print("Man say Hello")
end
-------------------------------------
function clone(tab)
	local Ins = {}
	for key, var in pairs(tab) do
		Ins[key]=var
	end
	return Ins
end
function copy(dist, tab)
	for key, var in pairs(tab) do
		dist[key]=var
	end
end
------------------------------------

local function main()
  local p = People.new("zhangsan")
  p.sayHi(p)
  p:sayHi()----------这两个不一样
  p.sayHello()
  
  print("--------------------------")
  
  local m = Man.new("Lisi")
  m:sayHello()
  m:sayHi()
end

main()
