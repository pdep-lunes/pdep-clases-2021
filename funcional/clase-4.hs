import Text.Show.Functions

unEntero :: Int
unEntero = 5

unFlotante :: Float
unFlotante = 3.14

autorDeElVisitante :: String
autorDeElVisitante = "Stephen King"

hojasDeElVisitante :: Int
hojasDeElVisitante = 592

-- data! (Sin Record Syntax)
data Libro' = UnLibro' String String Int

-- data (con Record Syntax)
data Libro = UnLibro {
  titulo            :: String,
  autor             :: String,
  cantidadDePaginas :: Int
} deriving (Eq, Show)

elVisitante :: Libro
elVisitante = UnLibro "El Visitante" "Stephen King" 592

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = UnLibro "Shingeki no Kyojin 1" "Hajime Isayama" 30

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = UnLibro "Shingeki no Kyojin 3" "Hajime Isayama" 30

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = UnLibro "Shingeki no Kyojin 27" "Hajime Isayama" 30

fundacion :: Libro
fundacion = UnLibro "Fundacion" "Isaac Asimov" 230

sandman5 :: Libro
sandman5 = UnLibro "sandman5" "Neil Gaiman" 35

sandman10 :: Libro
sandman10 = UnLibro "sandman10" "Neil Gaiman" 35

sandman12 :: Libro
sandman12 = UnLibro "sandman12" "Neil Gaiman" 35

eragon :: Libro
eragon = UnLibro "eragon" "Christopher Paolini" 544

eldest :: Libro
eldest = UnLibro "eldest" "Christopher Paolini" 704

brisignr :: Libro
brisignr = UnLibro "brisignr" "Christopher Paolini" 700

legado :: Libro
legado = UnLibro "legado" "Christopher Paolini" 811

type Biblioteca = [Libro]

miBiblioteca :: Biblioteca
miBiblioteca = [elVisitante, shingekiNoKyojin1, shingekiNoKyojin3, shingekiNoKyojin27, fundacion, sandman5, sandman10, sandman12, eragon, eldest, brisignr, legado]

listaDesordenada = [8, 5, 4]

--listaOrdenada = ordenar listaDesordenada

--ordenar :: Ord a => [a] -> [a]

--type String = [Char]

unString :: String
unString = "hola"

otroString :: [Char]
otroString = "hola"

vocales :: [Char]
vocales = "aeiouAEIOU"

length' :: [a] -> Int
length' unaLista = length unaLista

elem' :: Eq a => a -> [a] -> Bool
elem' unValor unaLista = elem unValor unaLista

concat' :: [[a]] -> [a]
concat' unaListaDeListas = concat unaListaDeListas

tail' :: [a] -> [a]
tail' unaLista = tail unaLista

head' :: [a] -> a
head' unaLista = head unaLista

-- Pattern matching!

--autor :: Libro -> String
--autor (_, autor, _) = autor
--
--titulo :: Libro -> String
--titulo (titulo, _, _) = titulo

--(String, Bool)
--(String, Bool, String)

--Valores
--Tipos
--Patrones

--nombreDeLaFuncion :: Mundo de los Tipos
--nombreDeLaFuncion Mundo de los patrones = Mundo de los valores

--cantidadDeLibros :: Biblioteca -> Int
--cantidadDeLibros unaBiblioteca = length unaBiblioteca
-- Sobredelegacion

--cantidadDePaginas :: Libro -> Int
--cantidadDePaginas (_, _, paginas) = paginas

promedioDePaginas :: Biblioteca -> Int
promedioDePaginas unaBiblioteca = div (cantidadDePaginasTotales unaBiblioteca) (length unaBiblioteca)

cantidadDePaginasTotales :: Biblioteca -> Int
cantidadDePaginasTotales unaBiblioteca = sum . map cantidadDePaginas $ unaBiblioteca

-- Aplicacion prefija
-- (.)
-- ($)

-- [a]

--sum :: Num a => [a] -> a

-- siguiente . not

-- Orden superior:
--filter :: (a -> Bool) -> [a] -> [a]
--map    :: (a -> b)    -> [a] -> [b]


siguiente unNumero = unNumero + 1

esDeStephenKing :: Libro -> Bool
esDeStephenKing unLibro = esDe "Stephen King" unLibro

esDe :: String -> Libro -> Bool
esDe unAutor (UnLibro _ autorDelLibro _) = autorDelLibro == unAutor

