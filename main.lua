function _init()
  init_powerups()
  init_player()
  init_floating_text()
  init_particles()
end

function _update()
  update_player()
  update_powerups()
  update_floating_text()
  update_particles()
end

function _draw()
  cls()
  draw_particles()
  draw_player()
  draw_powerups()
  draw_floating_text()
end