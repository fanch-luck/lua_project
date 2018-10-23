test_start_limits = 11
local path = we_bas_getsriptpath()
local datapath = ""
local resultpath = ""
if path ~= nil then
    datapath = path.."data.txt"
    resultpath = path.."results.txt"
end
--print(we_u8ta(datapath))
--print(we_u8ta(resultpath))
--assert(we_bas_file_exist(datapath))
--assert(we_bas_file_exist(resultpath))
function start_test()
    print("\n".."==============================test begins==============================")
    --print("file existed? "..tostring(we_bas_file_exist(datapath)))
	--print(_FUNCS.addnum(5,6)) --practice.lua
    --print(we_u8ta(_FUNCS.readtxt(datapath)))  --practice.lua
    print(_FUNCS.writetxt(resultpath, '123cdf', we_u8ta("你好")))
	--print(_FUNCS.addnum(5,7))  --functions.lua
    --print(test_addnum({5,8}))  --test_functions.lua
    print("==============================test ends==============================".."\n")
end