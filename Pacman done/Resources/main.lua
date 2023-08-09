require("conf")
require("sounds")
require("renderingModels")
require("Ghosts")

exitingLVL = 1
exitingFruit = 1
totalLIVES = 3
score = 0
upcomingLifeScore = INTERVALOFLIVE

function love.load()
   love.graphics.setDefaultFilter("nearest", "nearest")
   love.graphics.setFont(love.graphics.newFont("newFont.ttf", TILEWIDTH))
   math.randomseed(os.time())
   for name, val in pairs(sounds) do
	  val.source = love.audio.newSource("sounds/" .. name .. ".wav", "static")
	  val.source:setLooping(val.looping)
	  val.ended = true
   end
   spritesheet = love.graphics.newImage("spritesheet.png")
   for i=1, #images do
	  images[images[i][1]] = love.graphics.newQuad(images[i][2],
												   images[i][3],
												   images[i][4],
												   images[i][5],
												   spritesheet:getDimensions())
   end
   for name, animation in pairs(animations) do
	  for i=1, #animation.frames do
		 animations[name].frames[i] = love.graphics.newQuad(animation.frames[i][1],
															animation.frames[i][2],
															animation.frames[i][3],
															animation.frames[i][4],
															spritesheet:getDimensions())
	  end
   end
   lvlLoad(exitingLVL)
end

function love.update(dt)
   globaldt = dt
   if exitingLVL < 1 then
	  return
   end
   soundController()
   if spawnAnimationTimer < 5 then
	  spawnAnimationTimer = spawnAnimationTimer + dt
	  if spawnAnimationTimer > 4 then
		 player.state = "normal"
	  else
		 return
	  end
   end
   if player.state == "spawning" then
	  return
   elseif player.state == "dead" then
	  deathAnimationTimer = deathAnimationTimer + dt
	  if player.sprite.frame == #animations[player.sprite.animation].frames then
		 player.sprite.paused = true
	  end
	  if deathAnimationTimer > 4 then
		 totalLIVES = totalLIVES - 1
		 if totalLIVES <= 0 then
			exitingLVL = -1
			stopAllSounds()
		 else
			lvlLoad(exitingLVL)
		 end
	  end
	  return
   end
   if player.state == "energized" then
	  energizerTimer = energizerTimer + dt
	  if energizerTimer > ENERGIZERDURATION then
		 player.state = "normal"
		 blinks.state = "normal"
		 setanimation(blinks, "blinks-move-down")
		 pinkie.state = "normal"
		 setanimation(pinkie, "pinkie-move-down")
		 inkie.state = "normal"
		 setanimation(inkie, "inkie-move-down")
		 clyde.state = "normal"
		 setanimation(clyde, "clyde-move-down")
		 energizerTimer = 0
		 love.audio.stop(sounds["energizer"].source)
	  end
   end
   if amountofghostscatters < maximumspreadtimes then
	  ghostaicycletimer = ghostaicycletimer + dt
   end
   if ghostaicycle == "chase" and ghostaicycletimer > maxHuntDuration then
	  ghostaicycletimer = 0
	  ghostaicycle = "scatter"
   elseif ghostaicycle == "scatter" and ghostaicycletimer > spreadduration then
	  ghostaicycletimer = 0
	  ghostaicycle = "chase"
	  amountofghostscatters = amountofghostscatters + 1
   end
   for i=1, #fruits do
	  fruits[i].timer = fruits[i].timer + dt
	  if fruits[i].timer > 10 then
		 table.remove(fruits, i)
		 break
	  end
   end
   playerControl()
   ghostsController()   
   if not player.crossing then
	  if points[math.floor((player.y / TILEHEIGHT) + 0.5) + 1][math.floor((player.x / TILEWIDTH) + 0.5) + 1] == 1 then
		 points[math.floor((player.y / TILEHEIGHT) + 0.5) + 1][math.floor((player.x / TILEWIDTH) + 0.5) + 1] = 0
		 scoreUpdate(score + 10)
		 amountOfPointsGained = amountOfPointsGained + 1
		 soundPlayer("munch")
		 if amountOfPointsGained >= amountofpoints then
			if exitingLVL >= AMOUNTOFLEVELS then
			   exitingLVL = -2
			   stopAllSounds()
			   return
			else
			   lvlLoad(exitingLVL + 1)
			end
		 elseif amountOfPointsGained == FRUITAWARDPOINTSA or amountOfPointsGained == FRUITAWARDSPOINTSB then
			fruitAppear()
			exitingFruit = exitingFruit + 1
			if exitingFruit > #FRUITSCORES then
			   exitingFruit = 1
			end
		 end
	  end
	  for i=1, #Boosters do
		 if tilesCollisionCheck(player.x, player.y, (Boosters[i].x - 1) * TILEWIDTH, (Boosters[i].y - 1) * TILEHEIGHT) then
			scoreUpdate(score + 50)
			soundPlayer("energizer")
			player.state = "energized"
			amountOfGhostsEaten = 0
			energizerTimer = 0
			table.remove(Boosters, i)
			break
		 end
	  end
	  for i=1, #fruits do
		 if tilesCollisionCheck(player.x, player.y, (fruits[i].x - 1) * TILEWIDTH, (fruits[i].y - 1) * TILEHEIGHT) then
			soundPlayer("eat-fruit")
			for j=1, #FRUITSCORES do
			   if FRUITSCORES[j][1] == fruits[i].name then
				  scoreUpdate(score + FRUITSCORES[j][2])
				  break
			   end
			end
			table.remove(fruits, i)
			break
		 end
	  end
	  ghostCollisionCheck(blinks)
	  ghostCollisionCheck(inkie)
	  ghostCollisionCheck(pinkie)
	  ghostCollisionCheck(clyde)
   end   
