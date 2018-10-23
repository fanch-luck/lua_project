test_start_limits = 11
function button_down()
	print(addnum(5,2)) --practice.lua
	print(readtxt("data.txt"))  --practice.lua
	print(_FUNCS.addnum(5,2))  --functions.lua
	print(test_addnum({5,2}))  --test_functions.lua
end