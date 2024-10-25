input = IO.gets("Por favor, ingrese su edad: ")
#IO.puts("La edad que ingreso es: #{String.trim(input)}")
edad = String.trim(input) |> String.to_integer()

cond do 
    edad >= 0 and edad <=12 ->
        IO.puts("Eres un niño.")
    edad >= 13 and edad <=19 ->
        IO.puts("Eres un adolecente.")
    edad >= 20 and edad <=64 ->
        IO.puts("Eres un adulto.")
    true ->
        IO.puts("Eres un adulto mayor.")
end