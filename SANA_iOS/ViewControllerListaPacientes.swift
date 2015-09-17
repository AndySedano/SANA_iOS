//
//  ViewControllerListaPacientes.swift
//  Proyecto
//
//  Andres E. Sedano A00399842
//  Josué Adán Crisóstomo A01333760
//  Copyright © 2015 Andres Sedano. All rights reserved.
//

import UIKit

class ViewControllerListaPacientes: UITableViewController, UISearchResultsUpdating {
    
    private let datos = [
        Paciente(nombres: "Juan", apellidoP: "Perez", apellidoM: "Alvarez", edad: 58, genero: "masculino", estatura: 1.7, peso: 86, fragil: false),
        Paciente(nombres: "Raquel", apellidoP: "Olivo", apellidoM: "Guerrero", edad: 78, genero: "femenino", estatura: 1.5, peso: 76, fragil: true),
        Paciente(nombres: "Gabriel", apellidoP: "Fernandez", apellidoM: "Sanchez", edad: 90, genero: "masculino", estatura: 1.72, peso: 69, fragil: true),
        Paciente(nombres: "Maria", apellidoP: "Vega", apellidoM: "Cebrian", edad: 77, genero: "femenino", estatura: 1.69, peso: 70, fragil: false),
        Paciente(nombres: "Guillermo", apellidoP: "Espino", apellidoM: "Acevedo", edad: 66, genero: "masculino", estatura: 1.80, peso: 79, fragil: true)
    ]
    
    private var datosFiltrados = [Paciente]()
    var resultSearchController = UISearchController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
//        self.resultSearchController.searchBar.scopeButtonTitles = ["Fragil", "Sin Fragilidad"]
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Search Controller
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        self.datosFiltrados.removeAll(keepCapacity: false)
        let searchText = searchController.searchBar.text!.lowercaseString
        
//        let scope = (searchController.searchBar.selectedScopeButtonIndex == 0)
//        self.datosFiltrados = self.datos.filter{ $0.nombres.rangeOfString(searchText) != nil && $0.fragil == scope}
        
        self.datosFiltrados = self.datos.filter{ (p) in
            "\(p.nombres) \(p.apellidoP)".lowercaseString.rangeOfString(searchText) != nil
        }
        
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            return self.datosFiltrados.count
        }
        else
        {
            return self.datos.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("PacienteCell", forIndexPath: indexPath) as! PacienteCell
        
        
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            cell.nombreLabel.text = datosFiltrados[indexPath.row].nombres
            cell.apellidoLabel.text = datosFiltrados[indexPath.row].apellidoP
            
            if(datosFiltrados[indexPath.row].fragil){
                cell.fragilidadLabel.text = "Fragil"
            }else{
               cell.fragilidadLabel.text = "Sin fragilidad"
            }
            
            return cell
        }
        else
        {
            cell.nombreLabel.text = datos[indexPath.row].nombres
            cell.apellidoLabel.text = datos[indexPath.row].apellidoP
            
            if(datos[indexPath.row].fragil){
                cell.fragilidadLabel.text = "Fragil"
            }else{
                cell.fragilidadLabel.text = "Sin fragilidad"
            }
            
            return cell
            
        }
        
    }


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destino = segue.destinationViewController as! VCDetalle
        let indice = self.tableView.indexPathForSelectedRow?.row
        destino.p = datos[indice!]
        
    }

}
