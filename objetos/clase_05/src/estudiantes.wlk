class Estudiante {
  var notas
  var cursadas
  
  method promedio() {
    return notas.sum() / notas.size()
  }
  
  method cantidadDeExamenesDesaprobados() {
    return notas.count { unaNota => unaNota < 6 }
  }
  
  method esEjemplar() {
    return notas.all { unaNota => unaNota >= 8 } 
  }
  
  method pasarDeAnio() {
    const cursadasNuevas = self.proximasMaterias()
    cursadas.addAll(cursadasNuevas)
  }
  
  method proximasMaterias() {
    return cursadas.map { unaCursada => unaCursada + "I" }
  }
  
  method agregarNota(unaNota) {
    notas.add(unaNota)
  }
}

class Oyente {
  method esEjemplar() {
    return true
  }
  
  method promedio() {
    return 10
  }
}

const lucia = new Estudiante(notas = [6, 8, 8, 6], cursadas = ["Análisis Matemático I", "Física II"])

const juan  = new Estudiante(notas = [4, 7, 9, 9], cursadas = ["Programación II", "Sistemas Operativos I", "Análisis Matemático I"])

const perla = new Estudiante(notas = [4, 7, 9, 9], cursadas = ["Programación II", "Sistemas Operativos I", "Análisis Matemático I"])
