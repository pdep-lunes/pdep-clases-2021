% BASE DE CONOCIMIENTOS

escribio(elsaBornemann, socorro).
escribio(neilGaiman, sandman).
escribio(alanMoore, watchmen).
escribio(brianAzarello, cienBalas).
escribio(warrenEllis, planetary).
escribio(frankMiller, elCaballeroOscuroRegresa).
escribio(frankMiller, batmanAnioUno).
escribio(neilGaiman, americanGods).
escribio(neilGaiman, buenosPresagios).
escribio(terryPratchett, buenosPresagios).
escribio(isaacAsimov, fundacion).
escribio(isaacAsimov, yoRobot).
escribio(isaacAsimov, elFinDeLaEternidad).
escribio(isaacAsimov, laBusquedaDeLosElementos).
escribio(joseHernandez, martinFierro).
escribio(stephenKing, it).
escribio(stephenKing, misery).
escribio(stephenKing, carrie).
escribio(stephenKing, elJuegoDeGerald).
escribio(julioCortazar, rayuela).
escribio(jorgeLuisBorges, ficciones).
escribio(jorgeLuisBorges, elAleph).
escribio(horacioQuiroga, cuentosDeLaSelva).
escribio(horacioQuiroga, cuentosDeLocuraAmorYMuerte).



% Si es cierto que alguien escribió determinada obra.
% Quién/es escribieron una obra.
% Qué obra/s escribió cierta persona.
% Si es cierto que cierta persona escribió alguna obra, sin importar cuál.
% Si es cierto que cierta obra existe.

% Queremos agregar la información de cuáles de las obras son cómics. 
%Por ejemplo, quiero preguntar si sandman es un cómic.

esComic(sandman).
esComic(cienBalas).
esComic(watchmen).
esComic(planetary).
esComic(elCaballeroOscuroRegresa).
esComic(batmanAnioUno).

% Queremos saber si alguien es artista del noveno arte: 
% lo es cuando escribió algún cómic.

/* esArtistaDelNovenoArte(neilGaiman).
esArtistaDelNovenoArte(alanMoore). */

% r <= p ^ q
esArtistaDelNovenoArte(Artista):-
    esComic(Obra),
    escribio(Artista,Obra).

  % Variable: libre.
  % Variable: ligada o unificada.

/*
1. Queremos saber si determinada obra es un best-seller, es decir, si tiene más de 50.000 copias vendidas.
2. Queremos saber si es reincidente un/a autor/a, que es cuando escribió más de una obra.
3.  Queremos saber si conviene contratar a un/a artista, que es cuando es reincidente o escribió un bestseller.
4. Queremos saber si a gus le gusta una obra. A Gus le gusta todo lo que escribió Asimov y sandman.
5. Queremos saber si una obra es rioplatense, que es cuando la nacionalidad de su autor/a es Uruguay o Argentina.
6. Ver si es un libro: cuando fue escrito pero no es cómic
*/

% copiasVendidas(Obra,Cantidad)
copiasVendidas(socorro, 10000).
copiasVendidas(sandman, 20000).
copiasVendidas(watchmen, 30000).
copiasVendidas(cienBalas, 40000).
copiasVendidas(planetary, 50000).
copiasVendidas(elCaballeroOscuroRegresa, 60000).
copiasVendidas(batmanAnioUno, 70000).
copiasVendidas(americanGods, 80000).
copiasVendidas(buenosPresagios, 90000).
copiasVendidas(buenosPresagios, 10000).
copiasVendidas(fundacion, 20000).
copiasVendidas(yoRobot, 30000).
copiasVendidas(elFinDeLaEternidad, 30000).
copiasVendidas(laBusquedaDeLosElementos, 40000).
copiasVendidas(martinFierro, 50000).
copiasVendidas(it, 60000).
copiasVendidas(it, 70000).
copiasVendidas(misery, 70000).
copiasVendidas(carrie, 80000).
copiasVendidas(elJuegoDeGerald, 90000).
copiasVendidas(rayuela, 10000).
copiasVendidas(ficciones, 20000).
copiasVendidas(elAleph, 30000).
copiasVendidas(cuentosDeLaSelva, 40000).
copiasVendidas(cuentosDeLocuraAmorYMuerte, 50000).

