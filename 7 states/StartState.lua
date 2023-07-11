StartState = Class{__includes = BaseState}

function StartState:render()
	love.graphics.printf(
		'currently in start state, press enter to start game, press P to edit',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
	
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	end
	if love.keyboard.isDown('p') then
		stateMachine:change('editor')
	end
end

