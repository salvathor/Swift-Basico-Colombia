//
//  ViewController4.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 27/11/20.
//

import UIKit

class ViewController4: UIViewController {

  @IBOutlet weak var myTableView: UITableView!
  var titulos = ["MENU BEBIDAS", "MENU COMIDAS"]
  var bebidas: [Item]!
  var platillos: [Item]!
  var menu: [[Item]]! //Necesito un formato como este para trabajar con mas de una seccion.
  
  override func viewDidLoad() {
        super.viewDidLoad()
    cargarDatos()
    myTableView.dataSource = self
    myTableView.delegate = self
  }
  
  func cargarDatos(){
    
    self.bebidas = [Item("Café de Olla", 7.95, false),Item("Expresso", 7.95, true),Item("Expresso Doble", 11.49, false),Item("Te", 9.90, true)]
    
    self.platillos = [Item("Huevos", 10.0, true),Item("Bowl de fruta", 12.0, false),Item("Huevos con tocino", 13.0, true)]
    
    self.menu = [self.bebidas,self.platillos]
  }

}

extension ViewController4: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return menu.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return titulos[section]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menu[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    cell.textLabel?.text = menu[indexPath.section][indexPath.row].nombre
    cell.detailTextLabel?.text = String(format:"$ %2.2f", menu[indexPath.section][indexPath.row].precio)
    if menu[indexPath.section][indexPath.row].especial{
      cell.backgroundColor = UIColor.yellow
    }else{
      cell.backgroundColor = UIColor.white
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //print("Index path: \(indexPath)")
    //print("Section: \(indexPath.section)")
    //print("Row: \(indexPath.row)")
    print("Item: \(menu[indexPath.section][indexPath.row].nombre)")
    //print("===============")
    
    //MARK:- Alert Controller
    let alerta: UIAlertController = UIAlertController(title: "Carrito de compra", message: "¿Deseas agregar \(menu[indexPath.section][indexPath.row].nombre) a tu compra?", preferredStyle: .actionSheet)
    let btnOk: UIAlertAction = UIAlertAction(title: "¡Si, agregar ahora!", style: .default) { (agregado) in
      print("Se agrego \(self.menu[indexPath.section][indexPath.row].nombre) con exito!")
    }
    let btnCancelar: UIAlertAction = UIAlertAction(title: "No por ahora", style: .cancel, handler: nil)
    alerta.addAction(btnOk)
    alerta.addAction(btnCancelar)
    present(alerta, animated: true, completion: nil)
    
    
  }
  
}
