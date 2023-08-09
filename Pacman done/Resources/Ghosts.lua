function generategraphOfPath()
	pathGraph = {}
	for y=1, LVLHEIGHT do
	   pathGraph[y] = {}
	end
	local getfirst = function ()
	   for x=1, LVLWIDTH do
		  for y=1, LVLHEIGHT do
			 if nodeCheck(x,y) then
				return x, y
			 end
		  end
	   end
	end
	local firstx, firsty = getfirst()
	pathGraph[firsty][firstx] = {}
	nodeMaker(firstx, firsty)
 end
 
 

function nodeCheck(x, y)   
   local horizontalBoundary = false
   local verticalBoundary = false
   local endTimes = 0
   if level[y][x] == 0 then
	  if x > 1 then
		 if level[y][x-1] == 0 then
			horizontalBoundary = true
			endTimes = endTimes + 1
		 end
	  else
		 endTimes = 2
	  end
	  if x < LVLWIDTH then
		 if level[y][x+1] == 0 then
			horizontalBoundary = true
			endTimes = endTimes + 1
		 end
	  else
		 endTimes = 2
	  end
	  if y > 1 then
		 if level[y-1][x] == 0 then
			verticalBoundary = true
			endTimes = endTimes + 1
		 end
	  else
		 endTimes = 3
	  end
	  if y < LVLHEIGHT then
		 if level[y+1][x] == 0 then
			verticalBoundary = true
			endTimes = endTimes + 1
		 end
	  else
		 endTimes = 4
	  end
	  if horizontalBoundary and verticalBoundary then
		 return true
	  end
   end
   return endTimes == 1
end

function edgeMaker(x, y, direction)
   local edgelength = 0
   local startx = x
   local starty = y
   if direction == 1 then
	  repeat
		 y = y - 1		 
		 edgelength = edgelength + 1
		 if y < 1 then
			y = LVLHEIGHT
		 end
	  until nodeCheck(x, y)
	  pathGraph[starty][startx][1] = edgelength
	  if pathGraph[y][x] == nil then
		 pathGraph[y][x] = {}
		 pathGraph[y][x][3] = edgelength
		 nodeMaker(x, y)
	  else
		 pathGraph[y][x][3] = edgelength
	  end
   elseif direction == 2 then
	  repeat
		 x = x + 1		 
		 edgelength = edgelength + 1
		 if x > LVLWIDTH then
			x = 1
		 end
	  until nodeCheck(x, y)
	  pathGraph[starty][startx][2] = edgelength
	  if pathGraph[y][x] == nil then
		 pathGraph[y][x] = {}
		 pathGraph[y][x][4] = edgelength
		 nodeMaker(x, y)
	  else
		 pathGraph[y][x][4] = edgelength
	  end
   elseif direction == 3 then
	  repeat
		 y = y + 1
		 edgelength = edgelength + 1
		 if y > LVLHEIGHT then
			y = 1
		 end
	  until nodeCheck(x, y)
	  pathGraph[starty][startx][3] = edgelength
	  if pathGraph[y][x] == nil then
		 pathGraph[y][x] = {}
		 pathGraph[y][x][1] = edgelength
		 nodeMaker(x, y)
	  else
		 pathGraph[y][x][1] = edgelength
	  end
   elseif direction == 4 then
	  repeat
		 x = x - 1
		 edgelength = edgelength + 1
		 if x < 1 then
			x = LVLWIDTH
		 end
	  until nodeCheck(x, y)
	  pathGraph[starty][startx][4] = edgelength
	  if pathGraph[y][x] == nil then
		 pathGraph[y][x] = {}
		 pathGraph[y][x][2] = edgelength
		 nodeMaker(x, y)
	  else
		 pathGraph[y][x][2] = edgelength
	  end	  
   end
end

