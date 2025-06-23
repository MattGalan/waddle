point = class:new({
  __add = function(a,b)
    return point:new({ x = a.x + b.x, y = a.y + b.y })
  end,

  __sub = function(a,b)
    return point:new({ x = a.x - b.x, y = a.y - b.y })
  end,

  copy = function(_ENV)
    return point:new({ x = x, y = y })
  end
})

rect = class:new({
  overlaps = function(other)
    return (
      left < other.right and
      right > other.left and
      top > other.bottom and
      bottom < other.top
    )
  end
})
