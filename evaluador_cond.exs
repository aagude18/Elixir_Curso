numero = IO.gets("Por favor, ingrese un nùmero: ")
#IO.puts("La edad que ingreso es: #{String.trim(input)}")
num = String.trim(numero) |> String.to_integer()

defmodule Evaluador do 
    def evaluar_numero(num) do
        cond do 
            num > 0 -> "El nùmero es Positivo"
            num < 0 -> "El nùmero es Negativo"
            true -> "El nùmero es Cero"
        end
    end
end 

IO.puts(Evaluador.evaluar_numero(num))