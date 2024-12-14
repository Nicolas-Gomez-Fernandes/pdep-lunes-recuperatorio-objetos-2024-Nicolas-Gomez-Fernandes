class ObjetoMagico {
    const poderBase

    method poderDelObjetoDe(mago) 
}

class Varita inherits ObjetoMagico {
    override method poderDelObjetoDe(mago) = if(mago.nombre().even()) poderBase + poderBase * 0.5 else poderBase 
}

class Tunica inherits ObjetoMagico {
    override method poderDelObjetoDe(mago) = 2 * mago.resistenciaMagica()
}

class TunicaEpica inherits Tunica {
    override method poderDelObjetoDe(mago) = super(mago) + 10
}

object amuleto {
    method poderDelObjetoDe(mago) = 200
}

object ojota {
    method poderDelObjetoDe(mago) = 10 * mago.nombre().size()
}