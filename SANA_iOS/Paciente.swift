//
//  Paciente.swift
//  SANA_iOS
//
//  Andres E. Sedano A00399842
//  Josué Adán Crisóstomo A01333760
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import Foundation

class Paciente {
    var nombre:String = ""
    var nombre2:String = ""
    var apellidoP:String = ""
    var apellidoM:String = ""
    var edad:Int = 0
    var genero:String = ""
    var estatura:Double = 0
    var peso:Double = 0
    var fragil:Bool = false
    
    init(nombre: String, nombre2: String, apellidoP: String, apellidoM: String, edad: Int, genero:String, estatura:Double, peso:Double, fragil:Bool) {
        self.nombre = nombre
        self.nombre2 = nombre2
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.edad = edad
        self.genero = genero
        self.estatura = estatura
        self.peso = peso
        self.fragil =  fragil
    }
    
    init() {
        self.nombre = "nombre"
        self.nombre2 = ""
        self.apellidoP = "apellidoP"
        self.apellidoM = "apellidoM"
        self.edad = 0
        self.genero = "genero"
        self.estatura = 0
        self.peso = 0
        self.fragil = false
    }
}