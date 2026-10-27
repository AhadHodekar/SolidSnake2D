GRID_SIZE = 5 -- ( N => NxN)
GRID_WIDTH = 50
GRID_HEIGHT = 50

WIN_PADDING = { x = 50, y = 100 }

WIN_WIDTH = love.graphics.getWidth()
WIN_HEIGHT = love.graphics.getHeight()

function love.load()
	love.window.setMode(
		GRID_WIDTH * GRID_SIZE + WIN_PADDING.x * 2,
		GRID_HEIGHT * GRID_SIZE + WIN_PADDING.y * 2,
		{ resizable = false }
	)
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Window Resolution - " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), 10, 10)
	love.graphics.reset()

	for i = 0, GRID_SIZE do
		--[[ VERTICAL CO-ORDS

            (x1,y1)
               *
               |
               |
               *
            (x2,y2)

        --]]
		local vertical_coords = {
			x1 = WIN_PADDING.x + GRID_WIDTH * i,
			y1 = WIN_PADDING.y + 0,

			x2 = WIN_PADDING.x + GRID_WIDTH * i,
			y2 = WIN_PADDING.y + GRID_SIZE * GRID_HEIGHT,
		}

		love.graphics.setColor(1, 1, 1)
		-- love.graphics.setColor(love.math.random(0, 1), 1, love.math.random(0, 1))
		love.graphics.line(vertical_coords.x1, vertical_coords.y1, vertical_coords.x2, vertical_coords.y2)
		love.graphics.reset()

		--[[ HORIZONTAL CO-ORDS
 
         (x1,y1) *----* (x2,y2)

        --]]
		local horizontal_coords = {
			x1 = WIN_PADDING.x + 0,
			y1 = WIN_PADDING.y + GRID_HEIGHT * i,

			x2 = WIN_PADDING.x + GRID_SIZE * GRID_WIDTH,
			y2 = WIN_PADDING.y + GRID_HEIGHT * i,
		}

		love.graphics.setColor(1, 1, 1)
		-- love.graphics.setColor(1, love.math.random(0, 1), 1)
		love.graphics.line(horizontal_coords.x1, horizontal_coords.y1, horizontal_coords.x2, horizontal_coords.y2)
		love.graphics.reset()
	end
end

function love.update(dt) end
