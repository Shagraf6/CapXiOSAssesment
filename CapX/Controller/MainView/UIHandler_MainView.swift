//
//  UIHandler_MainView.swift
//  CapX
//
//  Created by MACBOOK on 05/10/2024.
//

import UIKit

//MARK: - UI handler
extension ViewController{
    
    func populateData(symbol:String){
        
        self.lbl_Symbol.text = "\(K.MYStrings.symbol): \(symbol)"
        
        if let company = self.company, let stock = self.stock{
            
            self.viewDetails.isHidden = false
            
            self.lbl_CompanyName.text = company.name
            
            if let globalStockDetails = stock.globalQuote{
                self.lbl_Percentage.text = globalStockDetails.changePercent
                self.lbl_Price.text = getFormatedPrice(price: globalStockDetails.price ?? "0.0")
            }
            
            if errMsg == nil{
                animationScaleEffectSingle(view: self.viewDetails)
            }
        }
    }
    
    func getFormatedPrice(price:String) -> String{
        
        if let doubleNumber = Double(price) {
            return formatPrice(price: doubleNumber)
        } else {
            print("Conversion failed")
            return price
        }
        
    }
}


//MARK: - textfield Handler
extension ViewController:UITextFieldDelegate{
    func configTf(){
        searchTextField.delegate = self
    }
}
