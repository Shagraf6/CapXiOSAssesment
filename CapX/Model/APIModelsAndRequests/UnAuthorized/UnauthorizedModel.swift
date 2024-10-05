//
//  UnauthorizedModel.swift
//  Bilz
//
//  Created by Me on 12/27/23.
//

import Foundation

// MARK: - PostModel
struct unAuthorizedModel: Codable {
    let status: Bool
    let message: String
    let errors: [String]?
}
