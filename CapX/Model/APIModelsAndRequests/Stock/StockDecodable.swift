//
//  StockDecodable.swift
//  CapX
//
//  Created by MACBOOK on 05/10/2024.
//

import Foundation

struct StockInfoCodable: Codable {
    let globalQuote: GlobalQuote?
    let info:String?

    enum CodingKeys: String, CodingKey {
        case globalQuote = "Global Quote"
        case info = "Information"
  }
}

struct GlobalQuote: Codable {
    let symbol: String?
    let price: String?
    let changePercent: String?

    enum CodingKeys: String, CodingKey {
        case symbol = "01. symbol"
        case price = "05. price"
        case changePercent = "10. change percent"
    }
}
