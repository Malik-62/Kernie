include("atom.jl")
include
function decay(N_0, t, lambda = 0)
    # N_0 is the initial number of atoms
    # t is the time in seconds
    # lambda is the decay constant

    if lambda == 0
        lambda = t / log(N_0)
    end

    return N_0 * exp(-lambda * t)
end

function tau_to_lambda(tau)
    # tau is the half-life of the atom
    # lambda is the decay constant
    return tau * log(2)
end

function Q_alpha(nucleus::atom)
    # Q is given by Q = (mass before - mass after) * c^2
    # mass after is the mass of the nucleus minus the mass of the alpha particle
    # for the final energy balance, the mass of the alpha has to be considered in.
    mass_before = nucleus.mass
    mass_after = atom(nucleus.N - 2, nucleus.Z - 2).mass + atom(2, 2).mass
    Q = (mass_before - mass_after)
    return Q
end