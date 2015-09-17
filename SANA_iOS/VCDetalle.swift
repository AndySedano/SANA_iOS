//
//  VCDetalle.swift
//  Proyecto
//
//  Created by Andrés Crisóstomo Vega on 16/09/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import UIKit

class VCDetalle: UIViewController {
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var estatura: UILabel!
    @IBOutlet weak var peso: UILabel!
    @IBOutlet weak var fragilidad: UILabel!
    
    var p:Paciente = Paciente()

    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text=p.nombres
        edad.text=String(p.edad)
        genero.text=p.genero
        estatura.text=String(p.estatura)
        peso.text=String(p.peso)
        
        if(p.fragil){
            fragilidad.text = "Fragil"
        }else{
            fragilidad.text = "Sin fragilidad"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
