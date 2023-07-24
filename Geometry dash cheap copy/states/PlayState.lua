PlayState = Class{__includes = BaseState}

function PlayState:init()
    ball = {}
    gravity = 700
    jumpForce = -450
    isJumping = false
    rotation = 0
    ballImage = love.graphics.newImage("Resources/ball.png")
    
    platform = {}
    platform.x = 0
    platform.y = VIRTUAL_HEIGHT - 50
    platform.width = VIRTUAL_WIDTH
    platform.height = 20
    platformSpeed = 100

    platformImage = love.graphics.newImage("Resources/platform.png")
    
    spikes = {}
    spikeImage = love.graphics.newImage("Resources/spike.png")
    spikeInterval = 3
    spikeTimer = 0
    spikeTimes = 0
    ball.x = 100
    ball.y = 300
    ball.speedY = 0
    ball.radius = 20
    ball.speedX = 0 
    backgroundImage = love.graphics.newImage("Resources/background.png")
end

function PlayState:update(dt)
    if love.keyboard.isDown("up") and not isJumping then
        ball.speedY = jumpForce
        isJumping = true
        rotation = 0
    end

    ball.speedY = ball.speedY + gravity * dt
    ball.y = ball.y + ball.speedY * dt

    if ball.y + ball.radius >= VIRTUAL_HEIGHT then
        ball.y = VIRTUAL_HEIGHT - ball.radius
        ball.speedY = 0
        isJumping = false
        rotation = 0
    end

    if isJumping then
        rotation = rotation + 180 * dt
        if rotation >= 180 then
            rotation = 180
        end
    end

    platform.x = platform.x - ball.speedX * dt

    if platform.x + platform.width <= 0 then
        platform.x = VIRTUAL_WIDTH
    elseif platform.x >= VIRTUAL_WIDTH then
        platform.x = -platform.width
    end

    spikeTimer = spikeTimer + dt
    if spikeTimer >= spikeInterval then
        local spikeY = platform.y - spikeImage:getHeight()
        table.insert(spikes, {x = VIRTUAL_WIDTH, y = spikeY})
        spikeTimes = spikeTimes + 1
        spikeTimer = 0
        spikeInterval = spikeInterval - 0.1
        spikeInterval = math.max(0.5, spikeInterval)
    end

    for i = #spikes, 1, -1 do
        spikes[i].x = spikes[i].x - platformSpeed * dt
        if spikes[i].x + spikeImage:getWidth() < 0 then
            table.remove(spikes, i)
        end
    end

    if ball.y + ball.radius >= platform.y and ball.y - ball.radius <= platform.y + platform.height
    and ball.x + ball.radius >= platform.x and ball.x - ball.radius <= platform.x + platform.width then
        ball.y = platform.y - ball.radius
        ball.speedY = 0
        isJumping = false
        rotation = 0
    end

    for i = 1, #spikes do
        local spike = spikes[i]
        if ball.y - ball.radius <= spike.y + spikeImage:getHeight() and ball.y + ball.radius >= spike.y
        and ball.x + ball.radius >= spike.x and ball.x - ball.radius <= spike.x + spikeImage:getWidth() then
            stateMachine:change('death')
         
        end
    end
end

function PlayState:render()
    push:start()
    love.graphics.draw(backgroundImage, 0, 0) 
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(ballImage, ball.x, ball.y, math.rad(rotation), 1, 1, ball.radius, ball.radius)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(platformImage, platform.x, platform.y)

    for i = 1, #spikes do
        local spike = spikes[i]
        love.graphics.draw(spikeImage, spike.x, spike.y)
    end

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Spikes Passed: " .. spikeTimes, 10, 10)


    push:finish()
end

return PlayState
