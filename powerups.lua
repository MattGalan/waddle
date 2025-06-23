powerup = entity:new({
  pos = point:new({ x = -100, y = -100 }),
  duration = 150,
  spawn = function(_ENV)
    pos.x = rnd(119)
    pos.y = rnd(119)
  end,
})

speed_powerup = powerup:new({
  pos = { x = rnd(119), y = rnd(119) },
  sprite = 18,

  hitbox = {
    bottom = 0,
    right = 6,
    top = 7,
    left = 0
  },

  bar_color_top = 9,
  bar_color_bottom = 4,

  on_start = function()
    speed = speed * 1.5
    add_floating_text("coffee!", up_foot.pos)
  end,

  on_end = function()
    speed = speed / 1.5
  end,
})

function init_powerups()
  powerups = { speed_powerup }
  actives = {}
end

function update_powerups()
  -- check powerup collisions
  for _, p in pairs(powerups) do
    if up_foot:intersects(p) then
      add(actives, {
        powerup = p,
        remaining = p.duration,
      })
      p:on_start()
      p:spawn()
    end
  end
  
  for _, a in pairs(actives) do
    a.remaining = a.remaining - 1
    if a.remaining <= 0 then
      a.powerup:on_end()
      del(actives, a)
    end
  end
end

function draw_powerups()
  speed_powerup:draw()

  for i, a in pairs(actives) do
    i = (i - 1) * 2
    w = (a.remaining / a.powerup.duration) * 127
    line(0, i, w, i, a.powerup.bar_color_top)
    line(0, i+1, w, i+1, a.powerup.bar_color_bottom)
  end
end