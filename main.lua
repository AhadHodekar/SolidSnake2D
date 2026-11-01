GRID_SIZE = 5 -- ( N => NxN blocks)
GRID_WIDTH = 50
GRID_HEIGHT = 50

WIN_PADDING = { x = 50, y = 80 }

WIN_WIDTH = love.graphics.getWidth()
WIN_HEIGHT = love.graphics.getHeight()

SCORE = 0

local DIR_OPTS = {
	UP = "up",
	DOWN = "down",
	LEFT = "left",
	RIGHT = "right",
}

local Snake = {
	speed = 0.1,
	timer = 0,
	w = GRID_WIDTH - 1,
	h = GRID_HEIGHT - 1,
	pos = { x = WIN_PADDING.x, y = WIN_PADDING.y },
	head = { x = WIN_PADDING.x, y = WIN_PADDING.y },
	body = {},
	direction = DIR_OPTS.RIGHT,
}

function love.load()
	love.window.setMode(
		GRID_WIDTH * GRID_SIZE + WIN_PADDING.x * 2,
		GRID_HEIGHT * GRID_SIZE + WIN_PADDING.y * 2,
		{ resizable = false }
	)
end

function love.update(dt)
	print(dt)
	if love.keyboard.isDown("w") then
		Snake.direction = DIR_OPTS.UP
	elseif love.keyboard.isDown("s") then
		Snake.direction = DIR_OPTS.DOWN
	elseif love.keyboard.isDown("d") then
		Snake.direction = DIR_OPTS.RIGHT
	elseif love.keyboard.isDown("a") then
		Snake.direction = DIR_OPTS.LEFT
	end

	if Snake.direction == DIR_OPTS.UP then
		Snake.pos.y = Snake.pos.y - GRID_HEIGHT * Snake.speed * dt
	elseif Snake.direction == DIR_OPTS.DOWN then
		Snake.pos.y = Snake.pos.y + GRID_HEIGHT * Snake.speed * dt
	elseif Snake.direction == DIR_OPTS.LEFT then
		Snake.pos.x = Snake.pos.x - GRID_WIDTH * Snake.speed * dt
	elseif Snake.direction == DIR_OPTS.RIGHT then
		Snake.pos.x = Snake.pos.x + GRID_WIDTH * Snake.speed * dt
	end
end

function love.draw()
	if love.keyboard.isDown("q") then
		love.window.close()
	end

	-- [[
	--      HEAD AREA
	--                  ]]

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Window Resolution - " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), 10, 10)
	love.graphics.reset()

	love.graphics.setColor(1, 1, 1)
	-- love.graphics.print("Espionage Score - " .. SCORE, love.graphics.getWidth() - 180, 10)
	love.graphics.print("Espionage Score - " .. SCORE, WIN_PADDING.x, WIN_PADDING.y - 30)
	love.graphics.reset()

	-- [[
	--      GRID MAP
	--                  ]]

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

		love.graphics.setColor(love.math.random(0.75, 1), 0, love.math.random(0.75, 1))
		love.graphics.rectangle("fill", WIN_PADDING.x + Snake.pos.x * i, WIN_PADDING.y + Snake.pos.y, Snake.w, Snake.h)
		love.graphics.reset()
	end
end
