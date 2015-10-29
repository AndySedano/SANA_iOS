//
//  VCDetalle.swift
//  Proyecto
//
//  Andres E. Sedano A00399842
//  Josué Adán Crisóstomo A01333760
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import UIKit

class VCDetalle: UIViewController {
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var fechaNacimiento: UILabel!
    @IBOutlet weak var telefono: UILabel!
    @IBOutlet weak var grupoSanguineo: UILabel!
    @IBOutlet weak var estatura: UILabel!
    @IBOutlet weak var peso: UILabel!
    @IBOutlet weak var backgroundFragil: UIView!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var genero: UIImageView!
    
    var p:Paciente = Paciente()

    override func viewDidLoad() {
        super.viewDidLoad()
        foto.layer.cornerRadius = 25
        foto.layer.masksToBounds = true
        nombre.text=p.nombre + " " + p.apellidoP
        edad.text=String(p.edad)
        //genero.text=p.genero
        //estatura.text=String(p.estatura)
        //peso.text=String(p.peso)
        
        if(p.fragil){
            //fragilidad.text = "Fragil"
        }else{
            //fragilidad.text = "Sin fragilidad"
        }
        changeBacground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeBacground(){
        let colorTop = UIColor(red: 247.0/255.0, green: 136.0/255.0, blue: 136.0/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor.whiteColor().CGColor
        
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        //gl.colors = [UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor]
        gl.frame = backgroundFragil.bounds
        backgroundFragil.layer.insertSublayer(gl, atIndex:  0)
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
