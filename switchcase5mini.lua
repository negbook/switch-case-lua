local case = {}
local switch = setmetatable({},{__call=function(a,b)case=setmetatable({},{__call=function(a,b)return a[b]end,__index=function(a,c)return c and c==b and setmetatable({},{__call=function(a,d)d()end})or function()end end})return a[b]end,__index=function(a,c)return setmetatable({},{__call=function(a,...)end})end})
--example
local a = 4
switch(a)(
    case(1)(function()
            print(99)
    end),
    case(4)(function()
            print(98)
    end)
)

