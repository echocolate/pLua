local base = {}

function base:extend(obj)
    function obj:toString(x)
        if not x then x="" end
        for k,v in pairs(self) do
            if type(v) == "table" then
                print(x .. ">" ..  k .. ": table")
                base:extend(v)
                x = x .. ">" .. k
                v:toString(x)
            end
            if type(v) ~= "function" and type(v) ~= "table" then
                print(x .. ">" .. k .. ":" .. v)
            end
        end
    end
    return obj
end

function base:tbl2string(obj, prefix)
    prefix = prefix or "|"
    for k,v in pairs(self) do
        if type(v) == "table" then
            print(prefix .. ">" ..  k .. ": table")
            prefix = prefix .. ">" .. k
            tbl2string(v, prefix)
        end
        if type(v) ~= "function" and type(v) ~= "table" then
            print(prefix .. ">" .. k .. ":" .. v)
        end
    end
end

return base