esBestSeller(Obra) :-
    copiasVendidas(Obra, Cantidad),
    Cantidad > 50000.

esReincidente(Autore) :-
    escribio(Autore, UnaObra),
    escribio(Autore, OtraObra),
    UnaObra \= OtraObra.

convieneContratar(Artista) :-
    esReincidente(Artista).

convieneContratar(Artista) :-
    escribio(Artista, Obra),
    esBestSeller(Obra).

leGustaAGus(Obra) :-
    escribio(isaacAsimov, Obra).

leGustaAGus(sandman).

esLibro(Obra) :-
    esObra(Obra),
    not(esComic(Obra)).

esObra(Obra) :-
    escribio(_, Obra).



% 5. Queremos saber si una obra es rioplatense, que es cuando la nacionalidad de su autor/a es Uruguay o Argentina.

nacioEn(horacioQuiroga, uruguay).
nacioEn(jorgeLuisBorges, argentina).
nacioEn(neilGaiman, inglaterra).


esAutorRioPlatense(Autor):-
    nacioEn(Autor,argentina).

esAutorRioPlatense(Autor):-
    nacioEn(Autor,uruguay).

esObraRioplatense(Obra):-
    escribio(Autor,Obra),
    esAutorRioPlatense(Autor).




% soloEscribioComics/1 nos responde si todas las obras que alguien escribió son cómics.

%∃x / p(x) => q(x)
%∀x / p(x) => q(x)

escribioAlgunComic(Autor):-
    escribio(Autor,Obra),
    esComic(Obra).

%forall(px, qx)
%forall(antecedente,consecuente)

soloEscribioComics(Autor):-
    escribio(Autor,_),
    forall(escribio(Autor,Obra),esComic(Obra)).


/* tenemos diferentes tipos de obras. 
Novelas de las cuales sabemos si es de terror, drama, suspenso, etc y su cantidad de capitulos
libro de cuentos de los cuales sabemos la cantidad de cuentos que tiene
cientificos de los cuales sabemos la materia de la que es
best sellers de los cuales sabemos el precio total de la obra y la cantidad de paginas
 */

%functores de tipo de libro
%novela(Genero, CantidadDeCapitulos)
%libroDeCuentos(CantidadDeCuentos)
%cientifico(Disciplina)
%bestSeller(PrecioTotal, CantidadDePaginas)
%fantastica(ElementosMágicos)

%esDeTipo(obra,tipo)
esDeTipo(it, novela(terror, 11)).
esDeTipo(cuentosDeLaSelva, libroDeCuentos(10)).
esDeTipo(elUniversoEnUnaTabla, cientifico(quimica)).
esDeTipo(elUltimoTeoremaDeFermat, cientifico(matematica)).
esDeTipo(yoRobot, bestSeller(700,253)).
esDeTipo(sandman, fantastica([yelmo, bolsaDeArena, rubi])).

/*estaBuena/1 nos dice cuando una obra está buena. Esto sucede cuando:
- Es una novela policial y tiene menos de 12 capítulos.
- Es una novela de terror.
- Los libros con más de 10 cuentos siempre son buenos.
- Es una obra científica de fisicaCuantica.
- Es un best seller y el precio por página es menor a $50.
 */


%SOLUCIÓN 1, No está bien porque repite la lógica de esDeTipo
/*estaBuena(Obra):-
    esDeTipo(Obra,novela(terror, _)).

estaBuena(Obra):-
    esDeTipo(Obra,novela(policial, Capitulos)),
    Capitulos<12.

estaBuena(Obra):-
    esDeTipo(Obra,libroDeCuentos(Capitulos)),
    Capitulos>10.

estaBuena(Obra):-
    esDeTipo(Obra,cientifico(fisicaCuantica)).

estaBuena(Obra):-
    esDeTipo(Obra,bestSeller(PrecioPorPagina,_)),
    PrecioPorPagina < 50.*/