function nodeMaker(x, y)
   if y > 1 and level[y - 1][x] == 0 and pathGraph[y][x][1] == nil then
	  edgeMaker(x, y, 1)
   end
   if x < LVLWIDTH and level[y][x + 1] == 0 and pathGraph[y][x][2] == nil then
	  edgeMaker(x, y, 2)
   end
   if y < LVLHEIGHT and level[y + 1][x] == 0 and pathGraph[y][x][3] == nil then
	  edgeMaker(x, y, 3)
   end
   if x > 1 and level[y][x - 1] == 0 and pathGraph[y][x][4] == nil then
	  edgeMaker(x, y, 4)
   end
end

function createTemporaryNode(x, y)
   local topY = y - 1
   local topDist = 1
   local alignVertical = true
   while true do
	  if topY < 1 then
		 topY = LVLHEIGHT
	  end
	  if pathGraph[topY][x] ~= nil then
		 break
	  elseif level[topY][x] == 1 then
		 alignVertical = false
		 break
	  end
	  topY = topY - 1
	  topDist = topDist + 1
   end
   local boty = y + 1
   local botdist = 1   
   if alignVertical then
	  while true do
		 if boty > LVLHEIGHT then
			boty = 1
		 end
		 if pathGraph[boty][x] ~= nil then
			break
		 elseif level[boty][x] == 1 then
			alignVertical = false
			break
		 end
		 boty = boty + 1
		 botdist = botdist + 1
	  end
   end
   if alignVertical then
	  pathGraph[y][x] = {
		 [1] = topDist,
		 [3] = botdist
	  }
	  pathGraph[topY][x][3] = topDist
	  pathGraph[boty][x][1] = botdist
	  return
   end   
   local rightx = x + 1
   local rightdist = 1
   while true do
	  if rightx > LVLWIDTH then
		 rightx = 1
	  end
	  if pathGraph[y][rightx] ~= nil then
		 break
	  end
	  rightx = rightx + 1
	  rightdist = rightdist + 1
   end
   local leftx = x - 1
   local leftdist = 1
   while true do
	  if leftx < 1 then
		 leftx = LVLWIDTH
	  end
	  if pathGraph[y][leftx] ~= nil then
		 break
	  end
	  leftx = leftx - 1
	  leftdist = leftdist + 1
   end
   pathGraph[y][x] = {
	  [2] = rightdist,
	  [4] = leftdist
   }
   pathGraph[y][rightx][4] = rightdist
   pathGraph[y][leftx][2] = leftdist
end

function removetempnode(x, y)
   if pathGraph[y][x][1] ~= nil then
	  local verticallength = pathGraph[y][x][1] + pathGraph[y][x][3]
	  local topY = y - pathGraph[y][x][1]
	  if topY < 1 then
		 topY = LVLHEIGHT + topY
	  end
	  pathGraph[topY][x][3] = verticallength
	  local boty = y + pathGraph[y][x][3]
	  if boty > LVLHEIGHT then
		 boty = boty - LVLHEIGHT
	  end
	  pathGraph[boty][x][1] = verticallength
	  pathGraph[y][x] = nil
   else
	  local horizontallength = pathGraph[y][x][2] + pathGraph[y][x][4]
	  local rightx = x + pathGraph[y][x][2]
	  if rightx > LVLWIDTH then
		 rightx = rightx - LVLWIDTH
	  end
	  pathGraph[y][rightx][4] = horizontallength
	  local leftx = x - pathGraph[y][x][4]
	  if leftx < 1 then
		 leftx = LVLWIDTH + leftx
	  end
	  pathGraph[y][leftx][2] = horizontallength
	  pathGraph[y][x] = nil
   end
end

function calculateghostdestination(ghost, objectivePoint)
   if calculatedpaths[ghost.name] ~= nil and calculatedpaths[ghost.name].objectivePoint.x == objectivePoint.x
   and calculatedpaths[ghost.name].objectivePoint.y == objectivePoint.y then
	  table.remove(calculatedpaths[ghost.name], 1)
	  if #calculatedpaths[ghost.name] == 0 then
		 calculatedpaths[ghost.name] = nil
	  end
	  ghost.destx = calculatedpaths[ghost.name][1].x
	  ghost.desty = calculatedpaths[ghost.name][1].y	  
   else
	  ghostRoadCalculation(ghost, objectivePoint)
	  ghost.destx = calculatedpaths[ghost.name][1].x
	  ghost.desty = calculatedpaths[ghost.name][1].y
   end
