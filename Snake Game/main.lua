
local TILE_SIZE = 20
local GRID_WIDTH = 30
local GRID_HEIGHT = 20
local WINDOW_WIDTH = TILE_SIZE * GRID_WIDTH
local WINDOW_HEIGHT = TILE_SIZE * GRID_HEIGHT

local snake = {}
local food = {}
local direction = "right"
local gameState = "start"  -- start, play, gameover
local updateTimer = 0
local updateDelay = 0.1

function love.load()
    love.window.setTitle("Snake Game")
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    love.graphics.setBackgroundColor(0, 0, 0)
    love.keyboard.setKeyRepeat(true)

    local start_x = math.floor(GRID_WIDTH / 2)
    local start_y = math.floor(GRID_HEIGHT / 2)
    table.insert(snake, { x = start_x, y = start_y })

    spawnFood()
end

function love.update(dt)
    if gameState == "play" then
        updateTimer = updateTimer + dt
        if updateTimer >= updateDelay then
            updateTimer = updateTimer - updateDelay

            -- Move the snake
            local head = snake[1]
            local new_head = { x = head.x, y = head.y }

            if direction == "up" then
                new_head.y = new_head.y - 1
            elseif direction == "down" then
                new_head.y = new_head.y + 1
            elseif direction == "left" then
                new_head.x = new_head.x - 1
            elseif direction == "right" then
                new_head.x = new_head.x + 1
            end

            table.insert(snake, 1, new_head)

            if new_head.x == food.x and new_head.y == food.y then
                spawnFood()
            else
                table.remove(snake)
            end

            if new_head.x < 1 or new_head.x > GRID_WIDTH or
               new_head.y < 1 or new_head.y > GRID_HEIGHT or
               checkSelfCollision(new_head) then
                gameState = "gameover"
            end
        end
    end
end

function love.draw()
    if gameState == "start" then
        drawStartScreen()
    elseif gameState == "play" then
        drawGame()
    elseif gameState == "gameover" then
        drawGameOverScreen()
    end
end

function love.keypressed(key)
    if gameState == "start" then
        gameState = "play"
    elseif gameState == "play" then
        if key == "up" and direction ~= "down" then
            direction = "up"
        elseif key == "down" and direction ~= "up" then
            direction = "down"
        elseif key == "left" and direction ~= "right" then
            direction = "left"
        elseif key == "right" and direction ~= "left" then
            direction = "right"
        end
    elseif gameState == "gameover" then
        if key == "return" then
            resetGame()
            gameState = "start"
        end
    end
end

function drawStartScreen()
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf("Press any key to start", 0, WINDOW_HEIGHT / 2 - 10, WINDOW_WIDTH, "center")
end

function drawGame()
    love.graphics.setColor(0, 255, 0)
    for _, segment in ipairs(snake) do
        love.graphics.rectangle("fill", (segment.x - 1) * TILE_SIZE, (segment.y - 1) * TILE_SIZE, TILE_SIZE, TILE_SIZE)
    end

    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", (food.x - 1) * TILE_SIZE, (food.y - 1) * TILE_SIZE, TILE_SIZE, TILE_SIZE)
end

function drawGameOverScreen()
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf("Game Over\nPress Enter to restart", 0, WINDOW_HEIGHT / 2 - 20, WINDOW_WIDTH, "center")
end

function spawnFood()
    local availablePositions = {}
    for x = 1, GRID_WIDTH do
        for y = 1, GRID_HEIGHT do
            local occupied = false
            for _, segment in ipairs(snake) do
                if segment.x == x and segment.y == y then
                    occupied = true
                    break
                end
            end
            if not occupied then
                table.insert(availablePositions, { x = x, y = y })
            end
        end
    end

    local randomIndex = love.math.random(1, #availablePositions)
    food = availablePositions[randomIndex]
end

function checkSelfCollision(new_head)
    for i = 2, #snake do
        if snake[i].x == new_head.x and snake[i].y == new_head.y then
            return true
        end
    end
    return false
end

function resetGame()
    snake = {}
    direction = "right"

    local start_x = math.floor(GRID_WIDTH / 2)
    local start_y = math.floor(GRID_HEIGHT / 2)
    table.insert(snake, { x = start_x, y = start_y })

    spawnFood()
end
