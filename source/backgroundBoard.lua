local pd <const> = playdate
local gfx <const> = pd.graphics

import "board"

class("BackgroundBoard").extends(Board)

function BackgroundBoard:init()
    BackgroundBoard.super.init(self)
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

function BackgroundBoard:update()
    if pd.buttonJustPressed(pd.kButtonUp) then
        self:changeRandomCell()
        gfx.sprite.redrawBackground()
    end
end

function BackgroundBoard:changeRandomCell()
    local y = math.random(#self.state)
    local x = math.random(#self.state[y])
    local fill = math.random(#self.blockImages)
    self.state[y][x] = fill
end