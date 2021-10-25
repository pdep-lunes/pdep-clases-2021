import errores.ElJuegoNoExisteException

object gameflix {
  const juegos = []
  const usuarios = []
  
  method juegosDeCategoria(unaCategoria) {
    return juegos.filter({ unJuego => unJuego.esDeCategoria(unaCategoria) })
  }
	
  method juegoDeNombre(unNombre) {
    return juegos.findOrElse({ unJuego => unJuego.seLlama(unNombre) }, { throw new ElJuegoNoExisteException() })
  }
  
  method juegoRecomendado() {
    return juegos.anyOne()
  }
  
  method cobrarSuscripciones() {
    usuarios.map { unUsuario => unUsuario.pagarSuscripcion() }
  }
}
