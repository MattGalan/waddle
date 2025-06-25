powerup = entity:new({
  pos = point:new({ x = -100, y = -100 }),
  duration = 128,
  show_name = function(_ENV)
    add_floating_text(name, point:new({
      x = up_foot.pos.x,
      y = up_foot.pos.y - 4
    }))
  end
})

speed_powerup = powerup:new({
  name = "coffee!",
  sprite = 18,
  hitbox = {
    width = 6,
    height = 6,
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

slow_powerup = powerup:new({
  name = "ice cream!",
  sprite = 20,
  hitbox = {
    width = 4,
    height = 8,
  },
  bar_color_top = 7,
  bar_color_bottom = 4,

  on_start = function()
    speed = speed / 2
  end,

  on_end = function()
    speed = speed * 2
  end
})

grow_powerup = powerup:new({
  name = "green bean!",
  sprite = 19,
  hitbox = {
    width = 6,
    height = 7,
  },
  bar_color_top = 11,
  bar_color_bottom = 3,

  on_start = function()
    gait = gait * 1.5
  end,

  on_end = function()
    gait = gait / 1.5
  end
})

shrink_powerup = powerup:new({
  name = "lemon!",
  sprite = 21,
  hitbox = {
    width = 6,
    height = 7,
  },
  bar_color_top = 10,
  bar_color_bottom = 9,

  on_start = function()
    gait = gait / 2
  end,

  on_end = function()
    gait = gait * 2
  end
})

function init_powerups()
  powerups = {
    speed_powerup,
    slow_powerup,
    grow_powerup,
    shrink_powerup,
  }
  actives = {}
  spawn_powerup()
end

function spawn_powerup()
  rnd(powerups).pos = point:new({ x = rnd(119), y = rnd(119) })
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
      p:show_name()
      p.pos = point:new({ x = -100, y = -100 })
      spawn_powerup()
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
  for _, p in pairs(powerups) do
    p:draw()
  end

  for i, a in pairs(actives) do
    i = (i - 1) * 2
    w = (a.remaining / a.powerup.duration) * 127
    line(0, i, w, i, a.powerup.bar_color_top)
    line(0, i+1, w, i+1, a.powerup.bar_color_bottom)
  end
end