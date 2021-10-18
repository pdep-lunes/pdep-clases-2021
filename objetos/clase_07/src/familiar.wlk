import errores.*

class Beth {
  var afectoPorRick
  
  method puedeIrseDeAventuras() {
    return true
  }  
  
  method irDeAventurasCon(unRick) {
    afectoPorRick += 10
    unRick.tranqulizar(20)
  }
}

class Summer inherits Beth {
  method esMiercoles() {
    return new Date().dayOfWeek() == monday 
  }
  
  override method irDeAventurasCon(unRick) {
    if(!self.esMiercoles()) throw new NoPuedoIrDeAventurasException(message = "Solo puedo ir de aventuras los miercoles")
    
    
    super(unRick)
  }
}

class Morty {
  var saludMental
  
  method puedeIrseDeAventuras() {
    return true
  }
  
  method irDeAventurasCon(unRick) {
    saludMental -= 30
    unRick.enloquecer(50)
  }
}

object jerry {
  method puedeIrseDeAventuras() {
    return false  
  } 
  
  method irDeAventurasCon(unRick) {
    throw new NoPuedoIrDeAventurasException(message = "Soy muy tonto y no me da para ir de aventuras!")
  }
}