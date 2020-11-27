//
//  ViewController.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 23/11/20.
//

import UIKit

class ViewController: UIViewController {

//Ciclo de vida de una View
  //ARC weak / strong
  @IBOutlet weak var txtField2: UITextField!
  @IBOutlet weak var label2: UILabel!
  @IBAction func btnAction(_ sender: Any) {
    self.view.backgroundColor = UIColor.lightGray
  }
  
  // La Vista fue cargada
  override func viewDidLoad() {
    super.viewDidLoad()
    //view.backgroundColor = UIColor.red
    print("ViewDidLoad")
    //print(UIScreen.main.bounds)
    initUI()
    label2.layer.borderWidth = 3
    //txtField2.text = "Ok"
    txtField2.placeholder = "Texto de prueba"
  }
  
  // La Vista va a aparecer
  override func viewWillAppear(_ animated: Bool) {
    print("ViewWillAppear")
  }
  
  // La Vista ya aparecio
  override func viewDidAppear(_ animated: Bool) {
    print("ViewDidAppear")
  }
  
  // La Vista va a desaparecr
  override func viewWillDisappear(_ animated: Bool) {
    print("ViewWillDisappear")
  }
  
  // La vista ya desaparecio
  override func viewDidDisappear(_ animated: Bool) {
    print("ViewDidDissapear")
  }
  
  func initUI(){
    //MARK:- Etiqueta
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
    label.text = "Hola Netec"
    label.layer.borderWidth = 1.4
    label.textAlignment = .center
    self.view.addSubview(label)
    
    //MARK:- Boton
    let boton = UIButton()
    boton.frame = CGRect(x: 215.5, y: 0, width: 200.3, height: 50.5)
    boton.setTitle("Mi boton IBaction", for: .normal)
    boton.backgroundColor = UIColor.darkGray
    boton.addTarget(self, action: #selector(backgroundLight), for: .touchUpInside)
    self.view.addSubview(boton)
    
    //MARK:- Campo de texto
    let txtField = UITextField(frame: CGRect(x: 85, y: 105, width: 200, height: 50))
    txtField.textAlignment = .center
    txtField.textColor = UIColor.red
    txtField.borderStyle = .line
    txtField.placeholder = "Aqui va tu correo!"
    txtField.backgroundColor = UIColor.clear
    self.view.addSubview(txtField)
    
    //MARK:- Image View
    let imgName = "swift.png"
    let img = UIImage(named: imgName)
    //let imgView = UIImageView(frame: CGRect(x: 160, y: 215, width: 150, height: 150))
    //imgView.image = img
    let imgView = UIImageView(image: img)
    imgView.frame = CGRect(x: 160, y: 215, width: 150, height: 150)
    self.view.addSubview(imgView)
  }

  @objc func backgroundLight(){
    self.view.backgroundColor = UIColor.white
  }

}