esLecturaObligatoria :: Libro -> Bool
esLecturaObligatoria unLibro = esDeStephenKing unLibro || esFundacion unLibro || esDeLaSagaDeEragon unLibro

esFundacion :: Libro -> Bool
esFundacion unLibro = unLibro == fundacion

esDeLaSagaDeEragon :: Libro -> Bool
esDeLaSagaDeEragon unLibro = elem unLibro sagaDeEragon

type Saga = [Libro]

sagaDeEragon :: Saga
sagaDeEragon = [eragon, eldest, brisignr, legado]

esLecturaObligatoria' :: Libro -> Bool
esLecturaObligatoria' (UnLibro           _ "Stephen King"   _) = True
esLecturaObligatoria' (UnLibro "Fundacion" "Isaac Asimov" 230) = True
esLecturaObligatoria' unLibroCualquiera                        = esDeLaSagaDeEragon unLibroCualquiera

-- esLecturaObligatoriaVersionDelDesaprobado :: Libro -> Bool
-- esLecturaObligatoriaVersionDelDesaprobado unLibro
--   | esDeStephenKing    unLibro         = True
--   | esFundacion        unLibro         = True
--   | esDeLaSagaDeEragon unLibro == True = True
--   | otherwise                          = False
-- ******************************************************
-- * NO usar guardas para devolver booleanos!!!!!!!!!!! *
-- ******************************************************
-- ********************************
-- * NO hacer == True !!!!!!!!!!! *
-- ********************************

esFantasiosa :: Biblioteca -> Bool
esFantasiosa unaBiblioteca = any esLibroFantasioso unaBiblioteca

esLibroFantasioso :: Libro -> Bool
esLibroFantasioso unLibro = esDe "Christopher Paolini" unLibro || esDe "Neil Gaiman" unLibro
--                               ^^^^^^^^^^^^^^^^^^^^^ unAutor         ^^^^^^^^^^^^^ unAutor

nombreDeLaBiblioteca :: Biblioteca -> String
nombreDeLaBiblioteca unaBiblioteca = sinVocales . concatenatoriaDeTitulos $ unaBiblioteca

sinVocales :: String -> String
sinVocales unString = filter (not . esVocal) unString

esVocal :: Char -> Bool
esVocal unCaracter = elem unCaracter "aeiouAEIOUÁÉÍÓÚ"

concatenatoriaDeTitulos :: Biblioteca -> String
concatenatoriaDeTitulos unaBiblioteca = concatMap titulo unaBiblioteca

esBibliotecaLigera :: Biblioteca -> Bool
esBibliotecaLigera unaBiblioteca = all esLecturaLigera unaBiblioteca

--any ¿existe alguno que cumpla con p?
--all ¿todos cumplen con p? / ¿no existe alguno que no cumpla p?

esLecturaLigera :: Libro -> Bool
esLecturaLigera unLibro = cantidadDePaginas unLibro <= 40

-- Guardas / funciones partidas
genero :: Libro -> String
genero unLibro
  | esDeStephenKing  unLibro = "Terror"
  | esDeAutorJapones unLibro = "Manga"
  | esLecturaLigera  unLibro = "Comic"
  | otherwise                = "Indeterminado"

-- abs(x):
-- |x| si x < 0
--  x  si x >= 0

esDeAutorJapones :: Libro -> Bool
esDeAutorJapones unLibro = elem (autor unLibro) autoresJaponeses

autoresJaponeses :: [String]
autoresJaponeses = ["Hajime Isayama"]

--type Persona = (String, String, Int)

--gus :: Persona
--gus = ("Gustavo", "Trucco", 29)
--
--edad :: Persona -> Int
--edad (_, _, edad) = edad
--
--esMayorDeEdad :: Persona -> Bool
--esMayorDeEdad unaPersona = edad unaPersona >= 18

cambiarElNombre :: String -> Libro -> Libro
cambiarElNombre unNombreNuevo algunLibro = UnLibro unNombreNuevo (autor algunLibro) (cantidadDePaginas algunLibro)

cambiarElNombre' :: String -> Libro -> Libro
cambiarElNombre' unNombreNuevo algunLibro = algunLibro { titulo = unNombreNuevo, cantidadDePaginas = cantidadDePaginas algunLibro + 10 }


--type Persona = (String, String, Int, [Persona])

data Persona = UnaPersona String String Int [Persona] deriving Show
