MAX_FOOTPRINTS = 5
FOOT_WIDTH = 8
FOOT_HEIGHT = 7

function init_player()
  angle = 20
  speed = 0.025
  slow = 1
  gait = 20
  footprints = {}
  footprint_index = 1

  down_foot = entity:new({
    pos = point:new({ x = 20, y = 40 }),
    sprite = 1,
  })

  up_foot = entity:new({
    pos = point:new({ x = 0, y = 0 }),
    sprite = 0,
    hitbox = {
      width = 8,
      height = 7
    }
  })

  for i = 1,MAX_FOOTPRINTS do
    add(footprints, entity:new({
      pos = { x = -100, y = -100 },
      sprite = 2
    }))
  end
end

function update_player()
  up_foot.pos.x = down_foot.pos.x + cos(angle) * gait
  up_foot.pos.y = down_foot.pos.y + sin(angle) * gait
end

function draw_player()
  for k,v in pairs(footprints) do
    v:draw()
  end

  down_foot:draw()
  foot_above = up_foot.pos.y < down_foot.pos.y

  if (foot_above) then up_foot:draw() end

  line(
    down_foot.pos.x + 2,
    down_foot.pos.y + 3,
    up_foot.pos.x + 3,
    up_foot.pos.y + 4
  )

  if (not foot_above) then up_foot:draw() end

  if btn(4) then
    angle = angle + speed * 0.4
  else
    angle = angle + speed
  end

  -- wrap around
  if angle > 1 then
    angle = angle - 1
  elseif angle < 0 then
    angle = angle + 1
  end

  -- switch feet
  if btnp(5) then
    -- make footprint
    footprints[footprint_index]:copy_pos(down_foot)
    footprint_index = footprint_index + 1

    -- wrap footprints
    if footprint_index > MAX_FOOTPRINTS then
      footprint_index = 1
    end

    down_foot:copy_pos(up_foot)
    angle = angle + .5
    speed = speed * -1
  end

  draw_powerups()
end