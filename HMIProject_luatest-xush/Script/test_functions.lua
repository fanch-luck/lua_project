test_functions_limits = 11
local func = _FUNCS
readtxt = func.readtxt
split = func.split
d = readtxt("data.txt")
d = split(d, "\n")
function test_addnum(data)
	print("测试用例")
	for i=1, #data do print(d[i]) end
	print("测试报告")
	for i=1, #data do
		--print(data[i])
		local s = data[i]
		local inputs = {}
		if not string.find(s, ",") then
		    print(s)
		else
			line2t = split(data[i], ",")
			--2,100/400,500for i=1, #line2t do print(line2t[i]) end
			inputs = split(line2t[2], "/")
		    --for i=1, #inputs do print(inputs[i]) end
	        in1 = inputs[1]
	        in2 = inputs[2]
	        --re_sum=line2t[3]*1.0
	        if tonumber(line2t[3]) then 
	        	re_sum=line2t[3]*1.0
	        else 
	            re_sum=line2t[3] 
	        end
	        --print(re_sum)
            local result = "False"
            local addnum = func.addnum
            if pcall(addnum, in1, in2) then
                sum = func.addnum(in1, in2)
            else
    	    	sum = "nil"
    	    end
            --print(sum)
            if sum == re_sum then
    	        result = "True"
            else
    	        result = "False"
    	    end
            print (line2t[1]..","..tostring(result))
         end
    end
end

--[[ function button_down()
	print(addnum(5,2)) --practice.lua
	print(readtxt("data.txt"))  --practice.lua
	print(_FUNCS.addnum(5,2))  --functions.lua
	print(test_addnum({5,2}))  --test_functions.lua
end ]]
