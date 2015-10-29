//
//  TablaPacientes.swift
//  SANA_iOS
//
//  Created by Andres E Sedano on 10/28/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation


class TablaPacientes: WKInterfaceController {

    @IBOutlet var laTabla: WKInterfaceTable!
    
    var pacientes:[PacienteWatch] = []
    
    let DatosURL = "http://andysedano.com/json/sana.json"
    
    var json = JSON("")
    
    var session: WCSession? {
        didSet {
            if let session = session {
                session.delegate = self
                session.activateSession()
            }
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
    }
    
//    override func didAppear() {
//        
//        if WCSession.isSupported() {
//            
//            session = WCSession.defaultSession()
//            
//            session!.sendMessage(["reference": "datosWatch"], replyHandler: { (response) -> Void in
//                if let pacientesData = response["datos"] as? [PacienteWatch]{
//                    print("entroWatch")
//                    self.pacientes = pacientesData
//                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                        //self.showBoardingPass()
//                    })
//                }
//                }, errorHandler: { (error) -> Void in
//                    print(error)
//            })
//        }
//    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        getDatos()
        
        laTabla.setNumberOfRows(pacientes.count, withRowType: "CeldaWatch")
        for (var i = 0; i < pacientes.count; i++ ){
            let renlgon = laTabla.rowControllerAtIndex(i) as! PacienteCellWatch
            renlgon.labelNombre.setText(pacientes[i].nombre)
            renlgon.labelApellido.setText(pacientes[i].apellidoP)
            if(!pacientes[i].fragil){
                renlgon.fragil.setImageNamed("PuntoFragil")
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func getDatos(){
        
        if let url = NSURL(string: DatosURL) {
            if let data = NSData(contentsOfURL: url){
                json = JSON(data: data)
            }
        }
        
        for (_,subJson):(String, JSON) in json {
            
            let nombre = subJson["nombre"].string!
            let apellidoP = subJson["apellidoP"].string!
            let apellidoM = subJson["apellidoM"].string!
            let estatura = subJson["estatura"].double!
            let peso = subJson["peso"].double!
            let fragil = subJson["fragil"].bool!
            let d = subJson["diaN"].int!
            let m = subJson["mesN"].int!
            let a = subJson["anioN"].int!
            
            let p = PacienteWatch(nombre: nombre, apellidoP: apellidoP, apellidoM: apellidoM, estatura: estatura, peso:peso, dia:d, mes:m, año:a, fragil:fragil)
            
            pacientes.append(p)
            
        }
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        return pacientes[rowIndex]
    }
}



extension TablaPacientes: WCSessionDelegate {
    
}
