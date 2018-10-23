practice_limits = 11

function addnum(input1, input2)
    return tonumber(input1) + tonumber(input2)
end

function readtxt(filepath)
	local f = assert(io.open(filepath, 'r'))
	local content = f:read("*all")
	f:close()
	return content
end