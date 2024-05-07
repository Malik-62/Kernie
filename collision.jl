include("atom.jl")

target = Atom.atom(8, 8)
projectile = Atom.atom(4, 6)
bq::Float64 = 1.0 #bequerel events per second


#sigma = events/s / (projectiles/s * collision center density)

# There's potential here for a full rutherford simulation.  open for later.