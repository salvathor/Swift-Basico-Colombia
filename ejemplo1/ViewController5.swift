//
//  ViewController5.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 27/11/20.
//

import UIKit

class ViewController5: UIViewController {

  @IBOutlet weak var imgview: UIImageView!
  @IBOutlet weak var txtFieldEmail: UITextField!
  @IBOutlet weak var txtFieldContrasena: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  override func viewWillAppear(_ animated: Bool) {
    imgview.alpha = 0.0
    txtFieldEmail.frame.origin.x = -self.view.frame.width
    txtFieldEmail.backgroundColor = UIColor.white
    txtFieldContrasena.frame.origin.x = -self.view.frame.width
    txtFieldContrasena.backgroundColor = UIColor.white
    UIView.animate(withDuration: 0.5) {
      self.view.backgroundColor = UIColor.yellow
      self.imgview.alpha = 1.0
    } completion: { (completed) in
      print("Completado...")
      otraAnimacion()
    }
    
    func otraAnimacion(){
      UIView.animate(withDuration: 1) {
        self.view.backgroundColor = UIColor.orange
        self.imgview.frame.origin.y = 20
        self.imgview.frame.size.width = self.imgview.frame.size.width / 2
        self.imgview.frame.size.height = self.imgview.frame.size.height / 2
        self.imgview.center.x = self.view.center.x
        self.txtFieldEmail.frame.origin.x = self.view.center.x - (self.txtFieldEmail.frame.size.width / 2)
        self.txtFieldContrasena.frame.origin.x = self.view.center.x - (self.txtFieldContrasena.frame.size.width / 2)
      } completion: { (completed) in
        print("Otra animacion completada...")
      }

    }

  }

}
