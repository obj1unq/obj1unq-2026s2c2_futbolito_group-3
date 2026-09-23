/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)

	var camisetaTitular = true
	


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
	

	method cambiarCamiseta() {
		if (position.x() == 0) {
			camisetaTitular = not camisetaTitular
		}
	}
}




object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
