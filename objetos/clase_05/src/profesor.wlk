import estudiantes.*

object profesor {
  var cfd = 3
  var estudiantes = [lucia, juan, perla]
  
  method estudiantesEjemplares() {
    return estudiantes.filter { unEstudiante => unEstudiante.esEjemplar() }
  }
   
   method promedioDeCurso() {
     return self.promediosDeEstudiantes().sum() / estudiantes.size()
   }
   
   method promediosDeEstudiantes() {
     return estudiantes.map { unEstudiante => unEstudiante.promedio() }
   }
   
   method evaluarAEstudiantes() {
     estudiantes.forEach { unEstudiante => unEstudiante.agregarNota(self.notaDeExamenSorpresa()) }
   }
   
   method notaDeExamenSorpresa() {
     return cfd + self.promedioDeCurso()
   }
   
   method agregarEstudiante(unEstudiante) {
     estudiantes.add(unEstudiante)
   }
}
