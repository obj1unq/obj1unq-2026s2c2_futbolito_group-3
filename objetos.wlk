/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	const objetivo = pelota
	
	method image() {
		return "lionel-titular.png"
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
}
