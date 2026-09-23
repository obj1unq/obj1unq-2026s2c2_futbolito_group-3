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

}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method inicio() {
		position = game.at(0,5)
	}
	
	method desplazarse() {
		const nuevaCoordenadaX = (position.x() + 3).min(game.width() - 1)
		position = game.at(nuevaCoordenadaX, position.y())

	}	

}
