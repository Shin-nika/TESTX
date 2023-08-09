animations = {
   ["pacman-ball"] = {
	  framelength = 0,
	  frames = {
		 {TILEWIDTH * 2, 0, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-right"] = {
	  framelength = 0.075,
	  frames = {
		 {0, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, 0, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-left"] = {
	  framelength = 0.075,
	  frames = {
		 {0, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-up"] = {
	  framelength = 0.075,
	  frames = {
		 {0, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-down"] = {
	  framelength = 0.075,
	  frames = {
		 {0, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-death"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 4, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 6, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 8, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 9, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 11, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 12, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 13, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, TILEHEIGHT, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["energizer-oscillate"] = {
	  framelength = 0.075,
	  frames = {
		 {TILEWIDTH * 7, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 8, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 9, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 11, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 9, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 8, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinks-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinks-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinks-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinks-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinkie-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinkie-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinkie-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinkie-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inkie-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inkie-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inkie-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inkie-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },         
   ["ghost-scared"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["ghost-flash"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 4, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },   
   ["dead-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["dead-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 3, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["dead-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["dead-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 5, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   }   
}
images = {
   {"cherry", TILEWIDTH * 2, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"strawberry", TILEWIDTH * 3, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"peach", TILEWIDTH * 4, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"apple", TILEWIDTH * 5, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"grapes", TILEWIDTH * 6, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"galaxian", TILEWIDTH * 7, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"bell", TILEWIDTH * 8, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"key", TILEWIDTH * 9, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
   {"life", TILEWIDTH * 6, TILEHEIGHT * 2, 13, 13},
   {"dot", TILEWIDTH * 8, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
   {"topcap", TILEWIDTH * 9, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
   {"rightcap", TILEWIDTH * 10, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
   {"bottomcap", TILEWIDTH * 11, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
   {"leftcap", TILEWIDTH * 12, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
   {"bottomrightblock", TILEWIDTH * 8, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
   {"bottomleftblock", TILEWIDTH * 9, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
   {"toprightblock", TILEWIDTH * 10, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
   {"topleftblock", TILEWIDTH * 11, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
   {"bottomright", TILEWIDTH * 8, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
   {"bottomleft", TILEWIDTH * 9, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
   {"topright", TILEWIDTH * 10, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
   {"topleft", TILEWIDTH * 11, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
   {"topline", TILEWIDTH * 8, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
   {"bottomline", TILEWIDTH * 8, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
   {"bottomline", TILEWIDTH * 9, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
   {"leftline", TILEWIDTH * 10, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
   {"rightline", TILEWIDTH * 11, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}	  
}


function setanimation(character, animation)
   character.sprite.paused = false
   if character.sprite.animation ~= animation then
	  character.sprite.animation = animation
	  character.sprite.timer = 0
	  character.sprite.frame = 1
   end
end

function drawimage(quad, x, y)
   love.graphics.draw(spritesheet, quad, x * 2, y * 2, 0, 2, 2)
end

function drawrectangle(x, y, w, h)
   love.graphics.rectangle("fill", x * 2, y * 2, w * 2, h * 2)
end

function drawsprite(x, y, sprite)
   if not sprite.paused and animations[sprite.animation].framelength ~= 0 then
	  sprite.timer = sprite.timer + globaldt
	  if sprite.timer > animations[sprite.animation].framelength then
		 sprite.timer = 0
		 sprite.frame = sprite.frame + 1
		 if sprite.frame > #animations[sprite.animation].frames then
			sprite.frame = 1
		 end
	  end
   end
   drawimage(animations[sprite.animation].frames[sprite.frame], x, y + TOPMARGIN)
   if x < 0 then
	  drawimage(animations[sprite.animation].frames[sprite.frame], (LVLWIDTH * TILEWIDTH) + x, y + TOPMARGIN)
   elseif x + TILEWIDTH > LVLWIDTH * TILEWIDTH then
	  drawimage(animations[sprite.animation].frames[sprite.frame],
						 x - ((LVLWIDTH * TILEWIDTH) + TILEWIDTH), y + TOPMARGIN)
   elseif y < 0 then
	  drawimage(animations[sprite.animation].frames[sprite.frame],
						 x, (LVLHEIGHT * TILEHEIGHT) + y + TOPMARGIN)
   elseif y + TILEHEIGHT > LVLHEIGHT * TILEHEIGHT then
	  drawimage(animations[sprite.animation].frames[sprite.frame],
						 x, y - ((LVLHEIGHT * TILEHEIGHT) + TILEHEIGHT) + TOPMARGIN)
   end
end

function drawpoints()
   for x=1, LVLWIDTH do
	  for y=1, LVLHEIGHT do
		 if points[y][x] == 1 then
			drawrectangle(((x - 1) * TILEWIDTH) + 7, ((y - 1) * TILEHEIGHT) + TOPMARGIN + 7, 2, 2)
		 end
	  end
   end
end

function drawgame()
   love.graphics.clear()
   love.graphics.setColor(lvlcolor.r, lvlcolor.g, lvlcolor.b, 1)
   love.graphics.draw(levelbackground, 0, TOPMARGIN * 2, 0, 2, 2)
   love.graphics.setColor(1, 1, 1, 1)
   drawrectangle(((ghostwall.x - 1) * TILEWIDTH) - 4, (ghostwall.y - 1) * TILEHEIGHT + TOPMARGIN + 7, 40, 2)
   drawpoints()
   for i=1, #Boosters do
	  drawsprite((Boosters[i].x - 1) * TILEWIDTH, (Boosters[i].y - 1) * TILEHEIGHT, Boosters[i].sprite)
   end
   for i=1, #fruits do
	  drawimage(images[fruits[i].name], (fruits[i].x - 1) * TILEWIDTH, ((fruits[i].y - 1) * TILEHEIGHT) + TOPMARGIN)
   end   
   drawsprite(player.x, player.y, player.sprite)
   drawsprite(blinks.x, blinks.y, blinks.sprite)
   drawsprite(pinkie.x, pinkie.y, pinkie.sprite)
   drawsprite(inkie.x, inkie.y, inkie.sprite)
   drawsprite(clyde.x, clyde.y, clyde.sprite)   
   drawui()
end

function drawscorescreen()
   if exitingLVL == -1 then
	  love.graphics.printf("GAME OVER", 0, (LVLHEIGHT * TILEHEIGHT) + TOPMARGIN, LVLWIDTH * TILEWIDTH * 2, "center")
   else
	  love.graphics.printf("YOU WIN", 0, (LVLHEIGHT * TILEHEIGHT) + TOPMARGIN, LVLWIDTH * TILEWIDTH * 2, "center")
   end
end

function drawui()
   love.graphics.setColor(0, 0, 0, 1)
   drawrectangle(0, 0, LVLWIDTH * TILEWIDTH, TOPMARGIN)
   drawrectangle(0, (LVLHEIGHT * TILEHEIGHT) + TOPMARGIN, LVLWIDTH * TILEWIDTH, TILEHEIGHT)   
   love.graphics.setColor(1, 1, 1, 1)
   love.graphics.printf("SCORE", 0, TILEHEIGHT, LVLWIDTH * TILEWIDTH, "center")   
   love.graphics.printf(string.format("%08d", score), 0, TILEHEIGHT * 2, LVLWIDTH * TILEWIDTH, "center")
   love.graphics.printf("LEVEL " .. exitingLVL, LVLWIDTH * TILEWIDTH, TILEHEIGHT * 2, LVLWIDTH * TILEWIDTH, "center")
   for i=1, totalLIVES do
	  drawimage(images["life"], (TILEWIDTH * 2) + (13 * (i - 1)), (LVLHEIGHT * TILEHEIGHT) + TOPMARGIN)
   end
   if spawnAnimationTimer < 2 then
	  love.graphics.printf("READY", 0, ((LVLHEIGHT * TILEWIDTH) + TOPMARGIN) * 2, LVLWIDTH * TILEWIDTH * 2, "center")
   elseif spawnAnimationTimer < 4 then
	  love.graphics.printf("SET", 0, ((LVLHEIGHT * TILEWIDTH) + TOPMARGIN) * 2, LVLWIDTH * TILEWIDTH * 2, "center")
   elseif spawnAnimationTimer < 5 then
	  love.graphics.printf("GO!", 0, ((LVLHEIGHT * TILEWIDTH) + TOPMARGIN) * 2, LVLWIDTH * TILEWIDTH * 2, "center")
   end
   local fruitindex = exitingFruit
   for i=1, 3 do
	  drawimage(images[FRUITSCORES[fruitindex][1]], ((LVLWIDTH - 5) * TILEWIDTH) + (TILEWIDTH * (i - 1)),
				(LVLHEIGHT * TILEHEIGHT) + TOPMARGIN)
	  fruitindex = fruitindex + 1
	  if fruitindex > #FRUITSCORES then
		 fruitindex = 1
	  end
   end
end

function renderbackground()
   levelbackground = love.graphics.newCanvas(TILEWIDTH * LVLWIDTH, TILEHEIGHT * LVLHEIGHT)
   love.graphics.setCanvas(levelbackground)
   local solidcase = {
	  {1,1,1},
	  {1,1,1},
	  {1,1,1}
   }
   local specialcases = {
	  {
		 "dot",
		 {
			{0,0,0},
			{0,1,0},
			{0,0,0}
		 }
	  },      	  
	  {
		 "leftcap",
		 {
			{0,0,2},
			{0,1,1},
			{0,0,2}
		 }
	  },      
	  {
		 "topcap", 
		 {
			{0,0,0},
			{0,1,0},
			{2,1,2}
		 }
	  },
	  {
		 "rightcap",
		 {
			{2,0,0},
			{1,1,0},
			{2,0,0}
		 }
	  },
	  {
		 "bottomcap",
		 {
			{2,1,2},
			{0,1,0},
			{0,0,0}
		 }
	  }
   }
   local normalcases = {
	  {
		 "bottomrightblock",
		 optionaltile = "topleft",
		 {
			{3,1,2},
			{1,1,0},
			{2,0,0}
		 }
	  },      
	  {
		 "bottomleftblock",
		 optionaltile = "topright",
		 {
			{2,1,3},
			{0,1,1},
			{0,0,2}
		 }
	  },
	  {
		 "toprightblock",
		 optionaltile = "bottomleft",
		 {
			{2,0,0},
			{1,1,0},
			{3,1,2}
		 }
	  },
	  {
		 "topleftblock",
		 optionaltile = "bottomright",
		 {
			{0,0,2},
			{0,1,1},
			{2,1,3}
		 }
	  },	  
	  {
		 "bottomright",
		 {
			{2,2,2},
			{2,1,1},
			{2,1,0}
		 }
	  },
	  {
		 "bottomleft",
		 {
			{2,2,2},
			{1,1,2},
			{0,1,2}
		 }
	  },
	  {
		 "topright",
		 {
			{2,1,0},
			{2,1,1},
			{2,2,2}
		 }
	  },      
	  {
		 "topleft",
		 {
			{0,1,2},
			{1,1,2},
			{2,2,2}
		 }
	  },
	  {
		 "topline",
		 {
			{2,0,2},
			{1,1,1},
			{2,2,2}
		 }
	  },
	  {
		 "bottomline",
		 {
			{2,2,2},
			{1,1,1},
			{2,0,2}
		 }
	  },
	  {
		 "leftline",
		 {
			{2,1,2},
			{0,1,2},
			{2,1,2}
		 }
	  },
	  {
		 "rightline",
		 {
			{2,1,2},
			{2,1,0},
			{2,1,2}
		 }
	  }
   }

   local grid = nil

   -- Check if a grid matches a case
   local gridmatchescase = function (case)
	  local optionaltiles = false
	  for y=1, 3 do
		 for x=1, 3 do
			if grid[y][x] ~= case[y][x] and case[y][x] ~= 2 then
			   if case[y][x] == 3 and grid[y][x] == 0 then
				  optionaltiles = true
			   elseif case[y][x] == 1 or case[y][x] == 0 then
				  return false
			   end
			end
		 end
	  end
	  return true, optionaltiles
   end   

   local rendertile = function (x, y)
	  if level[y][x] == 0 then
		 return
	  end
	  grid = {
		 {0,0,0},
		 {0,1,0},
		 {0,0,0}
	  }
	  if y >= 2 and x >= 2 and level[y-1][x-1] == 1 then grid[1][1] = 1 end
	  if y >= 2 and level[y-1][x] == 1 then grid[1][2] = 1 end
	  if y >= 2 and x <= (LVLWIDTH-1) and level[y-1][x+1] == 1 then grid[1][3] = 1 end
	  if y <= (LVLHEIGHT-1) and x >= 2 and level[y+1][x-1] == 1 then grid[3][1] = 1 end
	  if y <= (LVLHEIGHT-1) and level[y+1][x] == 1 then grid[3][2] = 1 end
	  if y <= (LVLHEIGHT-1) and x <= (LVLWIDTH-1) and level[y+1][x+1] == 1 then grid[3][3] = 1 end
	  if x >= 2 and level[y][x-1] == 1 then grid[2][1] = 1 end
	  if x <= (LVLWIDTH-1) and level[y][x+1] == 1 then grid[2][3] = 1 end
	  if gridmatchescase(solidcase) then
		 return
	  end
	  for i=1, #specialcases do
		 if gridmatchescase(specialcases[i][2]) then
			love.graphics.draw(spritesheet, images[specialcases[i][1]], (x-1) * TILEWIDTH, (y-1) * TILEHEIGHT)
			return
		 end
	  end
	  for i=1, #normalcases do
		 local casematch, drawoptionaltile = gridmatchescase(normalcases[i][2])
		 if casematch then
			love.graphics.draw(spritesheet, images[normalcases[i][1]], (x-1) * TILEWIDTH, (y-1) * TILEHEIGHT)
			if drawoptionaltile then
			   love.graphics.draw(spritesheet, images[normalcases[i].optionaltile], (x-1) * TILEWIDTH, (y-1) * TILEHEIGHT)
			end
		 end
	  end
   end
   
   for x=1, LVLWIDTH do
	  for y=1, LVLHEIGHT do
		 rendertile(x, y)
	  end
   end
   love.graphics.setCanvas()
end
