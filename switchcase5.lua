
local case = {}
local switch =
    setmetatable(
    {},
    {
		__call = 	function(t, k)
						
						case = setmetatable({}, {__call = function(t,k) return t[k] end,
						__index = 	
						function(t,data) 
							if data == k then 
								return setmetatable({},{__call =	function(t, fn)
										fn()
									end
									
								})
							else 
								return (function() end)
							end 
							
						end  })
						return t[k]
					end,
        __index = 	function(t,data)
					-- data = switch(here)
						return setmetatable({},{__call =	function(t, ...)
										
									end
									
								})
					end,
		
    }
)

local a= 4
switch(a)(
	case(1)(function()
		print(99)
	end),
	case(4)(function()
		print(98)
	end)
)