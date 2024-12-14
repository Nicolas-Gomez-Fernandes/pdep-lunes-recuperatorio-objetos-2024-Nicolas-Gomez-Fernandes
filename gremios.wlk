import notieneSuficientesMiemborsException.NotieneSuficientesMiemborsException

class Gremio {
    const listaDeMagos = #{}

    method poderTotal() = listaDeMagos.sum({ mago => mago.poderTotal() })

    method reservaDeEnergiaMagica() = listaDeMagos.sum({ mago => mago.energiaMagica() })

    method liderDelGremio() = listaDeMagos.max({ mago => mago.poderTotal() })

    method desafiarA(desafiado) {
        if(self.ganarUnEnfrentaminetoAl(desafiado)){
            
            self.aumentarReservaMagicaDelLider(self.puntosTotalesRobadosAlDesafiado(desafiado))

        }
    }

    method ganarUnEnfrentaminetoAl(desafiado) = self.poderTotal() > desafiado.resistenciaMagicaTotal() + desafiado.liderDelGremio().energiaMagica() 

    method resistenciaMagicaTotal() = listaDeMagos.sum({ mago => mago.resistenciaMagica() })

    method aumentarReservaMagicaDelLider(unaCantidad) {
        self.liderDelGremio().almacenarPuntosDeEnergiaMagica(unaCantidad)
    }

    method puntosTotalesRobadosAlDesafiado(desafiado) = desafiado.sum({ mago => mago.cantidadARobarDePuntosDeEnergiaMagica(mago) })

    method crearGremio() {
        if(not self.tieneSuficientesMienbros()){
            throw new NotieneSuficientesMiemborsException(message = "el gremio no cuenta con suficientes miembros")
        }

        const gremio = new Gremio(listaDeMagos = #{}) //asumo que aca te da el conjunto de magos para la creacion del gremio por el test
    }

    method tieneSuficientesMienbros() = listaDeMagos.size() > 2

}