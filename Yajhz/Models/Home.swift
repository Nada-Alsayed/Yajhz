//
//  Home.swift
//  Yajhz
//
//  Created by MAC on 15/11/2023.
//

import Foundation

// MARK: - ResponseCategory
class ResponseCategory: Codable {
    let success: Bool
    let responseCode: Int
    let message: String
    let data: [Category]

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let image: String
    let active: Int
    let nameAr, nameEn: String
    
    init(){
        id = 0
        name = ""
        image = ""
        active = 0
        nameAr = ""
        nameEn = ""
    }
    enum CodingKeys: String, CodingKey {
        case id, name, image, active
        case nameAr = "name_ar"
        case nameEn = "name_en"
    }
}

// MARK: - ResponsePopular
class ResponsePopular: Codable {
    let success: Bool
    let responseCode: Int
    let message: String
    let data: [Popular]

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - Popular
struct Popular: Codable {
    let id: Int
    let name, email, phone: String
    let image: String
    let logo: String
    let distance: String
    let rate: String
    
    init(){
        id = 0
        name = ""
        phone = ""
        email = ""
        image = ""
        logo = ""
        distance = ""
        rate = ""
    }
}
