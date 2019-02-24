//
//  ViewController.swift
//  ethanol or gasoline
//
//  Created by Almir Santos on 23/02/19.
//  Copyright © 2019 Almir Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gasolinePrice: UITextField!
    @IBOutlet weak var resultLegend: UILabel!
    @IBOutlet weak var ethanolPrice: UITextField!
    
    @IBAction func calculate(_ sender: UIButton) {
        if let priceEthanol = ethanolPrice.text {
            if let priceGasoline = gasolinePrice.text {
                let validation = self.validateFields( priceEthanol: priceEthanol, priceGasoline: priceGasoline)
                if validation {
                    self.chooseBetterPrice( priceEthanol: priceEthanol, priceGasoline: priceGasoline)
                } else {
                    resultLegend.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    
    func chooseBetterPrice(priceEthanol: String, priceGasoline: String) -> Void{
        if let ethanol = Double(priceEthanol) {
            if let gasoline = Double(priceGasoline){
                /* (ethanol/ gasoline)
                    if result => 0.7 gasoline is the better choose
                    else ethanol is the better cooshe
                 */
                let result  = ethanol / gasoline
                if(result >= 0.7){
                    resultLegend.text = "Melhor ultilizar gasolina!"
                }else {
                    resultLegend.text = "Melhor ultilizar alcool!"
                }
            }
        }
    }
    func validateFields(priceEthanol: String, priceGasoline: String) -> Bool{
        var fieldsValidateds = true
        if priceEthanol.isEmpty && priceGasoline.isEmpty{
            fieldsValidateds = false
        }
        return fieldsValidateds
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

