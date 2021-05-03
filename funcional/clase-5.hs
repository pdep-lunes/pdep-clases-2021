{-
Git:

git clone https://github.com/pdep-lunes/pdep-clases-2021 -> Me bajo el album de fotos
git status                                               -> "Che, como anda la escena?"
git add clase-4.hs                                       -> "Che, metete para la foto!"
git commit -m "Un mensaje expresivo"                     -> Sacamos una foto
git push origin HEAD                                     -> Subir nuestros cambios al album a Github
git pull                                                 -> Bajo los cambios del album en internet


commit -> foto
-}

import Text.Show.Functions

siguiente :: Int -> Int
siguiente unNumero = unNumero + 1

suma :: Int -> Int -> Int
suma unNumero otroNumero = unNumero + otroNumero


-- Formas de crear Funciones:
--  Definicion normal en el archivo
--  Aplicacion parcial
--  Composicion
--  Funciones anónimas / Expresiones lambda

--esBibliotecaFantasiosa biblioteca = any (\unLibro -> esDe "Christopher Paolini" unLibro) biblioteca
--esBibliotecaFantasiosa biblioteca = any esLibroFantasioso biblioteca

pam :: a -> [(a -> b)] -> [b]
pam unValor unasFunciones = map (\unaFuncion -> unaFuncion unValor) unasFunciones

aplicarAlTres :: (Int -> a) -> a
aplicarAlTres unaFuncion = unaFuncion 3

-- esLibroFantasioso unLibro = esDe "Cristopher Paolini" unLibro
-- \unLibro -> esDe "Christopher Paolini" unLibro

{-
Expresiones Lambda:
- No tenemos un buen nombre para nuestra funcion (no tiene un nombre en nuestro dominio)
- Sabemos que no la vamos a usar mas de una vez
-}

-- (* 2) :: Int -> Int
-- (+ 1) :: Int -> Int
-- abs   :: Int -> Int
-- even  :: Int -> Bool

-- Sintaxis de definición de Funciones
--
-- nombreDeLaFuncion parametro1 parametro2 parametro3 =  el valor del retorno
--
-- Sintaxis de expresiones lambda
--
-- \parametro1 parametro2 parametro3                  -> el valor del retorno

sumaDe3 :: Int -> Int -> Int -> Int
sumaDe3 numero1 numero2 numero3 = numero1 + numero2 + numero3

sumaDe3' :: (Int -> Int -> Int -> Int)
sumaDe3' = (\numero1 numero2 numero3 -> numero1 + numero2 + numero3)

sumaDe3'' :: Int -> (Int -> Int -> Int)
sumaDe3'' = (\numero1 -> (\numero2 numero3 -> numero1 + numero2 + numero3))

sumaDe3''' :: Int -> Int -> Int -> Int
sumaDe3''' = (\numero1 -> (\numero2 -> (\numero3 -> numero1 + numero2 + numero3)))

-- Currificación
-- Convertir una funcion de N parámetros en una cadena de N funciones de 1 parámetro
-- Haskell currifica las funciones automáticamente


-- even :: Int -> Bool
-- id :: a -> a
-- id even :: (Int -> Bool)


dobleDelSiguiente :: Int -> Int
dobleDelSiguiente unNumero = (doble . siguiente) unNumero
-- ^^^^^^^^^^^^^^            ^^^^^^^^^^^^^^^^^^^
--      f         unNumero =         g           unNumero
--      f                  =         g

dobleDelSiguiente' :: Int -> Int
dobleDelSiguiente' = doble . siguiente

doble unNumero = unNumero * 2
doble'         = (* 2)

numeroDeLaSuerte :: Int
numeroDeLaSuerte = 8


unaFuncion unNumero
  | unNumero > 0 = even
  | otherwise    = odd

composicion unaFuncion otraFuncion         = (\unValor -> unaFuncion (otraFuncion unValor))
--composicion unaFuncion otraFuncion unValor = unaFuncion (otraFuncion unValor)

factorial        0 = 1
factorial unNumero = unNumero * factorial (unNumero - 1)

{-
factorial 3

3 * factorial 2

3 * 2 * factorial 1

3 * 2 * 1 * factorial 0

3 * 2 * 1 * 1
-}


cabeza :: [a] -> a
cabeza (cabeza : _) = cabeza

cola :: [a] -> [a]
cola (_ : cola) = cola


largo :: [a] -> Int
largo []         = 0
largo (_ : cola) = 1 + largo cola

sumatoria :: Num a => [a] -> a
sumatoria              [] = 0
sumatoria (cabeza : cola) = cabeza + sumatoria cola

sumatoria' :: Num a => [a] -> a
sumatoria' unosNumeros = foldl (+) 0 unosNumeros

productoria :: Num a => [a] -> a
productoria              [] = 1
productoria (cabeza : cola) = cabeza * productoria cola

productoria' :: Num a => [a] -> a
productoria' unosNumeros = foldl (*) 1 unosNumeros

-- Familia fold
-- foldl
-- foldr
-- foldl1
-- foldr1

--foldl (&&) True unaListaDeBooleanos

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl'          _ semilla              [] = semilla
foldl' unaFuncion semilla (cabeza : cola) = foldl' unaFuncion (unaFuncion semilla cabeza) cola

--foldr :: (b -> a -> a) -> a -> [b] -> a

--foldl
--Asocia a izquierda
--la función que toma por parámetro recibe la semilla a la izquierda
--
--foldr
--Asocia a derecha
--la función que toma por parámetro recibe la semilla a la derecha

--foldl1 :: (a -> a -> a) -> [a] -> a

{-
foldr (++) "" ["hola", " que", " tal?"]

"hola" ++ (" que" ++ (" tal?" ++ ""))

foldl (++) "" ["hola", " que", " tal?"]

(("" ++ "hola") ++ " que") ++ " tal?"
-}

{-
git
Expresiones lambda
currificacion
recursividad
fold
-}