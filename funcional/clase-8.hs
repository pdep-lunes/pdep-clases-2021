tieneNombreLargo mascota = length (fst mascota) > 9

sumarEnergia unaPersona = unaPersona { energia = energia unaPersona + 5 }
sumarEnergia (Persona nombre energia edad intereses) = Persona nombre (energia + 5) edad intereses
sumarEnergia unaPersona = Persona (nombre unaPersona) (energia unaPersona + 5) (edad unaPersona) (intereses unaPersona)

triplicarLosPares :: [Int] -> [Int]
triplicarLosPares numeros = (map (* 3) . filter even) numeros

sonTodosMamiferos :: [Animal] -> Bool
sonTodosMamiferos animales = all esMamifero animales
sonTodosMamiferos’ animales = (and . map esMamifero) animales
sonTodosMamiferos’ animales = (all (== True) . map esMamifero) animales



abrirVentanas :: Casa -> Casa
prenderEstufa :: Casa -> Casa
encenderElAireA :: Casa -> Int -> Casa
flip encenderElAireA :: Int -> Casa -> Casa
flip encenderElAireA 24 :: Casa -> Casa
mudarseA :: String -> Casa -> Casa

miCasaInteligente = Casa
  {
    direccion = "Medrano 951",
    temperatura = 26,
    reguladoresDeTemperatura = [
      abrirVentanas :: Casa -> Casa,
      prenderEstufa :: Casa -> Casa,
      mudarseA "Medrano 952" :: Casa -> Casa,
      flip encenderElAireA 24 :: Casa -> Casa
    ]
  }

esBeatle "Ringo"  = True
esBeatle "John"   = True
esBeatle "George" = True
esBeatle "Paul"   = True
esBeatle _        = False

sumaDeLasEdadesRecursiva [] = 0
sumaDeLasEdadesRecursiva (cabeza : cola) =
   edad cabeza + sumaDeLasEdadesRecursiva cola

foldr ((+) . edad) 0 unasPersonas

(sum . map edad)

abrirVentanas casa = casa {
  temperatura = temperatura casa - 2
}
agregarValor valor indice lista =
   take indice lista ++ valor : drop indice lista

agregarValor valor indice lista =
   agregarValor' (splitAt indice lista) valor

agregarValor' (comienzo, final) valor = comienzo ++ valor : final


poneleUnNombre numeros = (sum (map (*3) (filter even numeros))) < 100

poneleUnNombre' numeros = ((< 100) . sum . map (* 3) . filter even) numeros
