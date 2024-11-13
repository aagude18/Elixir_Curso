defmodule CajaRegistradora do
  @productos %{ 1 => {"Manzana", 500}, 2 => {"Banano", 300}, 3 => {"Naranja", 700}, 4 => {"Leche", 2500}, 5 => {"Pan", 1200}}

  # Función principal para iniciar la caja registradora
  def iniciar do
    IO.puts ("\nBienvenido a la Caja Registradora.\n\nProductos disponibles:\n")
    mostrar_productos()
    total = procesar_compra(0, %{})
    IO.puts("\nTotal a pagar: $#{total}")
  end

  # Muestra los productos disponibles junto con sus códigos
  def mostrar_productos do
    Enum.each(@productos, fn {codigo, {nombre, precio}} ->
      IO.puts("#{codigo}. #{nombre}: $#{precio}")
    end)
  end

  # Función recursiva para procesar la compra y permitir eliminar productos
  defp procesar_compra(total, historial) do
    input = String.trim(IO.gets("\nSeleccione el código del producto, 'eliminar' para quitar uno, 'estado' para ver la compra o 'fin' para terminar: "))

    cond do
      input == "fin" ->
        total

      input == "estado" ->
        mostrar_estado(historial, total)
        procesar_compra(total, historial)

      input == "eliminar" and map_size(historial) > 0 ->
        mostrar_estado(historial, total)
        codigo = String.trim(IO.gets("\nIngrese el código del producto a eliminar: ")) |> String.to_integer()
        eliminar_producto(codigo, total, historial)

      input == "eliminar" and map_size(historial) == 0 ->
        IO.puts("No hay productos para eliminar.")
        procesar_compra(total, historial)

      es_entero?(input) and Map.has_key?(@productos, String.to_integer(input)) ->
        {nombre, precio} = @productos[String.to_integer(input)]
        nuevo_historial = agregar_producto(historial, String.to_integer(input), {nombre, precio})
        IO.puts("Añadido #{nombre}: $#{precio}")
        procesar_compra(total + precio, nuevo_historial)

      true ->
        IO.puts("Entrada no válida. Intente de nuevo.")
        procesar_compra(total, historial)
    end
  end

  # Agrega el producto al historial, actualizando cantidades si ya existe
  defp agregar_producto(historial, codigo, {nombre, precio}) do
    Map.update(historial, codigo, {nombre, precio, 1}, fn {n, p, c} -> {n, p, c + 1} end)
  end

  # Muestra el estado actual de la compra con códigos, productos, cantidades y subtotales, y el total acumulado
  defp mostrar_estado(historial, total) do
    IO.puts("\nEstado de la compra:")
    Enum.each(historial, fn {codigo, {nombre, precio, cantidad}} ->
      subtotal = precio * cantidad
      IO.puts("Código: #{codigo} | #{nombre} - Cantidad: #{cantidad}, Precio Unitario: $#{precio}, Subtotal: $#{subtotal}")
    end)
    IO.puts("Total acumulado: $#{total}")
  end

  # Elimina un producto del historial y actualiza el total
  defp eliminar_producto(codigo, total, historial) do
    case Map.fetch(historial, codigo) do
      :error ->
        IO.puts("Código no encontrado en el historial.")
        procesar_compra(total, historial)

      {:ok, {nombre, precio, cantidad}} ->
        IO.puts("Eliminado #{nombre}: -$#{precio}")
        nuevo_historial =
          if cantidad > 1 do
            Map.put(historial, codigo, {nombre, precio, cantidad - 1})
          else
            Map.delete(historial, codigo)
          end
        procesar_compra(total - precio, nuevo_historial)
    end
  end

  # Verifica si el input es un número entero válido
  defp es_entero?(input) do
    case Integer.parse(input) do
      :error -> false
      {_num, ""} -> true
    end
  end
end

# Ejecuta la caja registradora
CajaRegistradora.iniciar()
