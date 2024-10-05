//
//  CompanyResource.swift
//  CapX
//
//  Created by MACBOOK on 05/10/2024.
//


import Foundation
//import SwiftyJSON

struct GetCompanyInfoResource{
    
    func getCompanyInfo(request:stockInfoRequest,completionHandler:@escaping (_ details:CompanyInfo?, _ errorMsg:String?)->()) {
        
        APIManager.shared.getRequest(modelType: CompanyInfo.self, type: StockEndPoint.getCompanyInfo(symbol: request.symbol)) {
            
            result in
            
            switch result{
            case .success(let companyDetails):
                
                print("infro : \(companyDetails.info)")
               completionHandler(companyDetails,nil)
         
            case .failure(let error):
              
                if case .unAuthorized(let i) = error {
                    completionHandler(nil,i)
                }
                else{
                    completionHandler(nil,error.localizedDescription)
                }
                
            }
            
        }
    }
    
}

