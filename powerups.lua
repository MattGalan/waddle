speed_powerup = entity:new({
  pos = { x = rnd(119), y = rnd(119) },
  sprite = 16,
  hitbox = {
    bottom = 0,
    right = 6,
    top = 7,
    left = 0
  }
})

function init_powerups()
end

function update_powerups()
  if up_foot:intersects(speed_powerup) then
    speed_powerup.pos.x = rnd(119)
    speed_powerup.pos.y = rnd(119)
  end
end

function draw_powerups()
  speed_powerup:draw()
end