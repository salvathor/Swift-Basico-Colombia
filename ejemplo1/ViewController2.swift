//
//  ViewController2.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 26/11/20.
//

import UIKit

class ViewController2: UIViewController {
  
  let loader = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
      initUI()
      crearProgress()
      creaPickerView()
    }

  func initUI(){
    
    //MARK:- Text View 1
    let str : NSString = "Suspendisse potenti. Nunc luctus lacinia luctus. Nunc non nisl justo. Mauris condimentum eu neque eu volutpat. Aenean venenatis lectus a mauris congue, vel vestibulum dolor aliquet. Vivamus facilisis congue sapien id euismod. Praesent ex velit, rutrum quis tempus eu, tempus vitae est. Cras at ex rutrum, tincidunt mauris eu, ultrices tellus. Sed condimentum tempus elit tempor egestas. Proin suscipit quis purus rutrum aliquet. Etiam accumsan, augue sit amet sollicitudin mattis, ante dui pretium diam, a egestas purus leo non ex. Nullam diam elit, pharetra in nisi in, fermentum scelerisque mauris. Ut condimentum, nibh a convallis pretium, quam orci blandit tellus, sed sagittis dui est quis nisl. Pellentesque nisl erat, porttitor eget auctor a, tempor sed leo. Praesent velit tellus, facilisis vitae risus et, vulputate sagittis tellus. Nam non interdum nibh, in varius elit."
    
    let txtView = UITextView(frame: CGRect(x: 5, y: 150, width: 250, height: 50))
    txtView.text = str as String
    txtView.isEditable = false
    self.view.addSubview(txtView)
    
    //MARK:- Text View 2
    
    //Nuevo formato para todo el texto
    let mutableStr = NSMutableAttributedString(string: str as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18)])
    
    //Filtro de un texto en particular
    let boldStr = str.range(of: "Suspendisse potenti")
    
    //Nuevo formato para texto filtrado
    mutableStr.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Helvetica Neue", size: 30), range: boldStr)
    
    let txtView2 = UITextView(frame: CGRect(x: 10, y: 200, width: 200, height: 50))
    txtView2.attributedText = mutableStr
    self.view.addSubview(txtView2)
    
    //MARK:- Slider
    let slider = UISlider(frame: CGRect(x: 15, y: 400, width: 280, height: 20))
    slider.minimumValue = 10
    slider.maximumValue = 90
    slider.isContinuous = false
    slider.value = 20
    slider.tintColor = UIColor.red
    slider.addTarget(self, action: #selector(sliderNewValue(sender:)), for: .valueChanged)
    self.view.addSubview(slider)
    
    //MARK:- UISwitch
    let mySwitch = UISwitch(frame: CGRect(x: 15, y: 450, width: 0, height: 0))
    mySwitch.isOn = false
    //mySwitch.setOn(true, animated: true)
    mySwitch.addTarget(self, action: #selector(switchNewValue(sender:)), for: .valueChanged)
    self.view.addSubview(mySwitch)
    
    //MARK:- Activity Indicator
    loader.center = self.view.center
    loader.hidesWhenStopped = true
    //loader.startAnimating()
    self.view.addSubview(loader)
    
    //MARK:- Stepper
    let myStepper = UIStepper(frame: CGRect(x: 50, y: 300, width: 0, height: 0))
    myStepper.wraps = false // Regresa al valor inicial cuando termina su valor maximo.
    myStepper.autorepeat = true // Avanzar valores mientras esta presionado el boton.
    //myStepper.maximumValue = 10
    myStepper.addTarget(self, action: #selector(stepperNewValue(sender:)), for: .valueChanged)
    self.view.addSubview(myStepper)
    
    //MARK:- DatePicker
    let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    datePicker.center.x = self.view.center.x
    datePicker.center.y = self.view.center.y
    datePicker.datePickerMode = .dateAndTime
    datePicker.backgroundColor = UIColor.orange
    datePicker.addTarget(self, action: #selector(datePickerNewValue(sender:)), for: .valueChanged)
    self.view.addSubview(datePicker)
    
  }
  
  //MARK:- PickerView
  let options = ["Enero", "Febrero", "Marzo"]
  
  let pickerView = UIPickerView()
  
  let btn = UIButton()
  
  func creaPickerView(){
    pickerView.frame = CGRect(x: 0, y: 350, width: self.view.bounds.width, height: 200)
    pickerView.dataSource = self
    pickerView.delegate = self
    pickerView.backgroundColor = UIColor.white
    pickerView.isHidden = true
    
    self.view.addSubview(pickerView)
    
    //Adicional
    
    btn.frame = CGRect(x: 0, y: 50, width: 100, height: 20)
    btn.setTitle("Seleccione un mes", for: .normal)
    btn.addTarget(self, action: #selector(showPickerView), for: .touchUpInside)
    btn.backgroundColor = UIColor.blue
    self.view.addSubview(btn)
    
  }
  
  @objc func showPickerView(){
    pickerView.isHidden = false
  }
  
  //MARK:- Funcion para DatePicker
  
  @objc func datePickerNewValue(sender:UIDatePicker){
    print(sender.date)
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy hh:mm a"
    let fechaFormatter = formatter.string(from: sender.date)
    print(fechaFormatter)
  }
  
  //MARK:- Funcion para Stepper
  
  @objc func stepperNewValue(sender:UIStepper){
    print(sender.value)
  }
  
  //MARK:- Progress View
  var seconds: Float = 0
  var timer = Timer()
  var myProgressView = UIProgressView(progressViewStyle: .default)
  
  func crearProgress(){
    myProgressView.frame.origin = CGPoint(x: 125, y: 525)
    myProgressView.frame.size = CGSize(width: 100, height: 150)
    myProgressView.progress = 0
    myProgressView.progressTintColor =  UIColor.red
    myProgressView.trackTintColor = UIColor.lightGray
    self.view.addSubview(myProgressView)
    exTimer()
  }
  
  func exTimer(){
    timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: "Track 1", repeats: true)
  }
  
  @objc func updateProgress(){
    seconds += 1
    if seconds <= 10 {
      myProgressView.setProgress(seconds / 10, animated: true)
      print("\(seconds * 10)%")
    }else{
      if let song = timer.userInfo{
        print("Se ha descargado la cancion: \(song)")
      }
      timer.invalidate()
    }
  }
  
  //MARK:- Funcion Switch
  @objc func switchNewValue(sender: UISwitch){
    print(sender.isOn)
    if sender.isOn{
      loader.startAnimating()
    }else{
      loader.stopAnimating()
    }
  }
  
  //MARK:- Funcion Slider
  @objc func sliderNewValue(sender: UISlider){
    print(sender.value)
  }
  
}

extension ViewController2 : UIPickerViewDataSource{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return options.count
  }
}

extension ViewController2: UIPickerViewDelegate{
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return options[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print("Se selecciono el indice \(row)")
    print("Se selecciono la opcion \(options[row])")
    btn.setTitle(options[row], for: .normal)
    pickerView.isHidden = true
  }
}
