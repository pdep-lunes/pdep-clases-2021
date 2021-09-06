import pdepcargas.pdepcargas

object rutatlantica {
	
	method dejarPasar(camion) {
		camion.recorrerRuta(400, self.velocidadQuePasa(camion))
		pdepcargas.pagar(self.costo(camion)) 
	}
	
	method velocidadQuePasa(camion) {
		return camion.velocidadMaxima().min(75)
	}
	
	method costo(camion) {
		return 7000 + camion.pesoCarga().div(1000) * 100
	}
	
}
