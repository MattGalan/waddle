function _init()
  init_powerups()
  init_player()
end

function _update()
  update_player()
  update_powerups()
end

function _draw()
  cls()
  draw_player()
  draw_powerups()
end