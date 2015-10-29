//
//  DataManager.swift
//  SANA_iOS
//
//  Created by Andres E Sedano on 10/24/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import Foundation

let DatosURL = "http://andysedano.com/json/datosSana.json"
var appDefaults:Dictionary<String, AnyObject>?

class DataManager{
    
    init(){
        appDefaults = Dictionary<String, AnyObject>()
        NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults!)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func getPatientOrder() -> Int {
        return NSUserDefaults.standardUserDefaults().integerForKey("Orden")
    }
    
    class func getDatosURL() -> Dictionary<Character, Array<Paciente>>{
        
        var json:JSON = ""
        
        if let url = NSURL(string: DatosURL) {
            if let data = NSData(contentsOfURL: url){
                json = JSON(data: data)
            }
        }
        
        let orden = NSUserDefaults.standardUserDefaults().integerForKey("Orden")
        
        var datos = Dictionary<Character, Array<Paciente>>()
        
        for (_,subJson):(String, JSON) in json {
            
            let nombre = subJson["nombre"].string!
            let nombre2 = subJson["nombre2"].string!
            let apellidoP = subJson["apellidoP"].string!
            let apellidoM = subJson["apellidoM"].string!
            let edad = subJson["edad"].int!
            let genero = subJson["genero"].string!
            let estatura = subJson["estatura"].double!
            let peso = subJson["peso"].double!
            let fragil = subJson["fragil"].bool!
            
            let p = Paciente(nombre: nombre,nombre2:nombre2, apellidoP: apellidoP, apellidoM: apellidoM, edad: edad, genero: genero, estatura: estatura, peso: peso, fragil:fragil)
            
            if orden == 0{
                if (datos[nombre.uppercaseString.characters.first!] != nil){
                    datos[nombre.uppercaseString.characters.first!]?.append(p)
                } else {
                    datos[nombre.uppercaseString.characters.first!] = [p]
                }
            } else {
                if (datos[apellidoP.uppercaseString.characters.first!] != nil){
                    datos[apellidoP.uppercaseString.characters.first!]?.append(p)
                } else {
                    datos[apellidoP.uppercaseString.characters.first!] = [p]
                }
            }
            
        }
        
        return datos
        
    }
    
}
