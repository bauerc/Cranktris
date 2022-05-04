local pd <const> = playdate
local gfx <const> = pd.graphics


class("PlayBoard").extends(Board)

function PlayBoard:init()

    PlayBoard.super.init(self)
    self.emptyState = self.state
    self.prevState = self.state
    self.drawCells = false
    self.initX = 4
    self.initY = 1
    self.pieceX = self.initX
    self.pieceY =  self.initY
    self:insertPiece()
    self:add()
    self:setCenter(0,0)
    self:moveTo(145,10)
end

function PlayBoard:insertPiece()
    local piece = {
        {2,2,3,3},
        {1,1,4,4},
        {5,5,6,6},
    }
    
    for y, sub in pairs(piece) do
        for x, fill in pairs(sub) do
            self.state[self.initY + (y-1)][self.initX + (x-1)] = fill
        end
    end
end

function PlayBoard:update()
    self:drawImage()
    self:setImage(self.image)
end