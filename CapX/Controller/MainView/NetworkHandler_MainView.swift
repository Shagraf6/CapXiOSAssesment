//
//  NetworkHandler_MainView.swift
//  CapX
//
//  Created by MACBOOK on 05/10/2024.
//



import UIKit
import Network


extension ViewController{
    
    func startNetworkMonitor() {
        
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isNetworkConnected = true
            }
            else if path.status == .unsatisfied {
                self.isNetworkConnected = false
            }
        }
        monitor?.start(queue: DispatchQueue.global(qos: .background))
    }
    
    
    func stopNetworkMonitor() {
        monitor?.cancel()
        monitor = nil
    }
    
}
