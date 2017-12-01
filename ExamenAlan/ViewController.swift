//
//  ViewController.swift
//  ExamenAlan
//
//  Created by DAM on 1/12/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UIPickerViewDelegate, UIPickerViewDataSource {

    //Medidas
    var medidasA:[String] = []
    var medidasB:[String] = []
    
    //Medida seleccionada
    var medidaUno = ""
    var medidaDos = ""
    
    //Variables de entorno grafico
    @IBOutlet weak var data: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        medidas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //Asignamos numero de filas a cada columna
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return medidasA.count
        } else{
            return medidasB.count
        }
    }
    
    //Asignamos valores a cada fila
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return medidasA[row]
        } else{
            return medidasB[row]
        }
    }
    
    //Obtenemos valor de cada columna
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            result.text = "hey"
            medidaUno = medidasA[row]
        } else{
            result.text = "estoy en la dos"
            medidaDos = medidasB[row]
        }
        
        if medidaUno != "" && medidaDos != "" {
            calcular()
        }
    }
    
    //Miramos cada columna a ver de que se pasa a que
    //Primero miramos la columna de la izquierda y luego la de la derecha
    //Si la de la derecha pertenece a la de la izquierda, se realiza el calculo y se assigna la imagen, de lo contrario, se muestra el error
    func calcular() {
        
        switch medidaUno {
        case "litro":
           print("litrito bueno")
            
           switch medidaDos {
            
           case "pintas":
            setImage(name: "litro")
            calcular(base: 2.11)
            
           case "cc":
            setImage(name:  "litro")
            calcular(base: 1000.00)
            
           default:
            error()
            
            }
            
        case "metro":
            print("metro bueno")
            
            switch medidaDos {
                
            case "pies":
                setImage(name: "metro")
                calcular(base: 3.28)
                
            case "yardas":
                setImage(name: "metro")
                calcular(base: 1.09)
                
            case "pulgadas":
                setImage(name: "metro")
                calcular(base: 39.37)
                
            default:
                error()
            }
            
        case "kilo":
            print("kilo bueno")
            
            switch medidaDos {
                
            case "libras":
                setImage(name: "kilo")
                calcular(base: 2.20)
                
            case "onzas":
                setImage(name: "kilo")
                calcular(base: 35.27)
                
            default:
                error()
                
            }
            
        default:
            print("eeeeeoo")
        }
        
    }
    
    //Asignamos las unidades de medida
    func medidas() {
        medidasA = ["metro","litro","kilo"]
        medidasB = ["pies","yardas","pulgadas","pintas","cc","libras","onzas"]
    }
    
    //En caso que no coincida la unidad asignamos la imagen
    func error(){
        image.image = UIImage(named: "error")
        result.text = "No convertible"
    }
    
    //Asignamos la imagen que toque
    func setImage(name:String) {
        image.image = UIImage(named: name)
    }
    
    //Calculo a hacer comprobando que lo escrito es un numero
    func calcular(base:Double) {
        
        let valor = Int(data.text!)
        
        if valor != nil {
            result.text = String((Double(valor!) * base))
        }
    }
}

