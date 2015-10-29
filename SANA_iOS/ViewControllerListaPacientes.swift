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
    
//    private let datos = [
//        Paciente(nombres: "Juan", apellidoP: "Perez", apellidoM: "Alvarez", edad: 58, genero: "masculino", estatura: 1.7, peso: 86, fragil: false),
//        Paciente(nombres: "Raquel", apellidoP: "Olivo", apellidoM: "Guerrero", edad: 78, genero: "femenino", estatura: 1.5, peso: 76, fragil: true),
//        Paciente(nombres: "Gabriel", apellidoP: "Fernandez", apellidoM: "Sanchez", edad: 90, genero: "masculino", estatura: 1.72, peso: 69, fragil: true),
//        Paciente(nombres: "Maria", apellidoP: "Vega", apellidoM: "Cebrian", edad: 77, genero: "femenino", estatura: 1.69, peso: 70, fragil: false),
//        Paciente(nombres: "Guillermo", apellidoP: "Espino", apellidoM: "Acevedo", edad: 66, genero: "masculino", estatura: 1.80, peso: 79, fragil: true)
//    ]
    
    var datos = Dictionary<Character, Array<Paciente>>()
    private var datosFiltrados = Dictionary<Character, Array<Paciente>>()
    var resultSearchController = UISearchController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        datos = DataManager.getDatosURL()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
//        self.resultSearchController.searchBar.scopeButtonTitles = ["Fragil", "Sin Fragilidad"]
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        
        self.tableView.reloadData()
        
    }

    override func viewWillDisappear(animated: Bool) {
        self.resultSearchController.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Search Controller
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        self.datosFiltrados.removeAll(keepCapacity: false)
        let searchText = searchController.searchBar.text!.lowercaseString
        
//        let scope = (searchController.searchBar.selectedScopeButtonIndex == 0)
//        self.datosFiltrados = self.datos.filter{ $0.nombres.rangeOfString(searchText) != nil && $0.fragil == scope}
        
        for (key, personas) in datos {
            datosFiltrados[key] = personas.filter { (p) in "\(p.nombre) \(p.apellidoP)".lowercaseString.rangeOfString(searchText) != nil }
        }
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    
    //Para ver cuantas secciones hay
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            return datosFiltrados.count
        } else {
            return datos.count
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            return String(Array(datosFiltrados.keys.sort())[section])
        } else {
            return String(Array(datos.keys.sort())[section])
        }
    }
    
    //Para el titulo de cada seccion
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            return datosFiltrados.keys.sort().map({String($0)})
        } else {
            return datos.keys.sort().map({String($0)})
        }
    }
    
    //Para el numero de elementos en cada seccion
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            return (datosFiltrados[Array(datosFiltrados.keys.sort())[section]]?.count)!
        }
        else
        {
            return (datos[Array(datos.keys.sort())[section]]?.count)!
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("PacienteCell", forIndexPath: indexPath) as! PacienteCell
        
        if (self.resultSearchController.active && self.resultSearchController.searchBar.text! != "")
        {
            if(DataManager.getPatientOrder() == 0){
                cell.nombreLabel.text = datosFiltrados[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].nombre
                cell.apellidoLabel.text = datosFiltrados[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].apellidoP
            } else {
                cell.apellidoLabel.text = datosFiltrados[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].nombre
                cell.nombreLabel.text = datosFiltrados[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].apellidoP
            }
            
            if(datosFiltrados[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].fragil){
                cell.fragilidadLabel.text = "Fragil"
            }else{
               cell.fragilidadLabel.text = "Sin fragilidad"
            }
            
            return cell
        }
        else
        {
            if(DataManager.getPatientOrder() == 0){
                cell.nombreLabel.text = datos[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].nombre
                cell.apellidoLabel.text = datos[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].apellidoP
            } else {
                cell.apellidoLabel.text = datos[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].nombre
                cell.nombreLabel.text = datos[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].apellidoP
            }
            
            if(datos[Array(datos.keys.sort())[indexPath.section]]![indexPath.row].fragil){
                cell.fragilidadLabel.text = "Fragil"
            }else{
                cell.fragilidadLabel.text = "Sin fragilidad"
            }
            
            return cell
            
        }
        
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destino = segue.destinationViewController as! VCDetalle
        let indice = self.tableView.indexPathForSelectedRow?.row
        let seccion = self.tableView.indexPathForSelectedRow?.section
        destino.p = datos[Array(datos.keys.sort())[seccion!]]![indice!]
    }

}
