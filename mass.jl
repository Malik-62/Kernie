function SEMF(N::Int, Z::Int)
    A = N + Z  # Mass number
    B = 15.67 * A  # Volume term
    S = 17.23 * A^(2/3)  # Surface term
    C = 0.714 * (Z*(Z-1) / A^(1/3))  # Coulomb term
    A1 = 93.15 * (N - Z)^2 / (4*A)  # Asymmetry term
    A2 = 11.2 * A^(-0.5)  # Pairing term
    
    # Check if the atom is even-even, odd-odd, or even-odd/odd-even
    if N % 2 == 0 && Z % 2 == 0
        mass = B - S - C - A1 - A2
    elseif N % 2 == 1 && Z % 2 == 1
        mass = B - S - C + A1 - A2
    else
        mass = B - S - C - A2
    end
    
    return mass
end