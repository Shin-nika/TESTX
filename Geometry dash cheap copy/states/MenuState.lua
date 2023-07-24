MenuState = Class{__includes = BaseState}
MenuBackgroundImage = love.graphics.newImage("Resources/menuImage.png")
function MenuState:render()
    love.graphics.draw(MenuBackgroundImage, 0, 0)
	
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	end
end