%En cambio deberíamos hacerla de la siguiente manera para salvar esa repetición de lógica:
estaBuena(Obra):-
    esDeTipo(Obra , TipoDeObra),
    tipoDeObraBueno(TipoDeObra).

tipoDeObraBueno(novela(terror , _)).

tipoDeObraBueno(novela(policial , Capitulos)):-
    Capitulos<12.

tipoDeObraBueno(libroDeCuentos(CantidadDeCuentos)):-
    CantidadDeCuentos>10.

tipoDeObraBueno(cientifico(fisicaCuantica)).

tipoDeObraBueno(bestSeller(PrecioTotal , CantidadDePaginas)):-
    PrecioTotal / CantidadDePaginas < 50.


/* cantidadDePaginas/2 relaciona a una obra con su cantidad de páginas:
- las novelas tienen 20 páginas por capítulo;
- los libros de cuentos 5 páginas por cuento;
- las obras científicas tienen siempre 1000 páginas;
- de los best sellers ya sabemos su cantidad de páginas.
*/

cantidadDePaginas(Obra,CantidadDePaginas):-
    esDeTipo(Obra , Tipo),
    paginasPorTipo(Tipo, CantidadDePaginas).

paginasPorTipo(novela(_, Capitulos), CantidadDePaginas):-
    CantidadDePaginas is Capitulos * 20.

paginasPorTipo(libroDeCuentos(Cuentos), CantidadDePaginas):-
    CantidadDePaginas is Cuentos * 5.

paginasPorTipo(cientifico(_),1000).

paginasPorTipo(bestSeller(_,CantidadDePaginas), CantidadDePaginas).


% Queremos saber el puntaje de un autor, este se calcula como `3 * cantidad de obras best seller que escribió. Recordemos que ya tenemos un predicado esBestSeller

tienePuntaje(Autor, Puntaje) :-
    cantidadObrasBestSellerQueEscribio(Autor, Cantidad),
    Puntaje is 3 * Cantidad.

escribioBestSeller(Autor, Obra) :- 
    escribio(Autor, Obra),
    esBestSeller(Obra).

cantidadObrasBestSellerQueEscribio(Autor, Cantidad) :-
    obrasBestSellerQueEscribio(Autor, BestSellers),
    length(BestSellers, Cantidad).

obrasBestSellerQueEscribio(Autor, BestSellers) :-
    escribio(Autor,_),
    findall(Obra, escribioBestSeller(Autor, Obra), BestSellers).

% Ahora queremos saber también qué best sellers le gustan a Gus

obrasBestSellerQueLeGustanAGus(Obras) :-
    findall(Obra, leGustaAGusBestSeller(Obra), Obras).

leGustaAGusBestSeller(Obra):-
    leGustaAGus(Obra), 
    esBestSeller(Obra).


% se incorpora un nuevo tipo de obra: fantastica(ElementosMágicos)
% queremos ver si la obra de tipo fantástica es copada. Esto ocurre cuando uno de sus elementos es un rubi.
% por ejemplo agregamos a nuestra base de conocimientos: esDeTipo(sandman, fantastica([yelmo, bolsaDeArena, rubi])).

esTipoCopado(fantastica(ElementosMagicos)) :-
    member(rubi,ElementosMagicos).

ventasDeUnaObraDeUnAutor(Autor,Cantidad):-
    escribio(Autor,Obra),
    copiasVendidas(Obra,Cantidad).


% Por último, queremos saber el promedio de copias que vendió un autor.

promedioCopiasVendidas(Autor, Promedio):-
    escribio(Autor,_),
    findall(Copias,ventasDeUnaObraDeUnAutor(Autor,Copias),ListaDeCopias),
    length(ListaDeCopias, Cantidad),
    sum_list(ListaDeCopias, TotalDeCopiasVendidas),
    Promedio is TotalDeCopiasVendidas / Cantidad.
