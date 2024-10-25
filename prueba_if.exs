input = IO.gets("Por favor, ingrese su edad: ")
#IO.puts("La edad que ingreso es: #{String.trim(input)}")
edad = String.trim(input) |> String.to_integer()

if  edad >= 0 and edad <=12 do
    IO.puts("Eres un niño.")
else if edad >= 13 and edad <=19 do 
    IO.puts("Eres un adolecente.")
else if edad >= 20 and edad <=64 do 
    IO.puts("Eres un adulto.")
else
    IO.puts("Eres un adulto mayor.")
end
end
end 