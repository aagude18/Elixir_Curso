defmodule Greetings do
    def hello(name, greeting \\ "Hola", punctuation \\ "!") do
      "#{greeting}, #{name}#{punctuation}"
    end
  end
  
  # Llamada a la función para probar
  IO.puts Greetings.hello("Alex")