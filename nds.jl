using DataFrames, CSV, DelimitedFiles

lines = readlines("/Users/mamajjou/Developer/Kernie/nds-iaea.txt")

# Create an empty DataFrame to store the data
data = DataFrame(NmZ = Int[], N = Int[], Z = Int[], A = Int[], El = String[], Mass_Excess = Float64[], Binding_Energy = Float64[], Beta_decay_Energy = Float64[], AMU = Float64[])

# Loop through the lines and extract the data
for n in 37:3594
    nth_line = lines[n]
    local NmZ = parse(Int, match(r"\s*([-+]?\d+)", nth_line[2:5]).captures[1])
    local N = parse(Int, match(r"\s*(\d+)", nth_line[5:9]).captures[1])
    local Z = parse(Int, match(r"\s*(\d+)", nth_line[10:14]).captures[1])
    local A = parse(Int, match(r"\s*(\d+)", nth_line[15:19]).captures[1])
    local El = match(r"\s*([A-Za-z]+)", nth_line[20:23]).captures[1]
    local Mass_Excess = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[28:42]).captures[1])
    local Binding_Energy = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[58:72]).captures[1])
    local Beta_decay_Energy::Float32
    try
        Beta_decay_Energy = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[80:94]).captures[1])
    catch
        Beta_decay_Energy = 0.0
    end
    local AMU = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[110:123]).captures[1])
    
    # Append the extracted data to the DataFrame
    push!(data, (NmZ = NmZ, N = N, Z = Z, A = A, El = El, Mass_Excess = Mass_Excess, Binding_Energy = Binding_Energy, Beta_decay_Energy = Beta_decay_Energy, AMU = AMU))
end

# Write the DataFrame to a CSV file
CSV.write("/Users/mamajjou/Developer/Kernie/nds_data.csv", data)
