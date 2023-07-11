SettingsState = Class{__includes = BaseState}

function SettingsState:render()
	love.graphics.printf(
		'currently in settings state, press enter to exit',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
	
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	end
end

