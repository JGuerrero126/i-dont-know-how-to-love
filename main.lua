local r1, r2

function love.load()
 local Rectangle = require "rectangle"
 local Circle = require "circle"

 r1 = Rectangle(100, 100, 200, 50)
 r2 = Circle(350, 80, 40)
end

function love.update(dt)
    r1:update(dt)
    r2:update(dt)
end

function love.draw()
    r1:draw()
    r2:draw()
end

function love.keypressed(key)
    if key == "space" then
        x = math.random(100, 500)
        y = math.random(100, 500)
    end
    
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