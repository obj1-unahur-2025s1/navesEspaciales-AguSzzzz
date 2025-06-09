class Nave {

  var velocidad = 0
  var direccionAlSol = 0
  var combustible = 0

  method velocidad() = velocidad
  method direccionAlSol() = direccionAlSol
  method combustible() = combustible

  method acelerar(cuanto){velocidad = (velocidad + cuanto).min(100000).max(0)}
  method desacelerar(cuanto){velocidad = (velocidad - cuanto).min(100000).max(0)}

  method irHaciaElSol(){direccionAlSol = 10}
  method escaparDelSol(){direccionAlSol = -10}
  method ponerseParaleloAlSol(){direccionAlSol = 0}

  method acercarseUnPocoAlSol(){direccionAlSol = (direccionAlSol + 1).min(10)}
  method alejarseUnPocoDelSol(){direccionAlSol = (direccionAlSol + 1).max(-10)}

  method cargarCombustible(cantidad){combustible = combustible + cantidad}
  method descargarCombustible(cantidad){combustible = combustible - cantidad}

  method prepararViaje()
}

class NaveBaliza inherits Nave{

  var color = "azul"

  method cambiarColorDeBaliza(colorNuevo){
    color = "colorNuevo"
  } 

  override method prepararViaje(){
    self.cambiarColorDeBaliza("verde")
  }

}

class NaveDePasajeros inherits Nave{

  var property pasajeros = 0
  var racionesDeComida = 0
  var racionesDeBebida = 0


  method descargarRacionesDeBebida(cantidad){racionesDeBebida = racionesDeBebida - cantidad.max(0)}
  method cargarRacionesDeBebida(cantidad){racionesDeBebida = racionesDeBebida + cantidad}

  method descargarRacionesDeComida(cantidad){racionesDeComida = racionesDeComida - cantidad.max(0)}
  method cargarRacionesDeComida(cantidad){racionesDeComida= racionesDeComida + cantidad}

  override method prepararViaje(){
    self.cargarRacionesDeComida(4)
    self.cargarRacionesDeBebida(6)
    self.acercarseUnPocoAlSol()
  }
}

class NaveDeCombate inherits Nave{

  const mensajes = []
  var esVisible = true
  var misilesDesplegados = true
   
  method ponerseVisible(){esVisible = true}
  method ponerseInisible(){esVisible = false}
  method estaInvisible(){return esVisible == true}

  method desplegarMisiles(){misilesDesplegados = true}
  method replegarMisiles(){misilesDesplegados = false}
  method misilesDesplegados(){return misilesDesplegados == true}

  method emitirMensaje(mensaje){mensajes.add(mensaje)}
  method mensajesEmitidos(){return mensajes}
  method primerMensajeEmitido(){return mensajes.first()}
  method ultimoMensajeEmitido(){return mensajes.last()}
  method esEscueta(){return mensajes.last().size() > 30}
  method emitioMensaje(mensaje){}

  override method prepararViaje(){
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en mision")
  }
}