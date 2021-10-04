class Simulador {
  const nombre
  const edad
  var dinero
  
  method initialize() {
    self.cobrar()
  }
  
  method cobrar() {
    dinero += self.cuantoCobra()
  }
  
  method cuantoCobra() {
    return 5000
  }
  
  method puedeSimular()
}

class Planificador inherits Simulador {
  var requisitos = ["código penal", "biografías de pintores", "muebles de pino", "velador", "ñoquis de espinaca", "vino tinto merlot", "vinilos", "fuego"]
  const tieneFuego = false
  const extras = #{}
  
  override method initialize() {
    super()
    super()
  }
  
  override method puedeSimular(){
    return requisitos.contains("muebles de pino")
  }
}

class Caracterizador inherits Simulador {
  const disfraces = ["NASA", "FBI", "vampiro", "fiscal", "chef", "militar"]
  const pseudonimo
  
  override method puedeSimular() {
    return pseudonimo == "Maximo Cozzetti"
  }
}

class Tecnico inherits Simulador {
  const equipamientoAdquirido = ["puma", "helicóptero", "betún"]
  const equipamientoPendiente = []
  
  override method cuantoCobra() {
    return 2000 * equipamientoAdquirido.size()
  }
  
  override method puedeSimular() {
    return equipamientoPendiente.isEmpty()
  }  
}

class Investigador inherits Simulador {
  override method cuantoCobra() {
    return super() * 1.2
  }
  
  override method puedeSimular() {
    return true
  }  
}
