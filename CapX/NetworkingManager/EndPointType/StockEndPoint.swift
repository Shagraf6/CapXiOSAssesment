
import Foundation
import UIKit

struct API{
    
    struct Key{
        static var authToken = "O6EKPREGKY6UBV60"
      //  static var authToken = "demo"
    }
    
    struct slug{
    }
    
    // static let baseURL = ""//prd
    static let Base = "https://www.alphavantage.co/query"//dev
    static let Server = ""
    
    
}


enum StockEndPoint{
    case getStockInfo(symbol:String)
    case getCompanyInfo(symbol:String)
}

extension StockEndPoint:EndPointType{
    
    var path: String {
        switch self {
            // stock info
        case .getStockInfo(let symbol):
            return "\(API.Base)?function=GLOBAL_QUOTE&symbol=\(symbol)&apikey=\(API.Key.authToken)"
            //company info
        case .getCompanyInfo(let symbol):
            return "\(API.Base)?function=OVERVIEW&symbol=\(symbol)&apikey=\(API.Key.authToken)"
            
        }
    }
    
    var serverURL: String {
        return API.Server
    }
    
    var baseURL: String {
        return API.Base
    }
    
    var url: URL? {
        switch self{
        
        default:
            return "\(baseURL)\(serverURL)\(path)".getCleanedURL()
        }
    }
    
    var method: HTTPMethods {
        switch self {
            
        case .getCompanyInfo, .getStockInfo:
            return .get
            
        }
    }
    
    var headers: [String : String]? {
        return APIManager.commonHeaders
    }
    
    var body2: Encodable? {
        switch self{
            // case .uploadPOD(let orderID,let driverID,let signatureImg, let idImg, let prodImg):
            //   return uploadPODBody(orderID: orderID, driverID: driverID, signatureImg: signatureImg, productImg: prodImg, idCardImg: idImg)
            
        default:
            return nil
        }
    }
    
    var body: AnyHashable? {
        switch self {
            
        case .getCompanyInfo, .getStockInfo:
            return nil
            
        }
    }
}

extension StockEndPoint{
    
    
}

