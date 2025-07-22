function love.load()
    x = 100
    y = 50
    move = true
end

function love.draw()
    love.graphics.rectangle("line", x, y, 200, 150)
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        print("moving right!")
        x = x + 100 * dt
    elseif love.keyboard.isDown("left") then
        print("moving left!")
        x = x - 100 * dt
    elseif love.keyboard.isDown("up") then
        print("moving up!")
        y = y - 100 * dt
    elseif love.keyboard.isDown("down") then
        print("moving down!")
        y = y + 100 * dt
    end
end

if 5 < 9 and 14 > 7 then
    print("Both statements are true")
end

if 20 < 9 or 14 > 7 or 5 == 10 then
    print("One of these staements is true")
end

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