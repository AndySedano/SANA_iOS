//
//  Paciente.swift
//  SANA_iOS
//
//  Created by Andres E Sedano on 9/16/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import Foundation

class Paciente {
    var nombres:String = ""
    var apellidoP:String = ""
    var apellidoM:String = ""
    var edad:Int = 0
    var genero:String = ""
    var estatura:Double = 0
    var peso:Double = 0
    var fragil:Bool = false
    
    
    init(nombres: String, apellidoP: String, apellidoM: String, edad: Int, genero:String, estatura:Double, peso:Double, fragil:Bool) {
        self.nombres = nombres
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.edad = edad
        self.genero = genero
        self.estatura = estatura
        self.peso = peso
        self.fragil =  fragil
    }
    
    init() {
        self.nombres = "nombre"
        self.apellidoP = "apellidoP"
        self.apellidoM = "apellidoM"
        self.edad = 0
        self.genero = "genero"
        self.estatura = 0
        self.peso = 0
        self.fragil = false
    }
}