end

function ghostRoadCalculation(ghost, objectivePoint)
   local ghostX = (math.floor(ghost.x / TILEWIDTH) + 1)
   local ghostY = (math.floor(ghost.y / TILEHEIGHT) + 1)
   local temporaryGhostNodeMake = pathGraph[ghostY][ghostX] == nil
   local temporaryGhostNodeMade = pathGraph[objectivePoint.y][objectivePoint.x] == nil
   if temporaryGhostNodeMake then
	  createTemporaryNode(ghostX, ghostY)
   end
   if temporaryGhostNodeMade then
	  createTemporaryNode(objectivePoint.x, objectivePoint.y)
   end
   inspectedNodes = {}
   for y=1, LVLHEIGHT do
	  inspectedNodes[y] = {}
   end
   inspectedNodes[ghostY][ghostX] = 0
   endPoint = objectivePoint
   pathStack = {
	  stages = 0,
	  nodes = {
		 {
			x = ghostX,
			y = ghostY
		 }
	  }
   }
   bestGraphPathCalculator(ghostX, ghostY)
   gridGraphCalculator(ghost.name, objectivePoint)
   if temporaryGhostNodeMake then
	  removetempnode(ghostX, ghostY)
   end
   if temporaryGhostNodeMade then
	  removetempnode(objectivePoint.x, objectivePoint.y)
   end
end

function gridGraphCalculator(name, objectivePoint)
   calculatedpaths[name] = {}
   calculatedpaths[name].objectivePoint = {
	  x = objectivePoint.x,
	  y = objectivePoint.y
   }
   for i=2, #bestpath do
	  if bestpath[i].dir == 1 then
		 local topY = bestpath[i-1].y - 1
		 for j=1, pathGraph[bestpath[i-1].y][bestpath[i-1].x][1] do
			if topY < 1 then
			   topY = LVLHEIGHT
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = bestpath[i-1].x,
			   y = topY
			}
			topY = topY - 1
		 end
	  elseif bestpath[i].dir == 2 then
		 local rightx = bestpath[i-1].x + 1
		 for j=1, pathGraph[bestpath[i-1].y][bestpath[i-1].x][2] do
			if rightx > LVLWIDTH then
			   rightx = 1
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = rightx,
			   y = bestpath[i-1].y
			}
			rightx = rightx + 1
		 end
	  elseif bestpath[i].dir == 3 then
		 local boty = bestpath[i-1].y + 1
		 for j=1, pathGraph[bestpath[i-1].y][bestpath[i-1].x][3] do
			if boty > LVLHEIGHT then
			   boty = 1
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = bestpath[i-1].x,
			   y = boty
			}
			boty = boty + 1
		 end
	  elseif bestpath[i].dir == 4 then
		 local leftx = bestpath[i-1].x - 1
		 for j=1, pathGraph[bestpath[i-1].y][bestpath[i-1].x][4] do
			if leftx < 1 then
			   leftx = LVLWIDTH
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = leftx,
			   y = bestpath[i-1].y
			}
			leftx = leftx - 1
		 end		 
	  end	  
   end
end

