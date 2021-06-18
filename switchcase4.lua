

local switch =
    setmetatable(
    {},
    {
		__call = 	function(t, k)
						
						case = setmetatable(
							{},
							{
								__call = 	function(t, k)
												return t[k]
											end,
								__index = 	function(t,data)
												
												return setmetatable({},{__call =	function(t, tbl)
																						if data == k then 
																							return tbl() 
																						end 
																					end
															
														})
											end
								
							}
						)
						return t[k]
					end,
        __index = 	function(t,k)
						return setmetatable({},{__call =	function(t, ...)
																local tc = {...}
																for i=1,#tc do 
																	tc[i]()
																end 
															end
									
								})
					end,
		
    }
)

local a= 1
switch(a)(
	case(1)(function()
			print(998)
	end),
	case(2)(function()
			print(999)
	end)
)