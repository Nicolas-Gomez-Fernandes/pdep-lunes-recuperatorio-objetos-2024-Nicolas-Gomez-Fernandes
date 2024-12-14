class Mago {
    const nombre
    const objetosMagicos = []
    const poderInnato
    const resistenciaMagica
    var energiaMagica
    var rangoMagico

    method nombre() = nombre

    method resistenciaMagica() = resistenciaMagica

    method energiaMagica() = energiaMagica

    method poderTotal() = self.cantidadDePoderMagicoDeLosObjetosEquipadosDe(self) * poderInnato

    method cantidadDePoderMagicoDeLosObjetosEquipadosDe(mago) = objetosMagicos.sum({ objeto => objeto.poderDelObjetoDe(mago) })

    method desafiarA(otroMago){
        if(rangoMagico.ganarUnEnfrentaminetoEntre(self, otroMago)){

            rangoMagico.robarPuntosDeEnergiaMagica(otroMago)
            self.almacenarPuntosDeEnergiaMagica(rangoMagico.robarPuntosDeEnergiaMagica(otroMago))

        }
    }

    method almacenarPuntosDeEnergiaMagica(puntosDeEnergiaMagica){
        energiaMagica += puntosDeEnergiaMagica
    }

    method perderUnPorcetajeDeSuPoderMagico(unPorcentaje) {
        energiaMagica -= energiaMagica * unPorcentaje
    }

    method robarPuntosDeEnergiaMagica(otroMago)  = rangoMagico.robarPuntosDeEnergiaMagica(otroMago)
    

}

object aprendiz {
    method ganarUnEnfrentaminetoEntre(unMago, magoAprendiz) = unMago.resistenciaMagica() > magoAprendiz.poderTotal()

    method robarPuntosDeEnergiaMagica(magoAprendiz) = magoAprendiz.perderUnPorcetajeDeSuPoderMagico(0.5)

}


object veterano {
    method ganarUnEnfrentaminetoEntre(unMago, magoVeterano) = unMago.poderTotal() > magoVeterano.resistenciaMagica() * 1.5

    method robarPuntosDeEnergiaMagica(magoVeterano) = magoVeterano.perderUnPorcetajeDeSuPoderMagico(0.25)
}

object inmortal {
    method ganarUnEnfrentaminetoEntre(unMago, magoInmortal) = false 
}