#Ejercicio 1: Categoría de Edad (if)
#Escribe una función en Elixir llamada categoria_edad/1 que reciba un número (edad) y 
#devuelva una cadena que indique la categoría a la que pertenece según las siguientes reglas:
#
#    Si la edad es menor a 13, devuelve "Niño".
#    Si la edad es entre 13 y 19 , devuelve "Adolescente".
#    Si la edad es entre 20 y 64 , devuelve "Adulto".
#    Si la edad es mayor, devuelve "Adulto Mayor".

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