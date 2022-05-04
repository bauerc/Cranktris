import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/animator"

import "board"
import "backgroundBoard"
import "playBoard"
import "Piece"

local pd <const> = playdate
local gfx <const> = playdate.graphics
local Animator <const> = playdate.graphics.animator


local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	math.randomseed(playdate.getSecondsSinceEpoch()) -- seed for math.random

	local backgroundBoard = BackgroundBoard()
	local playBoard = PlayBoard()
	-- board:drawImage()

	local current = {
		{1,1,1,1},
	}

	local rotations = {
		[0] = current,
		[1] = {{1},
				{1},
				{1},
				{1}},
	}
	local fill = 1

	local pieceImage = playBoard.blockImages[1]
	piece = Piece(current, rotations, 2, fill, pieceImage)
	piece:add()
	piece:moveTo(145,10)

end

local function updateGame()
	gfx.sprite.update()
end

local function drawGame()
	-- gfx.clear() -- Clears the screen
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()

	if (playdate.buttonJustPressed(playdate.kButtonDown)) then
		local curX = piece.x
		local curY = piece.y
		local curPos = playdate.geometry.point.new(curX, curY)
		local newPos = playdate.geometry.point.new(curX, curY+11)
		local moveEasingFunction = playdate.easingFunctions.inBounce
		local moveTime = 100

		piece:setAnimator(gfx.animator.new(moveTime, curPos, newPos, moveEasingFunction))
		piece:moveTo(piece.x, piece.y + 11)
	end

	if pd.buttonJustPressed(pd.kButtonRight) then
		piece:rotate(1)
	end

	playdate.drawFPS(0,0) -- FPS widget
end