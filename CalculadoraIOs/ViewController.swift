//
//  ViewController.swift
//  CalculadoraIOs
//
//  Created by Mizia Lima on 8/31/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet - conectar elementos visuais ao código
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnNumber0: UIButton!
    @IBOutlet weak var btnNumber1: UIButton!
    @IBOutlet weak var btnNumber2: UIButton!
    @IBOutlet weak var btnNumber3: UIButton!
    @IBOutlet weak var btnNumber4: UIButton!
    @IBOutlet weak var btnNumber5: UIButton!
    @IBOutlet weak var btnNumber6: UIButton!
    @IBOutlet weak var btnNumber7: UIButton!
    @IBOutlet weak var btnNumber8: UIButton!
    @IBOutlet weak var btnNumber9: UIButton!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnPlusMinus: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnDivided: UIButton!
    @IBOutlet weak var btnMult: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnComma: UIButton!
    
    //Variables
    var number1: Double?
    var number2: Double?
    var calcOperator: String?
    var hasComma: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //Aplica funcao arrendodar botoes
        roundAllButtons()
    }
    //Funcao para arredondar botoes
    func roundAllButtons(){
        // Apply Extension UI
        btnNumber0.round()
        btnNumber1.round()
        btnNumber2.round()
        btnNumber3.round()
        btnNumber4.round()
        btnNumber5.round()
        btnNumber6.round()
        btnNumber7.round()
        btnNumber8.round()
        btnNumber9.round()
        btnAC.round()
        btnPlusMinus.round()
        btnPercent.round()
        btnDivided.round()
        btnMult.round()
        btnMinus.round()
        btnPlus.round()
        btnEqual.round()
        btnComma.round()
    }
    
    
    //@IBAction - Conectar as ações ao código
    @IBAction func didTouchAC() {
        lblResult.text = "0"
        hasComma = false
    }
    
    @IBAction func didTouchPlusMinus(_ sender: Any) {
        
    }
    
    @IBAction func didTouchPercent(_ sender: Any) {
        number1 = Double(lblResult.text?.replacingOccurrences(of: ",", with: ".") ?? "")
        lblResult.text = String((number1 ?? 0) / 100)
        hasComma = false
    }
    
    @IBAction func didTouchDivided(_ sender: Any) {
        number1 = Double(lblResult.text?.replacingOccurrences(of: ",", with: ".") ?? "")
        calcOperator = "/"
        lblResult.text = "0"
        hasComma = false
    }
    
    @IBAction func didTouchMult(_ sender: Any) {
        number1 = Double(lblResult.text?.replacingOccurrences(of: ",", with: ".") ?? "")
        calcOperator = "*"
        lblResult.text = "0"
        hasComma = false
    }
    
    @IBAction func didTouchMinus(_ sender: Any) {
        number1 = Double(lblResult.text?.replacingOccurrences(of: ",", with: ".") ?? "")
        calcOperator = "-"
        lblResult.text = "0"
        hasComma = false
    }
    
    @IBAction func didTouchPlus(_ sender: Any) {
        number1 = Double(lblResult.text?.replacingOccurrences(of: ",", with: ".") ?? "")
        calcOperator = "+"
        lblResult.text = "0"
        hasComma = false
    }
    
    @IBAction func didTouchComma(_ sender: Any) {
        if hasComma == false {
            lblResult.text = (lblResult.text ?? "") + ","
            hasComma = true
        }
    }
    
    
    @IBAction func didTouchEqual(_ sender: Any) {
        number2 = Double(lblResult.text?.replacingOccurrences(of: ",", with: ".") ?? "")
        var result: Double?
        switch calcOperator {
        case "+":
            result = (number1 ?? 0) + (number2 ?? 0)
        case "-":
            result = (number1 ?? 0) - (number2 ?? 0)
        case "*":
            result = (number1 ?? 0) * (number2 ?? 0)
        case "/":
            result = (number1 ?? 0) / (number2 ?? 0)
        case "%":
            result = (number1 ?? 0) / 100
        default:
            break
        }
        formatResult(value: result!)
    }
    
    //Funcao para separar os valores de result inteiro / double
        func formatResult(value: Double) {
        if Int(exactly: value) == nil {
            lblResult.text = String(value).replacingOccurrences(of: ".", with: ",")
        } else {
            let intValue = Int(value)
            lblResult.text = "\(intValue)"
        }
    }
    @IBAction func numberAction(_ sender: UIButton) {
        if lblResult.text?.count == 9 {
            return
        }
        else if lblResult.text == "0" {
            lblResult.text = "\(sender.tag)"
        } else {
            lblResult.text = (lblResult.text ?? "") + String(sender.tag)
        }
    }
}
