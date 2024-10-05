//
//  Company.swift
//  CapX
//
//  Created by MACBOOK on 04/10/2024.
//


import Foundation

struct CompanyInfo: Codable {
        let symbol: String?
        let name: String?
        let info:String?

        // Coding keys allow customization of variable names
        enum CodingKeys: String, CodingKey {
            case symbol = "Symbol"
            case name = "Name"
            case info = "Information"
        }
    }

