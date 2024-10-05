//
//  CommonFunction.swift
//  StylezUser
//
//  Created by Ajith Mohan on 10/08/23.
//

import Foundation
import UIKit
//import Kingfisher
    //import Indicate
//import SwiftyJSON


//
//func getErrMsg(json:JSON?)->String{
//    if let err = json?["message"].stringValue, err != ""  {
//        return err
//    }
//    else{
//        return     LocalizationSystem.sharedInstance.localizedStringForKey(key: K.Error.someThingWentWrong, comment: "")
//    }
//}


func showAlert(title:String,subTitle:String,sender:UIViewController){
    let alertController = UIAlertController(title: title, message: subTitle, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"Ok", style: UIAlertAction.Style.default) {
                UIAlertAction in
        }
    
    alertController.view.tintColor = K.Color.accentColor
    alertController.addAction(okAction)
    sender.present(alertController, animated: true, completion: nil)
}


func showNetworkError(sender:UIViewController){
    let alert = UIAlertController(title: "" , message: "Check your internet connection", preferredStyle: .alert)
    let OkButton = UIAlertAction(title: "Ok",style: .cancel) { (alert) -> Void in
    }
    alert.view.tintColor = K.Color.accentColor
    alert.addAction(OkButton)
    sender.present(alert, animated: true, completion: nil)
}


func animationScaleEffectSingle(view:UIView)
{
    DispatchQueue.main.async {
        view.transform = view.transform.scaledBy(x: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                view.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }, completion: nil)
    }
}

func animationScaleEffect(view:[UIView])
{
    DispatchQueue.main.async {
        for all in view{
            all.transform = all.transform.scaledBy(x: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                all.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
}
    
func formatPrice(price:Double) -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal          // Set defaults to the formatter that are common for showing decimal numbers
    numberFormatter.usesGroupingSeparator = true    // Enabled separator
    numberFormatter.groupingSeparator = ","         // Set the separator to "," (e.g. 1000000 = 1,000,000)
    numberFormatter.groupingSize = 3                // Set the digits between each separator
    numberFormatter.minimumFractionDigits = 2
    
    // maximum decimal digit, eg: to display 2.5021 as 2.50
    numberFormatter.maximumFractionDigits = 2
    
    // round up 21.586 to 21.59. But doesn't round up 21.582, making it 21.58
    numberFormatter.roundingMode = .halfUp
    
    return numberFormatter.string(for: price) ?? ""
}

