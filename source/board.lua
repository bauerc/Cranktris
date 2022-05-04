
local pd <const> = playdate
local gfx <const> = pd.graphics


class("Board").extends(gfx.sprite)

function Board:init()
    self.state = {
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},		
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},		
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {0 ,0 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
        {1 ,1 ,0 ,0, 0 ,0 ,0, 0, 0, 0},
    }
    self.image = nil
    self.blockImageTable = gfx.imagetable.new("images/blocksprites")
    self.blockImages = {}
    for i = 1,#self.blockImageTable do
		self.blockImages[i] = self.blockImageTable[i]
	end
end



function Board:drawImage()
	local boardImage = gfx.image.new(110, 220)
	gfx.pushContext(boardImage)
		gfx.setColor(gfx.kColorBlack)
		local xOffset = 11
		local yOffset = 11
		for y, sub in pairs(self.state) do
			for x, fill in pairs(sub) do
				if (fill >= 1) then
					local fillImage = self.blockImages[fill]
					fillImage:draw((x-1) * xOffset+1, (y-1) * yOffset+1)
				end
				gfx.drawRoundRect((x-1) * xOffset, (y-1) * yOffset, 10, 10, 1)
			end
		end
	gfx.popContext()
    self.image = boardImage
end

