class Mago {
    const nombre
    const objetosMagicos = []
    const poderInnato
    const resistenciaMagica
    var energiaMagica
    var rangoMagico // aprendiz, veterano o inmortal

    method nombre() = nombre

    method resistenciaMagica() = resistenciaMagica

    method energiaMagica() = energiaMagica

    method poderTotal() = self.cantidadDePoderMagicoDeLosObjetosEquipadosDe(self) * poderInnato

    method cantidadDePoderMagicoDeLosObjetosEquipadosDe(mago) = objetosMagicos.sum({ objeto => objeto.poderDelObjetoDe(mago) })

    method desafiarA(otroMago){
        if(rangoMagico.ganarUnEnfrentamientoEntre(self, otroMago)){

            rangoMagico.robarPuntosDeEnergiaMagicaA(otroMago)
            self.almacenarPuntosDeEnergiaMagica(rangoMagico.robarPuntosDeEnergiaMagicaA(otroMago))

        }
    }

    method almacenarPuntosDeEnergiaMagica(puntosDeEnergiaMagica){
        energiaMagica += puntosDeEnergiaMagica
    }

    method perderUnPorcetajeDeSuPoderMagico(unPorcentaje) {
        energiaMagica -= energiaMagica * unPorcentaje
    }

    method cantidadARobarDePuntosDeEnergiaMagica(mago) = rangoMagico.cantidadDePuntosDeEnergiaMagicaARobarA(mago) 
    
    method cambiarDeRango(nuevoRango){
        rangoMagico = nuevoRango
    }
    

}

object aprendiz {
    method ganarUnEnfrentamientoEntre(unMago, unMagoAprendiz) = unMagoAprendiz.resistenciaMagica() < unMago.poderTotal()

    method robarPuntosDeEnergiaMagicaA(unMagoAprendiz) {
        unMagoAprendiz.perderUnPorcetajeDeSuPoderMagico(0.5)
    }

    method cantidadDePuntosDeEnergiaMagicaARobarA(unMago) = unMago.energiaMagica() * 0.5

}


object veterano {
    method ganarUnEnfrentamientoEntre(unMago, unMagoVeterano) = unMago.poderTotal() >= unMagoVeterano.resistenciaMagica() * 1.5

    method robarPuntosDeEnergiaMagicaA(unMagoVeterano){
        unMagoVeterano.perderUnPorcetajeDeSuPoderMagico(0.25)
    }

    method cantidadDePuntosDeEnergiaMagicaARobarA(unMago) = unMago.energiaMagica() * 0.25
}

object inmortal {
    method ganarUnEnfrentamientoEntre(unMago, unMagoInmortal) = false 
}