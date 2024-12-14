class Gremio {
    const magosDelGremio = #{}

    method poderTotal() = magosDelGremio.sum({ mago => mago.poderTotal() })

    method reservaDeEnergiaMagica() = magosDelGremio.sum({ mago => mago.energiaMagica() })

    method liderDelGremio() = magosDelGremio.max({ mago => mago.poderTotal() })

    method desafiarA(desafiado) {
        if(self.ganarUnEnfrentaminetoAl(desafiado)){
            self.aumentarReservaMagicaDelLider(self.puntosTotalesRobadosAlDesafiado(desafiado))
        }
    }

    method ganarUnEnfrentaminetoAl(desafiado) = self.poderTotal() > desafiado.resistenciaMagicaTotal() + desafiado.liderDelGremio().energiaMagica() 

    method resistenciaMagicaTotal() = magosDelGremio.sum({ mago => mago.resistenciaMagica() })

    method aumentarReservaMagicaDelLider(unaCantidad) {
        self.liderDelGremio().almacenarPuntosDeEnergiaMagica(unaCantidad)
    }

    method puntosTotalesRobadosAlDesafiado(desafiado) = desafiado.sum({ mago => mago.robarPuntosDeEnergiaMagica(mago) })
}