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
        
        actualizarDatos()
        
        
        
        if(p.fragil){
            //fragilidad.text = "Fragil"
        }else{
            //fragilidad.text = "Sin fragilidad"
        }
        changePhoto()
        changeBacground(p.fragil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actualizarDatos(){
        self.nombre.text = p.nombre + " " + p.nombre2
        self.apellidos.text = p.apellidoP + " " + p.apellidoM
        self.fechaNacimiento.text = "\(p.diaNac) de \(getNombreMes(p.mesNac)) de \(p.añoNac)"
        self.edad.text = String(p.edad)
        self.peso.text = String(p.peso)
        self.estatura.text = String(p.estatura)
        self.telefono.text = p.telefono
        self.grupoSanguineo.text = p.gs
    }
    
    func changePhoto(){
        self.foto.layer.cornerRadius = self.foto.frame.size.width / 2
        self.foto.clipsToBounds = true
    }
    
    func changeBacground(fragil:Bool){
        
        var colorTop:CGColor
        
        if(fragil){
            colorTop = UIColor(red: 247.0/255.0, green: 136.0/255.0, blue: 136.0/255.0, alpha: 1.0).CGColor
        } else {
            colorTop = UIColor(red: 180.0/255.0, green: 235.0/255.0, blue: 148.0/255.0, alpha: 1.0).CGColor
        }
        
        
        let colorBottom = UIColor.whiteColor().CGColor
        
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.frame = backgroundFragil.bounds
        //self.backgroundFragil.layer.i
    }
    
    func getNombreMes(mes:Int) -> String{
        switch mes {
        case 1:
            return "Enero"
        case 2:
            return "Febrero"
        case 3:
            return "Marzo"
        case 4:
            return "Abril"
        case 5:
            return "Mayo"
        case 6:
            return "Junio"
        case 7:
            return "Julio"
        case 8:
            return "Agosto"
        case 9:
            return "Septiembre"
        case 10:
            return "Octubre"
        case 11:
            return "Noviembre"
        case 12:
            return "Diciembre"
        default:
            return ""
        }
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
