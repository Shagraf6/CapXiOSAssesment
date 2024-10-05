//
//  BaseViewController.swift
//  StylezUser
//
//  Created by MACBOOK on 2/21/24.
//

import UIKit

class BaseViewController: UIViewController {
  
    var deviceToken = ""
    let dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
}



//MARK: - handling inidicator
extension BaseViewController{
    
    func getIndicator(controller:UIViewController) -> UIActivityIndicatorView{
        let loadingIndicator = UIActivityIndicatorView(frame: self.view.bounds)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();
        
        controller.view.addSubview(loadingIndicator)
        
        return loadingIndicator
    }
}


