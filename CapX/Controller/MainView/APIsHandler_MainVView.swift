//
//  APIsHandler_MainVView.swift
//  CapX
//
//  Created by MACBOOK on 05/10/2024.
//

import UIKit


//MARK: - apis handler
extension ViewController{
    
    func clearData(){
        self.company = nil
        self.stock = nil
        
        self.lbl_CompanyName.text = "-"
        self.lbl_Percentage.text = "-"
        self.lbl_Price.text = "-"
    }
    
    func fetchData(){
        
        clearData()
        self.viewDetails.isHidden = true
        searchTextField.resignFirstResponder()
       
        let activityIndicator = getIndicator(controller: self)
        let symbol = searchTextField.text ?? ""
        
        dispatchGroup.enter()
        fetchStockData(symbol: symbol)
        dispatchGroup.enter()
        fetchCompanyData(symbol: symbol)
        
        dispatchGroup.notify(queue: .main){
            DispatchQueue.main.async{
               print("called dispatch notify")
                activityIndicator.removeFromSuperview()
                
                if self.errMsg != nil{
                    showAlert(title: "", subTitle: self.errMsg!, sender: self)
                }
                self.populateData(symbol: symbol)
                
                self.errMsg = nil
            }
        }
    }
}
    
//MARK: - Fetching data of stock and company
extension ViewController{
    
    func fetchStockData(symbol:String)
    {
        
        let request = stockInfoRequest(symbol: symbol)
        let viewModel = GetStockInfoViewModel()
        
        viewModel.getStockInfo(request: request) { stockDetails,err  in
            if err != nil{
                self.errMsg = err
            }
            else{
                self.stock = stockDetails
            }
            self.dispatchGroup.leave()
        }
    }
    
    
    func fetchCompanyData(symbol:String)
    {
        
        let request = stockInfoRequest(symbol: symbol)
        let viewModel = GetCompanyInfoViewModel()
        
        viewModel.getCompanyInfo(request: request) { companyDetails,err  in
            if err != nil{
            self.errMsg = err
            }
            else{
                self.company = companyDetails
            }
            
            self.dispatchGroup.leave()
        }
    }
    
}
    
    
    

