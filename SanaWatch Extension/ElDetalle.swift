//
//  ElDetalle.swift
//  SANA_iOS
//
//  Created by Andres E Sedano on 10/28/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import WatchKit
import Foundation


class ElDetalle: WKInterfaceController {

    @IBOutlet var labelNombre: WKInterfaceLabel!
    @IBOutlet var labelApellido: WKInterfaceLabel!
    @IBOutlet var labelEstatura: WKInterfaceLabel!
    @IBOutlet var labelPeso: WKInterfaceLabel!
    @IBOutlet var labelFechaN: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let p = context as! PacienteWatch
        self.labelNombre.setText(p.nombre)
        self.labelApellido.setText(p.apellidoP + " " + p.apellidoM)
        self.labelEstatura.setText("\(p.estatura)")
        self.labelPeso.setText("\(p.peso)")
        self.labelFechaN.setText("\(p.diaNac)/\(p.mesNac)/\(p.añoNac)")
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
