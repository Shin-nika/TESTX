PlayState = Class{__includes = BaseState}

function PlayState:render()
	love.graphics.printf(
		'currently in play state, Q = pause state, 0 = settings, 9 = mystery state',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
		if love.keyboard.isDown('q') then
			stateMachine:change('pause')
		end
		if love.keyboard.isDown('0') then
			stateMachine:change('settings')
		end
		if love.keyboard.isDown('9') then
			stateMachine:change('prostastate')
		end
end

