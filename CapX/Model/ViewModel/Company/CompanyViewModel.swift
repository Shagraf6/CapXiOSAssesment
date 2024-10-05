//
//  CompanyViewModel.swift
//  CapX
//
//  Created by MACBOOK on 05/10/2024.
//

import Foundation

// this validation is not actually requried
struct GetCompanyInfoViewModel{
    
    private let validation = ValidateRequest()
    private let resource = GetCompanyInfoResource()
 
    func getCompanyInfo(request: stockInfoRequest, completionHandler:@escaping (_ details:CompanyInfo?, _ errorMsg:String?)->()) {
        
        let validationResult = validation.validate(request: request)
        
        if validationResult.success{
            
            resource.getCompanyInfo(request: request) { details, errorMsg  in
                
                completionHandler(details,errorMsg)
            }
        }
        else{
            completionHandler(nil,validationResult.errorMessage)
        }
    }
}

