ProstaState = Class{__includes = BaseState}

function ProstaState:render()
	love.graphics.printf(
		'currently in prosta state, press esc to leave the game',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
end

