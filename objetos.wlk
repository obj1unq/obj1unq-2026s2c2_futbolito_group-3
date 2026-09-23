/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)

	var camisetaTitular = true

	const objetivo = pelota


	method image() {
		if (camisetaTitular) {
			return "lionel-titular.png"
		} else {
			return "lionel-suplente.png"
		}
	}



	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	

	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method hacerTaquitoCon(objetiv) {
		self.validarHacerTaquito(objetiv)
		objetiv.recibirTaquitoDe(self)
	}

	method buscar() {
		position = objetivo.position()
	}

	method patear() {
		self.validarPatear()
		objetivo.desplazarse()
	}

	method validarPatear() {
		if (position != objetivo.position()) {
			self.error("La pelota no esta al alcance para patear")
		}
	}


	method cambiarCamiseta() {
		if (position.x() == 0) {
			 camisetaTitular = not camisetaTitular
		}
	}

	method validarHacerTaquito(objetiv) {
		if ( not ( objetivo.position() == position ) ){
			self.error('No se puede hacer taquito, acercate a la pelota')

		}
	}
}




object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method recibirTaquitoDe(personaje) {
		position = game.at( (position.x() - 2).max(0), position.y() )
	}

	method inicio() {
		position = game.at(0,5)
	}
	
	method desplazarse() {
		const nuevaCoordenadaX = (position.x() + 3).min(game.width() - 1)
		position = game.at(nuevaCoordenadaX, position.y())

	}	

}
