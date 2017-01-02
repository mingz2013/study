function People(name)
	
	self={}
	
	local function init()
		self.name = name
	end
	
	self.sayHi=function()
	 print("People say Hi")
	end	
	
	init()
	return self
end

function Man(name)
	self = People(name)
	local function init()	
	end
	init()
	self.sayHello = function ()
		print("Man say Hello:"..self.name)
	end
	return self
end

local function main()
  local p = People("zhangsan")
  p:sayHi()
  
  print("---------------------")
  
  local m = Man("Lisi")
  m:sayHi()
  m:sayHello()
end
main()
