import errores.NoPuedoJugarException
import errores.NoMeAlcanzaLaPlataException
import suscripciones.prueba
import suscripciones.infantil

class Usuario {
  const nombre
  var suscripcion
  var dinero
  var humor

  method actualizarSuscripcion(nuevaSuscripcion) {
    suscripcion = nuevaSuscripcion
  }
  
  method pagarSuscripcion() {
    if (self.puedePagar(suscripcion)) {
      dinero -= suscripcion.costo()
    } else {
      self.actualizarSuscripcion(prueba)
    }
  }
  
  method puedePagarSuscripcion(unaSuscripcion) {
    return self.puedePagar(unaSuscripcion.costo())
  }
  
  method puedePagar(unaCantidad) {
    return dinero >= unaCantidad
  }
  
  method jugar(unJuego, unasHoras) {
    if (suscripcion.permiteJugar(unJuego)) {
      unJuego.serJugado(self, unasHoras)
    } else {
      throw new NoPuedoJugarException()
    }
  }
  
  method reducirHumor(unaCantidad) {
    humor -= unaCantidad
  }
  
  method aumentarHumor(unaCantidad) {
    humor += unaCantidad
  }
  
  method gastar(unaCantidad) {
    if(self.puedePagar(unaCantidad)){
      dinero -= unaCantidad
    } else {
      throw new NoMeAlcanzaLaPlataException()
    }
  }
  
  method tirarTodoAlCarajo() {
    suscripcion = infantil
  }
}
