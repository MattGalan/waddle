particles = class:new({
  spawn = function(_ENV, spawn_count)
    for i=1, spawn_count do
      add(parts, spawn_part())
    end
  end,

  update = function(_ENV)
    for _, p in pairs(parts) do
      update_part(p)
      p.lifespan = p.lifespan - 1
      if p.lifespan < 0 then
        del(parts, p)
      end
    end
  end,

  draw = function(_ENV)
    for _, p in pairs(parts) do
      draw_part(p)
    end
  end,
})

function init_particles()
  particleses = {}
end

function update_particles()
  for _, p in pairs(particleses) do
    p:update()
    if #p.parts == 0 then
      del(particleses, p)
    end
  end
end

function draw_particles()
  for _, p in pairs(particleses) do
    p:draw()
  end
end

function add_particles(p, spawn_count)
  p.parts = {}
  p:spawn(spawn_count)
  add(particleses, p)
end