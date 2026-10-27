function love.load() end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Window Resolution - " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight())
	love.graphics.reset()
end

function love.update(dt) end
