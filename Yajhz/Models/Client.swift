//
//  Client.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation

// MARK: - ResponseCategory
class ResponseCleint: Codable {
    let success: Bool
    let responseCode: Int
    let message: String
    let data: [Cleint]

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}
struct Cleint : Codable{
    let name, email, phone: String
    let password: String
    let image: String
}
