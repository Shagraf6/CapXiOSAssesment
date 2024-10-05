//
//  ViewController.swift
//  CapX
//
//  Created by MACBOOK on 04/10/2024.
//

import UIKit
import Network
class ViewController: BaseViewController {
    
    // Outlets connected from storyboard
    @IBOutlet weak var searchTextField: UITextField!
  
    @IBOutlet weak var lbl_CompanyName: UILabel!
    @IBOutlet weak var lbl_Percentage: UILabel!
    @IBOutlet weak var lbl_Price: UILabel!
    @IBOutlet weak var lbl_Symbol: UILabel!
    @IBOutlet weak var viewDetails: UIStackView!
  
    
    // local variables
    var errMsg:String?
    var company:CompanyInfo?
    var stock:StockInfoCodable?
    var monitor: NWPathMonitor?
   
    var networkAlert: UIAlertController?
    var dataFetched = false
   var isNetworkConnected = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configTf()
    }
    
    // Action triggered by the search button
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        isNetworkConnected ?
        fetchData() :
        showNetworkError(sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startNetworkMonitor()
    }
}

