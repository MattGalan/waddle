GAIT = 20
DOWN_FOOT_SIZE = 2
UP_FOOT_SIZE = 4
MAX_FOOTPRINTS = 5

function _init()
  px = 20
  py = 20
  angle = 20
  speed = 0.025
  slow = 1
  footprints = {}
  footprint_index = 1

  for i = 1,MAX_FOOTPRINTS do
    add(footprints, { x = -100, y = -100 })
  end

  init_powerups()
end

function _update()
end

function _draw()
  cls()

  ox = px + cos(angle) * GAIT
  oy = py + sin(angle) * GAIT

  for k,v in pairs(footprints) do
    spr(2, v.x, v.y)
  end

  spr(1, px, py)
  line(px + 2, py + 3, ox + 3, oy + 4)
  spr(0, ox, oy)

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
    footprints[footprint_index].x = px
    footprints[footprint_index].y = py
    footprint_index = footprint_index + 1

    -- wrap footprints
    if footprint_index > MAX_FOOTPRINTS then
      footprint_index = 1
    end

    px = ox
    py = oy
    angle = angle + .5
    speed = speed * -1
  end

end