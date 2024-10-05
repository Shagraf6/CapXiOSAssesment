//
//  Untitled.swift
//  CapX
//
//  Created by MACBOOK on 04/10/2024.
//

import Foundation
//import SwiftyJSON

struct GetStockInfoResource{
    
    func getStockInfo(request:stockInfoRequest,completionHandler:@escaping (_ details:StockInfoCodable?, _ errorMsg:String?)->()) {
        
        APIManager.shared.getRequest(modelType: StockInfoCodable.self, type: StockEndPoint.getStockInfo(symbol: request.symbol)) {
            
            result in
            
            switch result{
            case .success(let details):
                completionHandler(details,nil)
         
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

