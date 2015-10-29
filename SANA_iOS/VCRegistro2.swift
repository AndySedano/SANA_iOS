//
//  VCRegistro2.swift
//  SANA_iOS
//
//  Created by Andrés Crisóstomo Vega on 29/10/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import UIKit

class VCRegistro2: UIViewController {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var estatura: UITextField!
    @IBOutlet weak var tSangre: UITextField!
    
    
    var generos = ["Masculino","Femenino"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,numberOfRowsInComponent component: Int)->Int{
        return generos.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String!{
        return generos[row]
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
