using DataFrames, CSV

struct Atom
    NmZ::Int
    N::Int
    Z::Int
    A::Int
    El::String
    Mass_Excess::Float64
    Binding_Energy::Float64
    Beta_decay_Energy::Float64
    AMU::Float64
    
    function Atom(N::Int, Z::Int)
        df = CSV.read("nds_data.csv", DataFrame)
        row = findfirst((df.N .== N) .& (df.Z .== Z))
        if row == nothing
            error("No data found for N=$N and Z=$Z")
        end
        atom_data = df[row, :]
        new(atom_data.NmZ, atom_data.N, atom_data.Z, atom_data.A, atom_data.El,
            atom_data.Mass_Excess, atom_data.Binding_Energy,
            atom_data.Beta_decay_Energy, atom_data.AMU)
    end
end
