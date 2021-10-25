object premium {
  method permiteJugar(unJuego) {
    return true
  }
  
  method costo() {
    return 50
  }
}

object base {  
  method permiteJugar(unJuego) {
    return unJuego.esBarato()
  }
  
  method costo() {
    return 25
  }
}

class SuscripcionCategorica {
  const categoria
  const costo
  
  method permiteJugar(unJuego) {
    return unJuego.esDeCategoria(categoria)
  }
  
  method costo() {
    return costo
  }
}

const prueba = new SuscripcionCategorica(categoria = "Demo", costo = 0)
const infantil = new SuscripcionCategorica(categoria = "Infantil", costo = 10)