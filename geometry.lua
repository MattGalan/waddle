function new_rect(top, right, bottom, left)
  return {
    top = top,
    right = right,
    bottom = bottom,
    left = left
  }
end

function do_rects_overlap(r1, r2)
  return (
    r1.left < r2.right and
    r1.right > r2.left and
    r1.top > r2.bottom and
    r1.bottom < r2.top
  )
end