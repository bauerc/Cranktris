local pd <const> = playdate
local gfx <const> = pd.graphics


class("Piece").extends(gfx.sprite)

function Piece:init(current, rotation, numRotations, fill, blockImage)

    self.current = current
    self.rotations = rotation
    self.numRotations = numRotations
    self.selection = 0
    self.fill = fill
    self.image = nil
    self.blockImage = blockImage
    self:setCenter(0,0)
    
end

function Piece:draw()
    local pieceImage = gfx.image.new(#self.current[1] * 11, #self.current * 11)
	gfx.pushContext(pieceImage)
		gfx.setColor(gfx.kColorBlack)
		local xOffset = 11
		local yOffset = 11
		for y, sub in pairs(self.current) do
			for x, fill in pairs(sub) do
				if (fill >= 1) then
					self.blockImage:draw((x-1) * xOffset+1, (y-1) * yOffset+1)
				end
			end
		end
	gfx.popContext()
    self.image = pieceImage
end

function Piece:update()
    self:draw()
    self:setImage(self.image)
end

function Piece:rotate(direction)
    self.selection = (self.selection + direction) % self.numRotations
    self.current = self.rotations[self.selection]
end