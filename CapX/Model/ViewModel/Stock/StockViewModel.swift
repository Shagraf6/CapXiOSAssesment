//
//  StockViewModel.swift
//  CapX
//
//  Created by MACBOOK on 04/10/2024.
//


import Foundation

// this validation is not actually requried
struct GetStockInfoViewModel{
    
    private let validation = ValidateRequest()
    private let resource = GetStockInfoResource()
 
    func getStockInfo(request: stockInfoRequest, completionHandler:@escaping (_ details:StockInfoCodable?, _ errorMsg:String?)->()) {
        
        let validationResult = validation.validate(request: request)
        
        if validationResult.success{
            
            resource.getStockInfo(request: request) { details, errorMsg  in
                
                completionHandler(details,errorMsg)
            }
        }
        else{
            completionHandler(nil,validationResult.errorMessage)
        }
    }
}

