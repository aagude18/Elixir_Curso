#Implementa una función llamada calificacion/1 que reciba un puntaje de 0 a 100 y 
#devuelva la evaluación correspondiente según las siguientes reglas:

#    Si el puntaje está entre 90 y 100, devuelve "Excelente".
#    Si está entre 70 y 89, devuelve "Bueno".
#    Si está entre 50 y 69, devuelve "Regular".
#    Si está por debajo de 50, devuelve "Insuficiente".

numero = IO.gets("Por favor, ingrese un número: ")
nota = String.trim(numero) |> String.to_integer()

defmodule Calificador do
  def calificacion(nota) do
    if nota >= 90 and nota <= 100 do
      "Excelente"
    else
      if nota >= 70 and nota <= 89 do
        "Bueno"
      else
        if nota >= 50 and nota <= 69 do
          "Regular"
        else
          "Insuficiente"
        end
      end
    end
  end
end

# Llamada al módulo y función para imprimir el resultado
IO.puts("La evaluación es: #{Calificador.calificacion(nota)}")