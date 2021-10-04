class Simulador {
  const nombre
  const edad
  var dinero
  
  // cuando un integrante es registrado (sin importar el tipo) recibe un primer pago igual al que les corresponde por cada operativo
  method initialize() {
    self.cobrar()
  }
  
  // cada vez que un integrante termina un operativo cobra cierta cantidad de dinero
  method cobrar() {
    dinero += self.cuantoCobra()
  }
  
  // que por defecto es $5000
  method cuantoCobra() {
    return 5000
  }
  
  method puedeSimular()
}

class Planificador inherits Simulador {
  var requisitos = ["código penal", "biografías de pintores", "muebles de pino", "velador", "ñoquis de espinaca", "vino tinto merlot", "vinilos", "fuego"]
  const tieneFuego = false
  
  // cada planificador va a saber quienes son los extras que están a su disposición
  const extras = #{}
  
  // los planificadores reciben dos de estos pagos al ser registrado
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
  
  // los técnicos reciben $2000 por cada equipamiento adquirido
  override method cuantoCobra() {
    return 2000 * equipamientoAdquirido.size()
  }
  
  override method puedeSimular() {
    return equipamientoPendiente.isEmpty()
  }  
}

class Investigador inherits Simulador {
  // los investigadores reciben 20% más que sus compañeros
  override method cuantoCobra() {
    return super() * 1.2
  }
  
  override method puedeSimular() {
    return true
  }  
}
