local case,stm = {},setmetatable
local switch = stm({},{__call=function(a,b)case=stm({},{__call=function(a,b)return a[b]end,__index=function(a,c)return c and c==b and stm({},{__call=function(a,d)d()end})or function()end end})return a[b]end,__index=function(a,c)return stm({},{__call=function(a,...)end})end})

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

