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
      x + hitbox.left < other.x + other.hitbox.right and
      x + hitbox.right > other.x + other.hitbox.left and
      y + hitbox.top > other.y + other.hitbox.bottom and
      y + hitbox.bottom < other.y + other.hitbox.top
    )
  end,
})