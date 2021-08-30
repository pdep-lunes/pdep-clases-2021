object poroto {
  // Estado
  var energia = 100
  var edad = 5
  
  // Método que **hace**
  method jugar() {
    energia = energia - 20 // energia -= 20
  }
  
  method ladrar() {
    energia -= 5
  }
  
  // Método que **devuelve**
  method ladrido() {
  	return "Guau Guau"
  }
  
  // Getter
  method energia() {
    return energia
  }

  // Setter
  method energia(unaEnergia) {
    energia = unaEnergia
  }
}

object billy {
  var edad = 12
  var energia = 200
  var companiere = poroto
  var comidaFavorita = "Fideos"
  
  // Interfaz: jugar(), companiere(), comidaFavorita(), energia()
  method jugar() {
    energia -= 50
    companiere.jugar()
  }
  
  method companiere() {
    return companiere
  }
  
  method comidaFavorita() {
    return comidaFavorita
  }
  
  method energia() {
    return energia
  }
}

object mandy {
  var edad = 15
  var energia = 200
  var companiere = sally
  var comidaFavorita = "Fideos"
  
  method jugar() {
    energia -= 30
    companiere.jugar()
    companiere.jugar()
  }
  
  method companiere() {
    return companiere
  }
  
  method comidaFavorita() {
    return comidaFavorita
  }
  
  method energia() {
    return energia
  }
}

object sally {
  // Estado
  var energia = 100
  var edad = 5
  
  // Método que **hace**
  method jugar() {
    energia = energia - 20 // energia -= 20
  }
  
  method ladrar() {
    energia -= 5
  }
  
  // Método que **devuelve**
  method ladrido() {
    return "Guau Guau"
  }
  
  // Getter
  method energia() {
    return energia
  }

  // Setter
  method energia(unaEnergia) {
    energia = unaEnergia
  }
}