end

function love.draw()
   if exitingLVL < 0 then
	  drawscorescreen()
   else
	  drawgame()
   end
end

function scoreUpdate(scoreNew)
   score = scoreNew
   if score > upcomingLifeScore and totalLIVES < 8 then
	  totalLIVES = totalLIVES + 1
	  upcomingLifeScore = upcomingLifeScore + INTERVALOFLIVE
   end
end

function barricadeCheck(x, y)
   if level[y] == nil then
	  return false
   end
   return level[y][x] == 1
end

function ghostWallCheck(x, y)
   return ghostwall.y == y and (ghostwall.x == x or ghostwall.x + 1 == x)
end

function tilesCollisionCheck(x1, y1, x2, y2)
   return not ((x1 > x2 + TILEWIDTH - 1) or (x1 + TILEWIDTH - 1 < x2) or (y1 > y2 + TILEHEIGHT - 1) or (y1 + TILEHEIGHT - 1 < y2))
end

function fruitAppear()
   for i=1, #fruitSpawnPoint do
	  local fruitsPlace = false
	  for j=1, #fruits do
		 if fruits[j].x == fruitSpawnPoint[i].x and fruits[j].y == fruitSpawnPoint[i].y then
			fruitsPlace = true
			break
		 end
	  end
	  if not fruitsPlace and not (player.destx == fruitSpawnPoint[i].x and player.desty == fruitSpawnPoint[i].y) then
		 if points[fruitSpawnPoint[i].y][fruitSpawnPoint[i].x] == 1 then
			amountofpointsseaten = amountofpointsseaten + 1
			points[fruitSpawnPoint[i].y][fruitSpawnPoint[i].x] = 0
		 end
		 fruits[#fruits + 1] = {
			name=FRUITSCORES[exitingFruit][1],
			x=fruitSpawnPoint[i].x,
			y=fruitSpawnPoint[i].y,
			timer=0
		 }
		 break
	  end
   end
end

function makeChatacter(character)
   character.startPlace = {
	  x = character.x,
	  y = character.y
   }
   character.destx = character.x
   character.desty = character.y
   character.x = (character.destx - 1) * TILEWIDTH
   character.y = (character.desty - 1) * TILEHEIGHT
   character.resting = true
   character.crossing = false
   character.state = "normal"
   character.sprite = {
	  timer = 0,
	  frame = 1,
	  paused = true,
	  animation = character.name .. "-move-right"
   }
end

function ghostCollisionCheck(ghost)
   if tilesCollisionCheck(ghost.x, ghost.y, player.x, player.y) and ghost.state ~= "dead" then
	  if player.state == "energized" then
		 ghost.state = "dead"
		 amountOfGhostsEaten = amountOfGhostsEaten + 1
		 scoreUpdate(score + GHOSTSCORES[amountOfGhostsEaten])
		 soundPlayer("eat-ghost")
		 soundPlayer("retreating")
	  else
		 blinks.sprite.paused = true
		 pinkie.sprite.paused = true
		 inkie.sprite.paused = true
		 clyde.sprite.paused = true
		 player.state = "dead"
		 setanimation(player, "pacman-death")
		 soundPlayer("death")
	  end
   end
end

