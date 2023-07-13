push = require "push"
Class = require 'class'

require 'StateMachine'

require 'states/BaseState'
require 'states/MenuState'
require 'states/PlayState'
require 'states/DeathState'

local WINDOW_WIDTH = 800
local WINDOW_HEIGHT = 600
local VIRTUAL_WIDTH = 800
local VIRTUAL_HEIGHT = 600


function love.load()
    love.window.setTitle("Snake Game")
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