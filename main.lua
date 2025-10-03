function love.load()
    circle = {}

    circle.x = 100
    circle.y = 100
    circle.radius = 25
    circle.speed = 200
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()

    angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x)

    cos = math.cos(angle)
    sin = math.sin(angle)

    circle.x = circle.x + circle.speed * cos * dt
    circle.y = circle.y + circle.speed * sin * dt
end

function love.draw()
    love.graphics.circle("line", circle.x, circle.y, circle.radius)
    love.graphics.line(circle.x, circle.y, mouse_x, mouse_y)
    love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
    love.graphics.line(mouse_x, mouse_y, mouse_x, circle.y)
end

function getDistance(x1, y1, x2, y2)
    local horizontal_distance = x1 - x2
    local vertical_distance = y1 - y2

    local a = horizontal_distance ^2
    local b = vertical_distance ^2
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