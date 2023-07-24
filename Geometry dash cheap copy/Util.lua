function generateQuads(atlas, tileWidth, tileHeight)
	local sheetWidth = atlas:getWidth() / tileWidth
	local sheetHeight = atlas:getHeight() / tileHeight
	
	local counter = 1
	local spritesheet = {}
	
	for y = 0, sheetHeight - 1 do
		for x = 0, sheetWidth - 1 do
			spritesheet[counter] = love.graphics.newQuad(
					x * tileWidth,
					y * tileHeight,
					tileWidth,
					tileHeight,
					atlas:getDimensions())
			counter = counter + 1
		end
	end
	
	return spritesheet
end

function slice(sheet, first, last, step)
	local sliced = {}
	
	for index = first or 1, last or #sheet, step or 1 do
		table.insert(sliced, sheet[index])
	end
	
	return sliced
end

function sliced(sheet, first, last, step)
	local sliced = {}
	
	for index = first or 1, last or #sheet, step or 1 do
		table.insert(sliced, sheet[index])
	end
	
	return sliced
end
