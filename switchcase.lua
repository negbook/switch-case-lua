switch = function(data,cb) 
            cb(setmetatable(
                {},
                {__newindex = function(t, k, v) 
                        if data == k then
                            v()
                        end
                end}
            ))
end

local a = 1

switch(a,function(case)
        case[1] = function()
            print(2)
            
        end;
end)