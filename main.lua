function love.load()
    song = love.audio.newSource("song.ogg", "stream")
    song:setLooping(true)
    song:play()

    sfx = love.audio.newSource("sfx.ogg", "static")

    image = love.graphics.newImage("tileset2.png")

    local image_width = image:getWidth()
    local image_height = image:getHeight()


    width = 32
    height = 32

    quads = {}

    for i=0,1 do
        for j=0,3 do
            table.insert(quads, love.graphics.newQuad(1 + j * (width + 2), 1 + i * (height + 2), width, height, image_width, image_height))
        end
    end


    tilemap = {
        {1, 7, 7, 2, 1, 7, 7, 2, 7, 7, 2},
        {3, 0, 0, 5, 6, 0, 0, 3, 0, 0, 3},
        {3, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3}, 
        {5, 2, 0, 0, 0, 0, 1, 6, 0, 0, 3}, 
        {1, 6, 0, 0, 0, 0, 5, 2, 0, 0, 3},
        {3, 0, 0, 0, 0, 0, 0, 3, 0, 0, 3},
        {3, 0, 0, 1, 2, 0, 4, 3, 0, 0, 3},
        {5, 7, 7, 6, 5, 7, 7, 6, 7, 7, 6}
    }

    player = {
        image = love.graphics.newImage("player.png"),
        tile_x = 2,
        tile_y = 2
    }

    key = love.graphics.newImage("key.png")
end

function love.update(dt)
 
end

function love.draw()
    for i,row in ipairs(tilemap) do
        for j,tile in ipairs(row) do
            if tile ~= 0 then
                love.graphics.draw(image, quads[tile], j * width, i * height)
            end
        end
    end

    love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height)

    -- love.graphics.draw(key, 7 * width, 7 *height)
end

function love.keypressed(key)
    local x = player.tile_x
    local y = player.tile_y

    if key == "left" then
        x = x - 1
    elseif key == "right" then
        x = x + 1
    elseif key == "up" then
        y = y - 1
    elseif key == "down" then
        y = y + 1
    elseif key == "space" then
        sfx:play()
    end
    
    if isEmpty(x, y) or tilemap[y][x] == 4 then
        player.tile_x = x
        player.tile_y = y 
    end

    if gotKey(x, y) then
        tilemap[y][x] = 0
        tilemap[3][8] = 0
    end
end

function isEmpty(x, y)
    return tilemap[y][x] == 0
end

function gotKey(x, y)
    return  tilemap[y][x] == 4
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