# VARIABLES, TIPOS Y OPERACIONES

# using Pkg
# # Pkg.activate("/home/ben/Dropbox/Documents/Numericos/JuliaLinux/JuliaEnvironments/HP/cadi24")
# Pkg.activate("/home/ben/Dropbox/Documents/Numericos/JuliaLinux/JuliaEnvironments/Dell/cadi24")


## Existen distintos tipos de datos en Julia, por ejemplo: Char, Int64, Float64, ...
y = 7
typeof(y)
x = "CADI"
typeof(x)
w = 2.5
y + z   # z no está definido :c
y + x   # no está definida esa operación para los tipos de variables usados
y + w   # La operación suma está definida para enteros y floats


## Nombre de variables
current_time = 0.7
α = 1.7
β = 2 # como hemos visto, los comentarios se agregan con #
print(β) # se puede usar tambien println()
print("El valor de es $(α)")


## Sistema de tipos
r = 10
println(typeof(r))
r = "Hola"
println(typeof(r))   # El sistema de tipos es dinamico


## Podemos definir el tipo con la sintaxis variable::tipo
a::Int64 = 10
print(a)
a = "Hola"


# - Por lo general, el tipo de una variable puede cambiar en Julia, pero esto puede afectar el rendimiento en la ejecución.
# - De manera natural, Julia infiere el tipo de las variables.
# - Es recomendable escribir código estable en tipo.


## Conversión de variables
# Para convertir el tipo de variable usamos la siguiente instrucción **Type(Var)**
Float64(3)
Int64("Hola")


## Las funciones matemáticas típicas se encuentran disponibles
# Probemos con sqrt(), exp(), log(), sin(), cos(), rand()... 
a1 = pi
b1 = cos(a1)
b2 = exp(1.0)


# - En la documentación encontrarás más funciones.
# - Algunas funciones especiales están implementadas en Pkgs que veremos más adelante (por ejemplo **GSL.jl**).


## El manejo de números complejos está bien soportado
# Las operaciones elementales como abs(), real(), imag(), exp(), están definidas para cantidades complejas.
z1 = 4.0 + im*3.0
typeof(z1)
abs(z1), abs2(z1)
real(z1), imag(z1)


## Tipo de dato **Char**
#Un caracter (individual) corresponde a un **Char**
caracterA = 'ϵ'
typeof(caracterA)
Int16(caracterA)
bitstring(Int(caracterA))


# Podemos hacer algo similar en la "dirección" opuesta.
Char(945)


## Tipo de dato **String**
# Un **String** consiste en un arreglo de caracteres.
palabra = "Tecnologico"
palabra[1]


## Manejo de arreglos y rangos
rangoA = 0:10
typeof(rangoA)

for ii = 1:5  # ii in 1:5   --> podemos iterar a lo largo de un rango
	println(ii)
end

crA = collect(rangoA)
typeof(crA)


#- En general, el formato de un arreglo es **Array{Tipo, n}**, donde n es el número de dimensiones.
arr = [1.2, 2.2, 3.5]


## En ocasiones es recomendable inicializar arreglos
# - Tenemos varias opciones
arr1 = zeros(10)
typeof(arr1)
arr2 = Array{Float64}(undef, 10)
typeof(arr2)
arr3 = Float64[]
typeof(arr3)
push!(arr3, 1.0)
arr4 = []
typeof(arr4)


## Las principales características de un arreglo son dadas por las siguientes funciones
# - Tipo de los elementos:  **eltype(arr)**
# - Número de elementos:  **length(arr)**
# - Número de dimensiones:  **ndims(arr)**
# - Número de elementos por dimensión:  **size(arr)**

arr5 = [1  2  3  4; 
		5  6  7  8;
		9 10 11 12]
typeof(arr5)
eltype(arr5)
length(arr5)
ndims(arr5)
size(arr5)


# ## Indexado de arreglos
# - Usamos **[ ]** para acceder a elementos dentro de un arreglo.
# - El operador **:** nos ayuda a generar rangos, los cuales podemos usar para accesar a un conjunto de elementos en un arreglo.

c1 = rand(10,5) # Esto genera una matriz aleatoria de 10x3 elementos
c1[4,3] # [renglon, columna]
c1[3,:] # Que tipo de arreglo es?
c1[:,2] # Que tipo de arreglo es?
c1[3:6,2:5]


## Otras funciones comunes para arreglos
aa = collect(1:7)
bb = [100, 200, 300]
aa[:]
bb[:]
[aa; bb]  # Esto concatena ambos vectores


## Existe otra opción usando **append!()**
cc = collect(1:7)
dd = [100, 200, 300]
append!(cc,dd)   # Notemos el uso del símbolo !


## Operaciones por elemento -- Operador **.** 
x1 = collect(0.0:pi/4:2pi)
x1 + 5.0  # Esta operación no está bien definida
x1 .+ 5.0
sin(x1)  # Mismo caso para otra funciones matemáticas (más adelante retomaremos esto...)
sin.(x1)