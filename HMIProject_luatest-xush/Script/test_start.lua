test_start_limits = 11
--确认文件路径正确
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

--读取函数文件，打印所有测试用例
local func = _FUNCS
readtxt = func.readtxt
split = func.split
data = readtxt(datapath)  --读取整个用例文件为字符串
datalines = split(datalines, "\n")  --获取所有数据行
print("测试用例")
for i=1, #datalines do print(datalines[i]) end
local testfunc = nil  --测试时将此变量偏移为测试函数名
local testfuncname = nil
local testfuncparamnum = 0  --测试函数参数个数，0表示参数个数为0
local testfuncreturnvaluenum = 0  --测试函数返回值个数，0表示无返回值
local test_func_real_return = nil
local test_func_params = nil
for i=1, #datalines do
    local line = data[i]  --当前数据行
    if not string.find(line, ",") then  --打印文件头部
        print(line)
    else if string.find(line, "start") then --获取函数名
        testfuncname = split(line, ",")[2]
        testfuncparamnum = tostring(split(line, ",")[3])
        testfuncreturnvaluenum = tostring(split(line, ",")[4])
    else  --执行函数
        if testfuncparamnum == 0 then  --无参数
            test_func = load(testfuncname..'()')  --函数名字符串导入(待执行执行)
            test_func_real_return = test_func()  --执行函数
        else  --有参数
            line_params = split(line, ",")[2]
            paramstr = string.gsub(line_params, "/", ",")
            test_func_str = testfuncname.."("..paramstr..")"  --组装待调用函数字符串
            test_func = load(test_func_str)
            test_func_real_return = test_func()
        end
    end 
    
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