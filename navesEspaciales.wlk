class Nave {

  var velocidad = 0
  var direccionAlSol = 0
  var combustible = 0

  method velocidad() = velocidad
  method direccionAlSol() = direccionAlSol
  method combustible() = combustible

  method acelerar(cuanto){velocidad = (velocidad + cuanto.max(0)).min(100000)}
  method desacelerar(cuanto){velocidad = (velocidad - cuanto).max(0)}

  method irHaciaElSol(){direccionAlSol = 10}
  method escaparDelSol(){direccionAlSol = -10}
  method ponerseParaleloAlSol(){direccionAlSol = 0}

  method acercarseUnPocoAlSol(){direccionAlSol = (direccionAlSol + 1).min(10)}
  method alejarseUnPocoDelSol(){direccionAlSol = (direccionAlSol + 1).max(-10)}

  method cargarCombustible(cantidad){combustible = combustible + cantidad}
  method descargarCombustible(cantidad){combustible = combustible - cantidad}

  method prepararViaje()
}

// el profe hizo que sean clases en vez de objetos. me faltaria averiguar como se testean las instancias de las clases.
object naveBaliza inherits Nave{ // se puede poner en el Nave > Nave(velocidad = 123) y las naves de esta clase se inicializan con esa velocidad

  var color = "azul"

  method color() = color
  method cambiarColorDeBaliza(colorNuevo){color = "colorNuevo" } // colorNuevo.toString() / el profe no puso ni comillas ni .toString 

  override method prepararViaje(){
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
    }   // el super nomas se usaria si estuviese referenciando al prepararViaje original

}

object naveDePasajeros inherits Nave{

  var property pasajeros = 0    // el profe tmb uso property 7u7
  var racionesDeComida = 0
  var racionesDeBebida = 0

  method racionesDeComida() = racionesDeComida
  method racionesDeBebida() = racionesDeBebida

  method descargarRacionesDeBebida(cantidad){racionesDeBebida = racionesDeBebida - cantidad.max(0)}
  method cargarRacionesDeBebida(cantidad){racionesDeBebida = racionesDeBebida + cantidad}

  method descargarRacionesDeComida(cantidad){racionesDeComida = racionesDeComida - cantidad.max(0)}
  method cargarRacionesDeComida(cantidad){racionesDeComida= racionesDeComida + cantidad}

  override method prepararViaje(){
    self.cargarRacionesDeComida(4 * pasajeros) // self.pasajeros() es valido tmb
    self.cargarRacionesDeBebida(6 * pasajeros)
    self.acercarseUnPocoAlSol()
  }
}

object naveDeCombate inherits Nave{

  const mensajes = []   // property va, define el getter, va en todas las listas, el profe le puso de nombre a la lista mensajesEmitidos, y asi se ahorro hacer el getter o.o
  var esVisible = true  // el profe hizo esInvisible, q tiene mas sentido por el method estaInvisible() pero bueno
  var misilesDesplegados = true
   
  method ponerseVisible(){esVisible = true}
  method ponerseInisible(){esVisible = false}
  method estaInvisible(){return esVisible == false}

  method desplegarMisiles(){misilesDesplegados = true}
  method replegarMisiles(){misilesDesplegados = false}
  method misilesDesplegados(){return misilesDesplegados == true} //chequear como lo hizo el profe q me colgue

  method emitirMensaje(mensaje){mensajes.add(mensaje)} // No mezclar metodos de consulta con indicacion, elegir 1, como hice yo 7u7
  method mensajesEmitidos(){return mensajes}
  method primerMensajeEmitido(){return mensajes.first()}
  method ultimoMensajeEmitido(){return mensajes.last()}
  method esEscueta(){return mensajes.any({m => m.size() < 30})} // length tmb funca en vez de size
  method emitioMensaje(mensaje){mensajes.contains(mensaje)} // ni idea, no sabia de la existencia del contains xd. con el any lo intente pero me falto un return pq soy medio bobo

  override method prepararViaje(){
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en mision")
  }
}