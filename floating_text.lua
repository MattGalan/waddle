function init_floating_text()
  floating_texts = {}
end

function update_floating_text()
  for _, ft in pairs(floating_texts) do
    ft.pos.y = ft.pos.y - 1
    ft.remaining = ft.remaining - 1
    ft.blink_remaining = ft.blink_remaining - 1

    if ft.blink_remaining <= 0 then
      ft.blink_remaining = 3
      ft.blink = not ft.blink
    end

    if ft.remaining <= 0 then
      del(floating_texts, ft)
    end
  end
end

function draw_floating_text()
  for _, ft in pairs(floating_texts) do
    if ft.remaining > 12 or ft.blink then
      print(ft.text, ft.pos.x, ft.pos.y, 7)
    end
  end
end

function add_floating_text(text, pos)
  add(
    floating_texts,
    {
      text = text,
      pos = pos:copy(),
      remaining = 27,
      blink = false,
      blink_remaining = 3
    }
  )
end