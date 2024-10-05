//
//  Constants.swift
//  StylezUser
//
//  Created by MACBOOK on 2/29/24.
//

import Foundation
import UIKit


struct K{
    
    struct App{
        static let name = "CapX"
    }
    
    struct Color{
        static let accentColor = UIColor(named: "AccentColor")
    }
    
    struct DateFormats{
        
        static let dateLocale = "d/MMM/yyyy"
        static let _dateLocale = "dd-MM-yyyy"
        static let timeLocale = "hh:mm a"
        static let defaultFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    struct placeHolderImage{
        
    }
    
    struct UserDefaultsKeys{
        
    }
    
    struct Error{
        static let someThingWentWrong = "Something went wrong try again..."
        static let someThingWentWrongAfterAday = "Something went wrong, Please try again tomorrow, maybe daily limit reached"
     
        static let netWorkError = "network Error"
        static let enterSymbol = "Enter Symbol"
        static let enterCorrectSymbol = "Please enter correct symbol"
        static let dailyLimitREachedMSg = "Daily limit reached. Please try again tomorrow."
     }
    
    struct MYStrings{
        static let symbol = "Symbol"
        static let NetworkError = "Network Error"
    }
    
}
