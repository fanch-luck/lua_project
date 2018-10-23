functions_limits = 11
--local _FUNCS = {}  --PI运行时注释
_FUNCS = {}  --PI运行时取消注释
function _FUNCS.addnum(input1, input2)
    return tonumber(input1) + tonumber(input2)
end

function _FUNCS.readtxt(filepath)
    if filepath ~= nil and we_bas_file_exist(filepath) == true then  --PI运行时取消注释   
        --需要先判断路径存在再进行读取操作
        local f = assert(io.open(filepath, 'r'))
	    local content = f:read("*all")
	    f:close()
        return content
    end  --PI运行时取消注释   
end


function _FUNCS.split(szFullString, szSeparator)    --实现字符串分割并存入table变量
local nFindStartIndex = 1  
local nSplitIndex = 1  
local nSplitArray = {}  
while true do  
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
   if not nFindLastIndex then  
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
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
--return _FUNCS --PI运行时注释

