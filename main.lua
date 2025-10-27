function love.load()
   tilemap = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
    {1, 2, 3, 4, 5, 5, 4, 3, 2, 1}, 
    {1, 2, 2, 2, 2, 2, 2, 2, 2, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    }

    colors = {
        {1, 1, 1},
        {1, 0, 0},
        {1, 0, 1},
        {0, 0, 1},
        {0, 1, 1}
    }
end

function love.update(dt)
 
end

function love.draw()
    for i,row in ipairs(tilemap) do
        for j,tile in ipairs(row) do
            if tile ~= 0 then
                love.graphics.setColor(colors[tile])
                love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
            end
        end
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