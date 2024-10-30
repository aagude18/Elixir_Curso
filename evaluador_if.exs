numero = IO.gets("Por favor, ingrese un nùmero: ")
#IO.puts("La edad que ingreso es: #{String.trim(input)}")
num = String.trim(numero) |> String.to_integer()

defmodule Evaluador do 
    def evaluar_numero(num) do
        if num > 0 do 
            "El nùmero es Positivo"
            else
            if num < 0 do 
            "El nùmero es Negativo"
            else
            "El nùmero es Cero"
            end
        end
    end
end 

IO.puts(Evaluador.evaluar_numero(num))