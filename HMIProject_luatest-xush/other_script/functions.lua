functions_limits = 11
_FUNCS = {}

function _FUNCS.addnum(input1, input2)
    return tonumber(input1) + tonumber(input2)
end

function _FUNCS.readtxt(filepath)
    if filepath ~= nil and we_bas_file_exist(filepath) == true then
        local f = assert(io.open(filepath, 'r'))
        local content = f:read("*all")
        f:close()
        return content
    else
        print("file not found: "..tostring(filepath))
    end
end

function _FUNCS.writetxt(filepath, ...)
    if filepath ~= nil and we_bas_file_exist(filepath) == true then
        local f = assert(io.open(filepath, 'a'))
        for i, v in ipairs{...} do
            print(v)
            f:write(v.."\n")
        end
        f:close()
        return true
    else
        print("file not found: "..tostring(filepath))
        return false
    end
end


function _FUNCS.split(szFullString, szSeparator)    --实现字符串分割并存入table变量
local nFindStartIndex = 1  
local nSplitIndex = 1  
local nSplitArray = {}  
while true do  
   local nFindLastIndex = string.find(szFullString or "", szSeparator, nFindStartIndex)  
   if not nFindLastIndex then  
    nSplitArray[nSplitIndex] = string.sub(szFullString or "", nFindStartIndex, string.len(szFullString or ""))  
    break  
   end  
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
   nSplitIndex = nSplitIndex + 1  
end  
return nSplitArray  
end

--print(_FUNCS.addnum(5,2))
--print(_FUNCS.readtxt("data.txt"))
--l = _FUNCS.split("1,abc,def,你我他", ",")
--for i=1, #l do print(l[i]) end
--return _FUNCS


