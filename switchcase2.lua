switch = setmetatable({},{__call = function(tbl,data) case={} return setmetatable(case,{__newindex=function(t,k,v) if data == k then v() end  end  })  end })
local a = 1
switch(a)
	case[1] = function() print(2) end;