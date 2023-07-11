PauseState = Class{__includes = BaseState}

function PauseState:render()
	love.graphics.printf(
		'currently in pause state, press enter to continue game',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
        if love.keyboard.isDown('return') then
            stateMachine:change('play')
        end
end
