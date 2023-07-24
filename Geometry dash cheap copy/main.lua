-- main.lua

Class = require 'class'
push = require 'push'

require 'StateMachine'

require 'states/BaseState'
require 'states/MenuState'
require 'states/PlayState'
require 'states/DeathState'

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

VIRTUAL_WIDTH = 800
VIRTUAL_HEIGHT = 600

function love.load()
    love.window.setTitle("Geometry dash cheap copy")
    background = love.graphics.newImage("Resources/background.png")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    stateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
        ['play'] = function() return PlayState() end,
        ['death'] = function() return DeathState() end
    }

    stateMachine:change('menu')
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
    