function bestGraphPathCalculator(x, y)
   if inspectedNodes[y][x] ~= nil then
	  if pathStack.stages > inspectedNodes[y][x] then
		 return
	  else
		 inspectedNodes[y][x] = pathStack.stages
	  end
   end
   if x == endPoint.x and y == endPoint.y then
	  bestpath = {}
	  for i=1, #pathStack.nodes do
		 bestpath[i] = {
			x = pathStack.nodes[i].x,
			y = pathStack.nodes[i].y,
			dir = pathStack.nodes[i].dir
		 }
	  end
	  return
   end
   if pathGraph[y][x][1] ~= nil then
	  pathStack.stages = pathStack.stages + pathGraph[y][x][1]
	  local topY = y - pathGraph[y][x][1]
	  if topY < 1 then
		 topY = topY + LVLHEIGHT
	  end
	  pathStack.nodes[#pathStack.nodes + 1] = {
		 x = x,
		 y = topY,
		 dir = 1
	  }
	  if inspectedNodes[topY][x] == nil or pathStack.stages < inspectedNodes[topY][x] then
		 inspectedNodes[topY][x] = pathStack.stages
	  end
	  bestGraphPathCalculator(x, topY)
	  pathStack.nodes[#pathStack.nodes] = nil
	  pathStack.stages = pathStack.stages - pathGraph[y][x][1]
   end
   if pathGraph[y][x][2] ~= nil then
	  pathStack.stages = pathStack.stages + pathGraph[y][x][2]
	  local rightx = x + pathGraph[y][x][2]
	  if rightx > LVLWIDTH then
		 rightx = rightx - LVLWIDTH
	  end
	  pathStack.nodes[#pathStack.nodes + 1] = {	  
		 x = rightx,
		 y = y,
		 dir = 2
	  }
	  if inspectedNodes[y][rightx] == nil or pathStack.stages < inspectedNodes[y][rightx] then	  
		 inspectedNodes[y][rightx] = pathStack.stages
	  end
	  bestGraphPathCalculator(rightx, y)
	  pathStack.nodes[#pathStack.nodes] = nil
	  pathStack.stages = pathStack.stages - pathGraph[y][x][2]
   end
   if pathGraph[y][x][3] ~= nil then
	  pathStack.stages = pathStack.stages + pathGraph[y][x][3]
	  local boty = y + pathGraph[y][x][3]
	  if boty > LVLHEIGHT then
		 boty = boty - LVLHEIGHT
	  end
	  pathStack.nodes[#pathStack.nodes + 1] = {	  
		 x = x,
		 y = boty,
		 dir = 3
	  }
	  if inspectedNodes[boty][x] == nil or pathStack.stages < inspectedNodes[boty][x] then	  
		 inspectedNodes[boty][x] = pathStack.stages
	  end
	  bestGraphPathCalculator(x, boty)
	  pathStack.nodes[#pathStack.nodes] = nil
	  pathStack.stages = pathStack.stages - pathGraph[y][x][3]
   end
   if pathGraph[y][x][4] ~= nil then
	  pathStack.stages = pathStack.stages + pathGraph[y][x][4]
	  local leftx = x - pathGraph[y][x][4]
	  if leftx < 1 then
		 leftx = leftx + LVLWIDTH
	  end
	  pathStack.nodes[#pathStack.nodes + 1] = {
		 x = leftx,
		 y = y,
		 dir = 4
	  }
	  if inspectedNodes[y][leftx] == nil or pathStack.stages < inspectedNodes[y][leftx] then
		 inspectedNodes[y][leftx] = pathStack.stages
	  end
	  bestGraphPathCalculator(leftx, y)
	  pathStack.nodes[#pathStack.nodes] = nil
	  pathStack.stages = pathStack.stages - pathGraph[y][x][4]
   end
end

function moveGhostPoint(ghost, objectivePoint)
   if ghost.x == (objectivePoint.x - 1) * TILEWIDTH
   and ghost.y == (objectivePoint.y - 1) * TILEHEIGHT then
	  ghost.resting = true
	  return
   elseif ghost.resting then
	  calculateghostdestination(ghost, objectivePoint)
	  if ghost.y == 0 and ghost.desty == LVLHEIGHT then
		 ghost.desty = 0
	  elseif ghost.x == (LVLWIDTH * TILEWIDTH) - TILEWIDTH and ghost.destx == 1 then
		 ghost.destx = LVLWIDTH + 1
	  elseif ghost.y == (LVLHEIGHT * TILEHEIGHT) - TILEHEIGHT and ghost.desty == 1 then
		 ghost.desty = LVLHEIGHT + 1
	  elseif ghost.x == 0 and ghost.destx == LVLWIDTH then
		 ghost.destx = 0
	  end
	  ghost.resting = false
   end   local realGhostDirection = "right"
   local prevSpeed = ghost.speed
   if ghost.state == "dead" then
	  ghost.speed = DEADSPEED
   end
   if (ghost.destx - 1) * TILEWIDTH > ghost.x then
	  realGhostDirection = "right"
	  ghost.x = ghost.x + (globaldt * ghost.speed)
	  if ghost.x > (ghost.destx - 1) * TILEWIDTH then
		 ghost.x = (ghost.destx - 1) * TILEWIDTH
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   elseif (ghost.destx - 1) * TILEWIDTH < ghost.x then
	  realGhostDirection = "left"
	  ghost.x = ghost.x - (globaldt * ghost.speed)
	  if ghost.x < (ghost.destx - 1) * TILEWIDTH then
		 ghost.x = (ghost.destx - 1) * TILEWIDTH
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   elseif (ghost.desty - 1) * TILEHEIGHT > ghost.y then
	  realGhostDirection = "down"
	  ghost.y = ghost.y + (globaldt * ghost.speed)
	  if ghost.y > (ghost.desty - 1) * TILEHEIGHT then
		 ghost.y = (ghost.desty - 1) * TILEHEIGHT
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   elseif (ghost.desty - 1) * TILEHEIGHT < ghost.y then
	  realGhostDirection = "up"
	  ghost.y = ghost.y - (globaldt * ghost.speed)
	  if ghost.y < (ghost.desty - 1) * TILEHEIGHT then
		 ghost.y = (ghost.desty - 1) * TILEHEIGHT
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   end
   if not ghost.resting then
	  if player.state == "energized" then
		 if ghost.state == "dead" then
			setanimation(ghost, "dead-move-" .. realGhostDirection)
		 else
			if energizerTimer < (ENERGIZERDURATION / 1.5) then
			   setanimation(ghost, "ghost-scared")
			else
			   setanimation(ghost, "ghost-flash")
			end
		 end
	  else
		 setanimation(ghost, ghost.name .. "-move-" .. realGhostDirection)
	  end
   end
   ghost.speed = prevSpeed
   if not ghost.crossing then
	  if ghost.x < 0 then
		 ghost.destx = LVLWIDTH
		 ghost.x = (TILEWIDTH * LVLWIDTH) + TILEWIDTH
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.x > (TILEWIDTH * LVLWIDTH) - TILEWIDTH then
		 ghost.destx = 1
		 ghost.x = -TILEWIDTH
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.y < 0 then
		 ghost.desty = LVLHEIGHT
		 ghost.y = (TILEHEIGHT * LVLHEIGHT) + TILEHEIGHT
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.y > (TILEHEIGHT * LVLHEIGHT) - TILEHEIGHT then
		 ghost.desty = 1
		 ghost.y = -TILEHEIGHT
		 ghost.crossing = true
		 ghost.resting = false		 
	  end
   end
end

function ghostsController()
   if player.state == "energized" then
	  ghostGetEnergized()
   else

	  if ghostaicycle == "chase" then
		 ghostGetChased()
	  else
		 ghostGetSpread()
	  end
   end
end

function ghostRandomMovement(ghost)
   if ghostRandomTargets[ghost.name] == nil
	  or (ghost.x == (ghostRandomTargets[ghost.name].x - 1) * TILEWIDTH
		  and ghost.y == (ghostRandomTargets[ghost.name].y - 1) * TILEHEIGHT) then
	  repeat
		 ghostRandomTargets[ghost.name] = {
			x = math.random(LVLWIDTH),
			y = math.random(LVLHEIGHT)
		 }
	  until level[ghostRandomTargets[ghost.name].y][ghostRandomTargets[ghost.name].x] == 0
		 and not ghostWallCheck(ghostRandomTargets[ghost.name].x, ghostRandomTargets[ghost.name].y)
		 and (ghost.x ~= (ghostRandomTargets[ghost.name].x - 1) * TILEWIDTH
				 or ghost.y ~= (ghostRandomTargets[ghost.name].y - 1) * TILEHEIGHT)
   end
   moveGhostPoint(ghost, ghostRandomTargets[ghost.name])
end

function ghostGetEnergized()
   if blinks.state == "dead" then
	  moveGhostPoint(blinks, blinks.startPlace)
   else
	  ghostRandomMovement(blinks)
   end
   if pinkie.state == "dead" then
	  moveGhostPoint(pinkie, pinkie.startPlace)
   else
	  ghostRandomMovement(pinkie)
   end
   if inkie.state == "dead" then
	  moveGhostPoint(inkie, inkie.startPlace)
   else
	  ghostRandomMovement(inkie)
   end
   if clyde.state == "dead" then
	  moveGhostPoint(clyde, clyde.startPlace)
   else
	  ghostRandomMovement(clyde)
   end   
end

function ghostGetSpread()
   moveGhostPoint(blinks, blinks.corner)
   moveGhostPoint(pinkie, pinkie.corner)
   moveGhostPoint(inkie, inkie.corner)
   moveGhostPoint(clyde, clyde.corner)   
end

function ghostGetChased()
   -- blinks just moves toward the player
   local playerx = player.destx
   if playerx > LVLWIDTH then
	  playerx = 1
   elseif playerx < 1 then
	  playerx = LVLWIDTH
   end
   local playery = player.desty
   if playery > LVLHEIGHT then
	  playery = 1
   elseif playery < 1 then
	  playery = LVLHEIGHT
   end
   moveGhostPoint(blinks, {x=playerx,y=playery})
   if #calculatedpaths["blinks"] >= 2 then
	  local blinksdirection = calculatedpaths["blinks"][#calculatedpaths["blinks"] - 1]
	  local pinkietarget = nil
	  if playery > 1 and not barricadeCheck(playerx, playery - 1)
	  and (playery - 1 ~= blinksdirection.y or playerx ~= blinksdirection.x) then
		 pinkietarget = {
			x = playerx,
			y = playery - 1
		 }
	  elseif playerx < LVLWIDTH and not barricadeCheck(playerx + 1, playery)
	  and (playery ~= blinksdirection.y or playerx + 1 ~= blinksdirection.x) then
		 pinkietarget = {
			x = playerx + 1,
			y = playery
		 }
	  elseif playery < LVLHEIGHT and not barricadeCheck(playerx, playery + 1)
	  and (playery + 1 ~= blinksdirection.y or playerx ~= blinksdirection.x) then
		 pinkietarget = {
			x = playerx,
			y = playery + 1
		 }
	  elseif playerx > 1 and not barricadeCheck(playerx - 1, playery)
	  and (playery ~= blinksdirection.y or playerx - 1 ~= blinksdirection.x) then
		 pinkietarget = {
			x = playerx - 1,
			y = playery
		 }
	  else
		 pinkietarget = {
			x = playerx,
			y = playery
		 }
	  end
	  moveGhostPoint(pinkie, pinkietarget)
   else
	  moveGhostPoint(pinkie, {x=playerx,y=playery})
   end
   ghostRandomMovement(inkie)
   if clydetarget == nil then
	  clydetarget = {
			x = clyde.destx,
			y = clyde.desty
	  }
   end
   while level[clydetarget.y][clydetarget.x] == 1
	  or (math.abs(clydetarget.x - playerx) < (LVLWIDTH / 2) and
			 math.abs(clydetarget.y - playery) < (LVLHEIGHT / 2))
   or ghostWallCheck(clydetarget.x, clydetarget.y) do
	  clydetarget = {
		 x = math.random(LVLWIDTH),
		 y = math.random(LVLHEIGHT)
	  }
   end
   moveGhostPoint(clyde, clydetarget)
end
