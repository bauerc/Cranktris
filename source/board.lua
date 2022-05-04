
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

    gfx.sprite.setBackgroundDrawingCallback(
		function(x,y,width,height)
			gfx.setClipRect( x, y, width, height )
            self:drawImage()
			self.image:draw(145,10)
			gfx.clearClipRect()
		end
	)
    self:add()
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

function Board:update()

    if pd.buttonJustPressed(pd.kButtonUp) then
        self:changeRandomCell()
        gfx.sprite.redrawBackground()
    end

end


function Board:changeRandomCell()
    local y = math.random(#self.state)
    local x = math.random(#self.state[y])
    local fill = math.random(#self.blockImages)
    self.state[y][x] = fill

    print(y)
    print(x)
    print(fill)
    print(self.state[y][x])
end