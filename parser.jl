
# Get the nth line
n = 37  # Replace with the desired line number
nth_line = lines[n]
NmZ = parse(Int, match(r"\s*([-+]?\d+)", nth_line[2:5]).captures[1])
N = parse(Int, match(r"\s*(\d+)", nth_line[5:9]).captures[1])
Z = parse(Int, match(r"\s*(\d+)", nth_line[10:14]).captures[1])
A = parse(Int, match(r"\s*(\d+)", nth_line[15:19]).captures[1])
El = match(r"\s*([A-Za-z]+)", nth_line[20:23]).captures[1]
Mass_Excess = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[28:42]).captures[1])
Binding_Energy = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[58:72]).captures[1])

#manchmal ist da ein * anstatt ein wert 
try
    Beta_decay_Energy = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[80:94]).captures[1])
catch
    Beta_decay_Energy = 0.0
end
AMU = parse(Float64, match(r"\s*([-+]?\d*\.?\d+)", nth_line[110:123]).captures[1])
