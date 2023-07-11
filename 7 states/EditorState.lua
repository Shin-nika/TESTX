EditorState = Class{__includes = BaseState}

function EditorState:render()
	love.graphics.printf(
		'currently in editor state, press I to return in main menu',
		0,
		VIRTUAL_HEIGHT / 2 - 16,
		VIRTUAL_WIDTH,
		'center')
	
	if love.keyboard.isDown('i') then
		stateMachine:change('start')
	end
end