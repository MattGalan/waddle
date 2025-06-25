global = _ENV

class = setmetatable({
  new = function(_ENV, tbl)
    tbl = setmetatable(tbl or {}, {
      __index = _ENV
    })

    return tbl
  end,
}, { __index = _ENV })

entity = class:new({
  draw = function(_ENV)
    spr(sprite, pos.x, pos.y)
  end,

  copy_pos = function(_ENV, other)
    pos.x = other.pos.x
    pos.y = other.pos.y
  end,

  intersects = function(_ENV, other)
    return (
      pos.x < other.pos.x + other.hitbox.width and
      pos.x + hitbox.width > other.pos.x and
      pos.y + hitbox.height > other.pos.y and
      pos.y < other.pos.y + other.hitbox.height
    )
  end,
})