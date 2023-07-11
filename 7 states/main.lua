push = require 'push'
Class = require 'class'

require 'StateMachine'

require 'BaseState'
require 'StartState'
require 'PlayState'
require 'PauseState'
require 'SettingsState'
require 'EditorState'
require 'ProstaState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('State Machine')
	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})
	
	stateMachine =  StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end,
		['settings'] = function() return SettingsState() end,
		['pause'] = function() return PauseState() end,
		['editor'] = function() return EditorState() end,
		['prostastate'] = function() return ProstaState() end
	}
	
	stateMachine:change('start')
	
	font = love.graphics.newFont('font.ttf', 16)
	love.graphics.setFont(font)
end

function love.resize(width, height)
	push:resize(width, height)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	stateMachine:update(dt)
end

function love.draw()
	push:start()
	
	stateMachine:render()
	
	push:finish()
end
