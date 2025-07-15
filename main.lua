name = "Jerry"
age = "28"
text = "Hello, my name is " .. name .. ", and I'm "..age.." years old."
print(text)

if arg[2] == "debug" then
    require("lldebugger").start()
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else 
        return love_errorhandler(msg)
    end
end