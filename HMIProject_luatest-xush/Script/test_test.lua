test_test_limits = 00


function printtable(tablename)
    for i,v in ipairs(tablename) do
        print(v)
    end
end

function addnum(input1, input2)
    --将两数字相加，4则运算后的结果都是浮点数
    return tonumber(input1) + tonumber(input2)
end

function subnum(input1, input2)
    --将两数字相减，4则运算后的结果都是浮点数
    return tonumber(input1) - tonumber(input2)
end

function getnowtime()
    local time=os.date("%Y-%m-%d %H:%M:%S")
    return time
end

function split(szFullString, szSeparator)    --实现字符串分割并存入table变量
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

function readtxt(filepath)
    --读文件，实际运行时必须确认文件存在才允许继续读写
	local f = assert(io.open(filepath, 'r'))
	local content = f:read("*all")
	f:close()
	return content
end

function writetxt(filepath, content)
    --写文件，实际运行时必须确认文件存在才允许继续读写
	local f = assert(io.open(filepath, 'w'))
	f:write(content)
	f:close()
	return true
end

function writetxts(filepath, ...)
    --写多个字符串到文件，每个字符串写入后添加换行，实际运行时必须确认文件存在才允许继续读写
    local f = assert(io.open(filepath, 'a'))
    for i, v in ipairs{...} do
        print(v)
        f:write(v.."\n")
    end
	f:close()
end

--确认文件路径正确
--local path = we_bas_getsriptpath()
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
--local func = _FUNCS
--readtxt = func.readtxt
--split = func.split
data = readtxt("E:\\MyWorkPlace\\lua_project\\HMIProject_luatest-xush\\Script\\data.txt")  --读取整个用例文件为字符串
datalines = split(data, "\n")  --获取所有数据行
--print("==================== test cases ====================")
printtable(datalines)
local test_func_name = nil
local test_func_param_num = 0  --测试函数参数个数，0表示参数个数为0
local test_func_return_value_num = 0  --测试函数返回值个数，0表示无返回值
local test_func_real_return = nil
local test_func_params = nil
print("==================== test results ====================")
for i, v in ipairs(datalines) do
    local result_info = nil
    local line = v  --当前数据行
    if not string.find(line, ",")  --打印文件头部
    then  
        qq =  nil
    elseif string.find(line, "end")  --获取函数名
    then
        result_info = line
    elseif string.find(line, "start")  --获取函数名
    then 
        test_func_name = split(line, ",")[2]
        test_func_param_num = tostring(split(line, ",")[3])
        test_func_return_value_num = tostring(split(line, ",")[4])
        result_info = 'start,'..test_func_name
    else  --执行函数
        line2t = split(line, ',')
        id = line2t[1]
        line_params = line2t[2]
        test_func_desired_return = line2t[3]
        if test_func_param_num == 0 then  --无参数
            test_func_str = 'return '..test_func_name..'()' --函数名字符串导入(待执行执行)
        else  --有参数
            paramstr = string.gsub(line_params, "/", ",")  --将参数串中斜杠/替换为逗号,
            test_func_str = 'return '..test_func_name.."("..paramstr..")"  --组装待调用函数字符串
        end
        test_func = load(test_func_str)  --装载待调用函数字符串
        if pcall(test_func) then  --用调试方式进行函数调用，代码出错时不退出
            test_func_real_return = test_func()  --函数调用调用
        else
            test_func_real_return = 'nil'  --函数不能正常运行时应返回nil
        end
        if  tostring(test_func_real_return) == tostring(test_func_desired_return) then  --判断函数输出是否与预期一致
            result = "True"
        else 
            result = "False"
        end
        --打印和写入测试结果
        result_info = id..','..test_func_str..','..tostring(test_func_desired_return)..','..tostring(test_func_real_return)..','..result
    end 
    if result_info ~= nil then
        print(result_info)
    end
end

function start_test()
    print("\n".."==============================test begins==============================")
    --print("file existed? "..tostring(we_bas_file_exist(datapath)))
	--print(_FUNCS.addnum(5,6)) --practice.lua
    --print(we_u8ta(_FUNCS.readtxt(datapath)))  --practice.lua
    --print(_FUNCS.writetxt(resultpath, '123cdf', we_u8ta("你好")))
	--print(_FUNCS.addnum(5,7))  --functions.lua
    --print(test_addnum({5,8}))  --test_functions.lua
    print("==============================test ends==============================".."\n")
end

-----------------------------以下调试测试专用，正式运行时应注释---------------------------
--print(addnum(11,22))
--writetxts("results.txt","\n开始")
--writetxts("results.txt","123",'456',"Hello, world!")
--printtable({'a','b','c'})
--function func(a)
--    return a
--end
--f = load("return func(10)")  --正确的字符串函数调用方法
--print(f())

