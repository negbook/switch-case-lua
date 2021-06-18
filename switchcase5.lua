local case = {}
local switch =
    setmetatable(
    {},
    {
        __call = function(t, k)
            case =
                setmetatable(
                {},
                {
                    __call = function(t, k)
                        return t[k]
                    end,
                    __index = function(t, data)
                        return data and data == k and setmetatable(
                                {},
                                {
                                    __call = function(t, fn)
                                        fn()
                                    end
                                }
                            ) or (function()
                            end)
                    end
                }
            )
            return t[k]
        end,
        __index = function(t, data)
            return setmetatable(
                {},
                {
                    __call = function(t, ...)
					
                    end
                }
            )
        end
    }
)

local a = 4
local b = "some"
switch(a)(
    case(1)(function()
            print(99)
    end),
    case(4)(function()
            print(98)
    end)
)
switch(b)(
    case("some")(function()
            print(99)
    end),
    case("where")(function()
            print(98)
    end)
)