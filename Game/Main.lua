local gameStarted = false

local player1 = {
    x = 100,
    y = 100,
    speed = 200,
    width = 50,
    height = 50
}

local player2 = {
    x = 500,
    y = 100,
    speed = 200,
    width = 50,
    height = 50
}
local Golden = {255, 215, 0}


local windowWidth = 800
local windowHeight = 600

function love.load()
    love.window.setTitle("Two Player Game")
    love.window.setMode(windowWidth, windowHeight, { resizable = false })
    love.graphics.setBackgroundColor(Golden)
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(love.graphics.newFont(24))
    
    if not gameStarted then
        love.graphics.print("Welcome to my game", 300, 250)
    else
        love.graphics.rectangle("fill", player1.x, player1.y, player1.width, player1.height)
        
        love.graphics.rectangle("fill", player2.x, player2.y, player2.width, player2.height)
    end
end

function love.update(dt)
    if not gameStarted then
        if love.keyboard.isDown("return") then
            gameStarted = true
        end
    else
        if love.keyboard.isDown("w") and player1.y > 0 then
            player1.y = player1.y - player1.speed * dt
        elseif love.keyboard.isDown("s") and player1.y < windowHeight - player1.height then
            player1.y = player1.y + player1.speed * dt
        elseif love.keyboard.isDown("a") and player1.x > 0 then
            player1.x = player1.x - player1.speed * dt
        elseif love.keyboard.isDown("d") and player1.x < windowWidth - player1.width then
            player1.x = player1.x + player1.speed * dt
        end

        if love.keyboard.isDown("up") and player2.y > 0 then
            player2.y = player2.y - player2.speed * dt
        elseif love.keyboard.isDown("down") and player2.y < windowHeight - player2.height then
            player2.y = player2.y + player2.speed * dt
        elseif love.keyboard.isDown("left") and player2.x > 0 then
            player2.x = player2.x - player2.speed * dt
        elseif love.keyboard.isDown("right") and player2.x < windowWidth - player2.width then
            player2.x = player2.x + player2.speed * dt
        end
    end
end
