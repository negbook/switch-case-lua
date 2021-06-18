switch =
    setmetatable(
    {},
    {
		__call = function(t, k)
						return t[k]
				end,
        __index = function(t,data)
			return setmetatable(
			{},
			{
				__call = function(t, cb)
						return cb(setmetatable(
                {},
                {__newindex = function(t, k, v) 
                        if data == k then
                            v()
                        end
                end}
            ))
						
				end
									
			})
		end
		
    }
)

local a= 1
switch(a)(function(case)
		case[1] = function()
            print(3) 
        end;
        case[2] = function()
            print(2)
        end;
	
end)
