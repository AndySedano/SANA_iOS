//
//  PacienteWatch.swift
//  SANA_iOS
//
//  Created by Andres E Sedano on 10/28/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import Foundation

class PacienteWatch{
    
    var nombre:String = ""
    var apellidoP:String = ""
    var apellidoM:String = ""
    var estatura:Double = 0
    var peso:Double = 0
    var diaNac:Int = 1
    var mesNac:Int = 0
    var añoNac:Int = 0
    var fragil:Bool = false
    
    init(nombre: String, apellidoP: String, apellidoM: String, estatura:Double, peso:Double, dia:Int, mes:Int, año:Int, fragil:Bool) {
        self.nombre = nombre
        
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.estatura = estatura
        self.peso = peso
        self.fragil =  fragil
        self.diaNac = dia
        self.mesNac = mes
        self.añoNac = año
        
    }
    
    init() {
        self.nombre = "nombre"
        self.apellidoP = "apellidoP"
        self.apellidoM = "apellidoM"
        self.estatura = 0
        self.peso = 0
        self.fragil = false
    }

    
}
