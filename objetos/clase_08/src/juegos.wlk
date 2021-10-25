class Juego {
  const nombre
  const precio
  const categoria
  
  method esDeCategoria(unaCategoria) {
    return categoria == unaCategoria
  }
  
  method seLlama(unNombre) {
    return nombre == unNombre
  }
  
  method esBarato() {
    return precio < 30
  }
}

class JuegoViolento inherits Juego {
  method serJugado(unUsuario, unasHoras) {
    unUsuario.reducirHumor(unasHoras * 10)
  }
}

class MOBA inherits Juego {
  method serJugado(unUsuario, unasHoras) {
    unUsuario.gastar(30)
  }  
}

class JuegoDeTerror inherits Juego {
  method serJugado(unUsuario, unasHoras) {
    unUsuario.tirarTodoAlCarajo()
  }  
}

class JuegoEstrategico inherits Juego {
  method serJugado(unUsuario, unasHoras) {
    unUsuario.aumentarHumor(unasHoras * 5)
  }  
}