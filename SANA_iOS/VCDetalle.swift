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
    var detalle:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text=detalle

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
