PlayState = Class{__includes = BaseState}
tileSize = 20
tileCountX = love.graphics.getWidth() / tileSize
tileCountY = love.graphics.getHeight() / tileSize
snake = {}
snake.head = {x = 1, y = 1}
snake.body = {}
snake.direction = {x = 1, y = 0}
    
food = {x = 10, y = 10}
    
timer = 0
speed = 0.1


function PlayState:update(dt)
    timer = timer + dt
    
    if timer >= speed then
        timer = timer - speed
        
        local nextX = snake.head.x + snake.direction.x
        local nextY = snake.head.y + snake.direction.y
        
        if nextX < 1 or nextX > tileCountX or nextY < 1 or nextY > tileCountY then
            PlayState:resetGame()
            stateMachine:change('death') -- aq unda gadavides bolo stateshi
        end
        
        for _, segment in ipairs(snake.body) do
            if nextX == segment.x and nextY == segment.y then
                PlayState:resetGame()
                stateMachine:change('death') -- aq unda gadavides bolo stateshi
            end
        end
        
        if nextX == food.x and nextY == food.y then
            table.insert(snake.body, {x = snake.head.x, y = snake.head.y})
            
            food.x = love.math.random(tileCountX)
            food.y = love.math.random(tileCountY)
            
            speed = speed - 0.01
        else
            if #snake.body > 0 then
                for i = #snake.body, 2, -1 do
                    snake.body[i].x = snake.body[i - 1].x
                    snake.body[i].y = snake.body[i - 1].y
                end
                snake.body[1].x = snake.head.x
                snake.body[1].y = snake.head.y
            end
        end
        
        snake.head.x = nextX
        snake.head.y = nextY
    end
    if love.keyboard.isDown('w') and snake.direction.y ~= 1 then
        snake.direction = {x = 0, y = -1}
    elseif love.keyboard.isDown('a') and snake.direction.x ~= 1 then
        snake.direction = {x = -1, y = 0}
    elseif love.keyboard.isDown('s') and snake.direction.y ~= -1 then
        snake.direction = {x = 0, y = 1}
    elseif love.keyboard.isDown('d') and snake.direction.x ~= -1 then
        snake.direction = {x = 1, y = 0}
    end
end

function PlayState:resetGame()
    snake.body = {}
    snake.head.x = 1
    snake.head.y = 1
    snake.direction = {x = 1, y = 0}
    food.x = love.math.random(tileCountX)
    food.y = love.math.random(tileCountY)
    speed = 0.1
    

    snake.direction.x = -snake.direction.x

    snake.direction.y = -snake.direction.y

    
    food.x = love.math.random(tileCountX)
    food.y = love.math.random(tileCountY)
    
    timer = 0
    speed = 0.1
end

function PlayState:render()
    love.graphics.setColor(0, 1, 0) -- Green color
    love.graphics.rectangle("fill", (snake.head.x - 1) * tileSize, (snake.head.y - 1) * tileSize, tileSize, tileSize)
    for _, segment in ipairs(snake.body) do
        love.graphics.rectangle("fill", (segment.x - 1) * tileSize, (segment.y - 1) * tileSize, tileSize, tileSize)
    end
    
    love.graphics.setColor(1, 0, 0) -- Red color
    love.graphics.rectangle("fill", (food.x - 1) * tileSize, (food.y - 1) * tileSize, tileSize, tileSize)
end
