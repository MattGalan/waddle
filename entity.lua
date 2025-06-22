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
      pos.x + hitbox.left < other.pos.x + other.hitbox.right and
      pos.x + hitbox.right > other.pos.x + other.hitbox.left and
      pos.y + hitbox.top > other.pos.y + other.hitbox.bottom and
      pos.y + hitbox.bottom < other.pos.y + other.hitbox.top
    )
  end,
})