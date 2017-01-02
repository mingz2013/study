local function main()

  Config={}
  
  Config.words="hello"
  
  Config.num=100
  
  print(Config.words)
  
  Config["name"]="уехЩ"
  
  print(Config.name)
  
  print(Config["num"])
  print("--------------------------")
  for key, var in pairs(Config) do
  	print(key, var)
  end
  
  
  print("------------------------")
  
  Config2={haha="haha", heihei="heihei"}
  
  print(Config2.haha)
  print(Config2.heihei)

end
main()
