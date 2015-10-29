//
//  VCRegistro1.swift
//  SANA_iOS
//
//  Created by Andrés Crisóstomo Vega on 29/10/15.
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import UIKit

class VCRegistro1: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidoP: UITextField!
    @IBOutlet weak var apellidoM: UITextField!
    @IBOutlet weak var telefono: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touch(sender: AnyObject) {
        nombre.resignFirstResponder()
        apellidoP.resignFirstResponder()
        apellidoM.resignFirstResponder()
        telefono.resignFirstResponder()
    }
    // Se invoca terminar de introducir datos
    @IBAction func textFieldDoneEditing(sender:UITextField){
        sender.resignFirstResponder()
    }
    //Se invoca al tocar alguna parte de la vista en donde no haya un control
    @IBAction func backgroundTap(sender: AnyObject) {
        nombre.resignFirstResponder()
        apellidoP.resignFirstResponder()
        apellidoM.resignFirstResponder()
        telefono.resignFirstResponder()
    }
    
  
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        var punto:CGPoint
        punto=CGPointMake(0,textField.frame.origin.y-50)
        self.scroll.setContentOffset(punto,animated:true)
    }
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        self.scroll.setContentOffset(CGPointZero, animated: true)
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
