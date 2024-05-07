using DataFrames, CSV, DelimitedFiles

lines = readlines("/Users/mamajjou/Developer/Kernie/nds-iaea.txt")

NmZ_array = Int[]
N_array = Int[]
Z_array = Int[]
A_array = Int[]
El_array = String[]
Mass_Excess_array = Float64[]
Binding_Energy_array = Float64[]
Beta_decay_Energy_array = Float64[]
AMU_array = Float64[]

for n in 37:3594
    nth_line = lines[n]
    push!(NmZ_array, parse(Int, match(r"\s*(\d+)", nth_line[2:5]).captures[1]))
    push!(N_array, parse(Int, match(r"\s*(\d+)", nth_line[5:9]).captures[1]))
    push!(Z_array, parse(Int, match(r"\s*(\d+)", nth_line[10:14]).captures[1]))
    push!(A_array, parse(Int, match(r"\s*(\d+)", nth_line[15:19]).captures[1]))
    push!(El_array, match(r"\s*([A-Za-z]+)", nth_line[20:23]).captures[1])
    push!(Mass_Excess_array, parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[28:42]).captures[1]))
    push!(Binding_Energy_array, parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[58:72]).captures[1]))
    push!(Beta_decay_Energy_array, parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[80:94]).captures[1]))
    push!(AMU_array, parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[110:123]).captures[1]))
end

# Create a DataFrame from the arrays
df = DataFrame(
    NmZ = NmZ_array,
    N = N_array,
    Z = Z_array,
    A = A_array,
    El = El_array,
    Mass_Excess = Mass_Excess_array,
    Binding_Energy = Binding_Energy_array,
    Beta_decay_Energy = Beta_decay_Energy_array,
    AMU = AMU_array
)

# Save the DataFrame as a CSV file
CSV.write("/Users/mamajjou/Developer/Kernie/nds.csv", df)