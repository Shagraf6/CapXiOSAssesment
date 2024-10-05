//
//  ValidateStockRequest.swift
//  CapX
//
//  Created by MACBOOK on 04/10/2024.
//

import Foundation

struct ValidateRequest {
    
    func validate(request: stockInfoRequest) -> ValidationResult {
        
        if(request.symbol.isEmptyOrWhitespace() == false){
            return ValidationResult(success: true, errorMessage: nil)
        }
        else{
            
            if request.symbol.isEmptyOrWhitespace() == true{
                return ValidationResult(success: false, errorMessage: K.Error.enterSymbol)
           
            }
           
            return ValidationResult(success: false, errorMessage: K.Error.someThingWentWrong)
        }
        
    }
}