function lvlLoad(lvlToLoad)
   if exitingLVL == lvlToLoad then
	  package.loaded[tostring(lvlToLoad)] = nil
   end
   require(tostring(lvlToLoad))
   spawnAnimationTimer = 0
   deathAnimationTimer = 0
   energizerTimer = 0
   amountOfPointsGained = 0
   amountOfGhostsEaten = 0
   exitingLVL = lvlToLoad
   amountofpoints = 0
   for y=1, LVLHEIGHT do
	  for x=1, LVLWIDTH do
		 if points[y][x] == 1 then
			amountofpoints = amountofpoints + 1
		 end
	  end
   end
   ghostaicycle = "chase"
   ghostaicycletimer = 0
   ghostRandomTargets = {}   
   amountofghostscatters = 0
   -- Create game objects
   for i=1, #Boosters do
	  Boosters[i].sprite = {}
	  setanimation(Boosters[i], "energizer-oscillate")
   end
   fruits = {}
   makeChatacter(player)
   makeChatacter(blinks)
   makeChatacter(pinkie)
   makeChatacter(inkie)
   makeChatacter(clyde)
   blinks.speed = blinksSpeed
   pinkie.speed = pinkieSpeed
   inkie.speed = inkieSpeed
   clyde.speed = clydeSpeed
   player.sprite.animation = "pacman-ball"
   player.state = "spawning"
   renderbackground()
   generategraphOfPath()
   calculatedpaths = {}
   stopAllSounds()
   soundPlayer("game-start")
end

function playerControl()
   if player.resting then
	  if love.keyboard.isDown("right") then
		 setanimation(player, "pacman-move-right")
		 if not barricadeCheck(player.destx + 1, player.desty) and not ghostWallCheck(player.destx + 1, player.desty) then
			player.destx = player.destx + 1
			player.resting = false
		 end
	  elseif love.keyboard.isDown("left") then
		 setanimation(player, "pacman-move-left")
		 if not barricadeCheck(player.destx - 1, player.desty) and not ghostWallCheck(player.destx - 1, player.desty) then
			player.destx = player.destx - 1 
			player.resting = false
		 end
	  elseif love.keyboard.isDown("up") then
		 setanimation(player, "pacman-move-up")		 
		 if not barricadeCheck(player.destx, player.desty - 1) and not ghostWallCheck(player.destx, player.desty - 1) then
			player.desty = player.desty - 1
			player.resting = false
		 end
	  elseif love.keyboard.isDown("down") then
		 setanimation(player, "pacman-move-down")
		 if not barricadeCheck(player.destx, player.desty + 1) and not ghostWallCheck(player.destx, player.desty + 1) then
			player.desty = player.desty + 1
			player.resting = false
		 end
	  elseif player.resting then
		 player.sprite.paused = true
	  end
   end
   if not player.resting then
	  if (player.destx - 1) * TILEWIDTH > player.x then
		 player.x = player.x + (globaldt * playerSpeed)
		 if player.x > (player.destx - 1) * TILEWIDTH then
			player.x = (player.destx - 1) * TILEWIDTH
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.destx - 1) * TILEWIDTH < player.x then
		 player.x = player.x - (globaldt * playerSpeed)
		 if player.x < (player.destx - 1) * TILEWIDTH then
			player.x = (player.destx - 1) * TILEWIDTH
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.desty - 1) * TILEHEIGHT > player.y then
		 player.y = player.y + (globaldt * playerSpeed)
		 if player.y > (player.desty - 1) * TILEHEIGHT then
			player.y = (player.desty - 1) * TILEHEIGHT
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.desty - 1) * TILEHEIGHT < player.y then
		 player.y = player.y - (globaldt * playerSpeed)
		 if player.y < (player.desty - 1) * TILEHEIGHT then
			player.y = (player.desty - 1) * TILEHEIGHT
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end		 
	  end
   end
   if not player.crossing then
	  if player.x < 0 then
		 player.destx = LVLWIDTH
		 player.x = (TILEWIDTH * LVLWIDTH) + TILEWIDTH
		 player.crossing = true
		 player.resting = false
	  elseif player.x > (TILEWIDTH * LVLWIDTH) - TILEWIDTH then
		 player.destx = 1
		 player.x = -TILEWIDTH
		 player.crossing = true
		 player.resting = false
	  elseif player.y < 0 then
		 player.desty = LVLHEIGHT
		 player.y = (TILEHEIGHT * LVLHEIGHT) + TILEHEIGHT
		 player.crossing = true
		 player.resting = false
	  elseif player.y > (TILEHEIGHT * LVLHEIGHT) - TILEHEIGHT then
		 player.desty = 1
		 player.y = -TILEHEIGHT
		 player.crossing = true
		 player.resting = false		 
	  end
   end
end


