#Ejercicio 1: Categoría de Edad (if)
#Escribe una función en Elixir llamada categoria_edad/1 que reciba un número (edad) y 
#devuelva una cadena que indique la categoría a la que pertenece según las siguientes reglas:
#
#    Si la edad es menor a 13, devuelve "Niño".
#    Si la edad es entre 13 y 19 , devuelve "Adolescente".
#    Si la edad es entre 20 y 64 , devuelve "Adulto".
#    Si la edad es mayor, devuelve "Adulto Mayor".

input = IO.gets("Por favor, ingrese su edad: ")
edad = String.trim(input) |> String.to_integer()

if edad >= 0 and edad <= 12 do
  IO.puts("Eres un niño.")
else
  if edad >= 13 and edad <= 19 do
    IO.puts("Eres un adolescente.")
  else
    if edad >= 20 and edad <= 64 do
      IO.puts("Eres un adulto.")
    else
      IO.puts("Eres un adulto mayor.")
    end
  end
end