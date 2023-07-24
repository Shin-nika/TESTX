DeathState = Class{__includes = BaseState}

DeathStateImage = love.graphics.newImage("Resources/DeathImage.png")
function DeathState:render()
    love.graphics.draw(DeathStateImage, 0, 0)
	
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	end
end
