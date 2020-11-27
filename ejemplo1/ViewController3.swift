//
//  ViewController3.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 26/11/20.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      crearScrollView()
      
    }
  
  func crearScrollView(){
    //Obteniendo las dimenciones de la pantalla
    let rect = view.bounds
    let scroll = UIScrollView(frame: rect)
    let img = UIImage(named: "flower.jpeg")
    let imgView = UIImageView(image: img)
    self.view.addSubview(scroll)
    
    //Separacion o margen entre la vista y la imagen (contenido)
    scroll.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    //Define el origen del scroll con referencia a la vista
    scroll.contentOffset = CGPoint(x: 500, y: 300)
    //Distancia de los indicadores de desplazamiento
    scroll.scrollIndicatorInsets = UIEdgeInsets(top: 100, left: 100, bottom: 0, right: 0)
    //Colocar la img como subvista
    scroll.addSubview(imgView)
    //Colocar el tamaño del contenido del scroll
    scroll.contentSize = img!.size
  }

}
