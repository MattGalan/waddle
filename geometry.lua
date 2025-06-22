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
