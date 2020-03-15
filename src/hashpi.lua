local pi = "31415926535897932384626433"

-- hashpi: Makes a hash based on digits of pi
function hashpi(line)
	local converted_string = ""

	for i=1,string.len(line) do
		local case = -1 -- Store the case of the char, -1 = unset, 0 = lower, 1 = upper
		local char = string.sub(line, i, i)
		local charcode = string.byte(char)
		local converted_charcode = 0

		-- Find if char is upper/lower, convert to a number 1-26
		if (charcode >= 65 and charcode <= 90) then
			charcode = charcode - 64
			case = 1
		elseif (charcode >= 97 and charcode <= 122) then
			charcode = charcode - 96
			case = 0
		end

		if (case ~= -1) then
			-- If the character is over 26, loop it back to the start of the alphabet
			if ((charcode + tonumber(string.sub(pi, charcode, charcode))) > 26) then
				charcode = charcode + tonumber(string.sub(pi, charcode, charcode)) - 26
			else
				charcode = charcode + tonumber(string.sub(pi, charcode, charcode))
			end

			-- Add back the case after converting
			if (case == 0) then
				converted_charcode = charcode + 96
			elseif (case == 1) then
				converted_charcode = charcode + 64
			end

			-- Update char, then add it to string
			char = string.char(converted_charcode)
		end
		converted_string = converted_string .. char
	end
	return converted_string
end

-- Check parameters and print result
if (arg[1] == nil) then
	print("Usage: hashpi.lua <password> <iterations>")
else
	local hashed = hashpi(arg[1])
	-- Do number of iterations from command
	if (arg[2] ~= nil) then
		for i=1,tonumber(arg[2]) do
			hashed = hashpi(hashed)
		end
	end

	-- Trim off anything over 16 characters
	if (string.len(hashed) > 16) then
		hashed = string.sub(hashed, 1, 16)
	end

	-- If it's less than 16, add some random junk to the end
	if (string.len(hashed) < 16) then
		math.randomseed(os.time())
		for i=1,(16 - string.len(hashed)) do
			hashed = hashed .. string.char(math.random(26) + 96)
		end
	end
	
	-- Print the hash
	print("Your (super insecure) hash is: " .. string.lower(hashed))
end

