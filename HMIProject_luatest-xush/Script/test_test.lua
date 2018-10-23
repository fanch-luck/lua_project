
test_test_limits = 11
function print2(...)
    local result = ""
    for i, v in ipairs{...} do
        result = result..tostring(v).."\t"
    end
    result = result.."\n"
    print(result)
end

function addnum(input1, input2)
    return tonumber(input1) + tonumber(input2)
end

function readtxt(filepath)
	local f = assert(io.open(filepath, 'r'))
	local content = f:read("*all")
	f:close()
	return content
end

function writetxt(filepath, content)
	local f = assert(io.open(filepath, 'w'))
	f:write(content)
	f:close()
	return true
end

function writetxts(filepath, ...)
    local f = assert(io.open(filepath, 'a'))
    for i, v in ipairs{...} do
        print(v)
        f:write(v.."\n")
    end
	f:close()
end
--writetxts("results.txt","\n开始")
--writetxts("results.txt","123",'456',"你我他","Hello, world!")