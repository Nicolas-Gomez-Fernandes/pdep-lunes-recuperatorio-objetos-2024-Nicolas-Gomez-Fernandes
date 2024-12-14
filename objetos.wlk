import magos.Mago

class Objeto {
    const poderBase

    method poderDelObjetoDe(mago)
}

class Varita inherits Objeto {
    override method poderDelObjetoDe(mago) = if(mago.nombre().even()) poderBase + poderBase * 0.5 else poderBase 
}

class Tunica inherits Objeto {
    override method poderDelObjetoDe(mago) = 2 * mago.resistenciaMagica()
}

class TunicaEpica inherits Tunica {
    override method poderDelObjetoDe(mago) = super(mago) + 10
}

class Amuleto {
    method poderDelObjetoDe(mago) = 200
}

class Ojota inherits Objeto {
    override method poderDelObjetoDe(mago) = 10 * mago.nombre().size()
}