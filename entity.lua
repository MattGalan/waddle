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
  -- hello
  -- bye
  draw = function(_ENV)
    spr(sprite, pos.x, pos.y)
  end
})