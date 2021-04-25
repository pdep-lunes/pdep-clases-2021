import Text.Show.Functions

--esMayorDeEdad :: Int -> Bool
--esMayorDeEdad unaEdad = unaEdad >= 18

dobleDelDoble :: Int -> Int
dobleDelDoble unNumero = (doble . doble) unNumero

doble :: Int -> Int
doble unNumero = unNumero * 2
--    ^^^^^^^^ parámetro

hacerActividadFisica :: Float -> Float
hacerActividadFisica unaFrecuencia = unaFrecuencia + 50

tieneTaquicardia :: Float -> Bool
tieneTaquicardia unaFrecuencia = unaFrecuencia >= 100

tieneTaquicardiaDespuesDeEntrenar :: Float -> Bool
tieneTaquicardiaDespuesDeEntrenar unaFrecuencia = tieneTaquicardia . hacerActividadFisica $ unaFrecuencia

frecuenciaCardiacaPromedio :: Float
frecuenciaCardiacaPromedio = 80

--frecuenciaCardiacaPromedio = 90
-- estalla!

frecuenciaCardiacaPromedioLuegoDeHacerActividadFisica :: Float
frecuenciaCardiacaPromedioLuegoDeHacerActividadFisica = hacerActividadFisica frecuenciaCardiacaPromedio

-- Transparencia Referencial

-- Precedencia de operadores

--unFlotante :: Float
--unFlotante = 1

identidad :: a -> a
identidad unValor = unValor

constante :: a -> b -> a
constante unValor otroValor = unValor

--suma :: Float -> Float -> Float
--suma unNumero otroNumero = unNumero + otroNumero

unEntero :: Int
unEntero = 5

otroEntero :: Int
otroEntero = 10

unFlotante :: Float
unFlotante = 5

otroFlotante :: Float
otroFlotante = 10

suma :: Num a => a -> a -> a
suma unNumero otroNumero = unNumero + otroNumero

-- Familia de tipos / Type Class

--Num
--(+)
--(-)
--(*)

--Int
--Integer
--Float
--Double

-- Fractional
--(/)

-- Integral
-- Int Integer
-- even
-- odd
-- div
-- rem

esMayorDeEdad :: Int -> Bool
esMayorDeEdad unaEdad = unaEdad >= 18


-- inmutabilidad
-- transparencia referencial
-- precedencia de operadores
-- type class