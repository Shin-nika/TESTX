GHOSTSCORES = {
   200,
   400,
   800,
   1600
}
LVLWIDTH = 22
LVLHEIGHT = 22
TILEWIDTH = 16
TILEHEIGHT = 16

AMOUNTOFLEVELS = 3
ENERGIZERDURATION = 10
INTERVALOFLIVE = 10000
DEADSPEED = 100
TOPMARGIN = TILEWIDTH * 2



WINDOWSWIDTH = LVLWIDTH * TILEWIDTH * 2
WINDOWSHEIGHT = (LVLHEIGHT + 3) * TILEHEIGHT * 2


FRUITSCORES = {
   {"cherry", 100},
   {"strawberry", 300},
   {"peach", 500},
   {"apple", 700},
   {"grapes", 1000},
   {"galaxian", 2000},
   {"bell", 3000},
   {"key", 5000}
}






function love.conf(t)
   t.modules.audio = true
   t.modules.data = true
   t.modules.event = true
   t.modules.font = true
   t.modules.graphics = true
   t.modules.image = true
   t.modules.joystick = false
   t.modules.keyboard = true
   t.modules.math = true
   t.modules.mouse = false
   t.modules.physics = false

   t.modules.sound = true
   t.modules.system = true
   t.modules.thread = true
   t.modules.timer = true
   t.modules.touch = false
   t.modules.video = false
   t.modules.window = true
   t.identity = nil


   t.appendidentity = false
   t.version = "11.0"
   t.console = false
   t.accelerometerjoystick = false
   t.externalstorage = false
   t.gammacorrect = false

   t.audio.mixwithsystem = true
   
   t.window.title = "Pac-Man"         
   t.window.icon = nil                 
   t.window.width = WINDOWSWIDTH
   t.window.height = WINDOWSHEIGHT
   t.window.borderless = false         
   t.window.resizable = false          
   t.window.minwidth = WINDOWSWIDTH
   t.window.minheight = WINDOWSHEIGHT
   t.window.fullscreen = false

   t.window.fullscreentype = "desktop"
   t.window.vsync = 1
   t.window.msaa = 0
   t.window.depth = nil
   t.window.stencil = nil
   t.window.display = 1
   t.window.highdpi = false
   t.window.x = nil
   t.window.y = nil
   

end
