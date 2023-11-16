//
//  Client.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation

struct User : Codable{
    let name, email, phone: String
    let password: String
    
    init(email:String,password:String){
        self.email = email
        self.password = password
        self.name = ""
        self.phone = ""
    }
    
    init(name:String,email:String,password:String,phone:String){
        self.email = email
        self.password = password
        self.name = name
        self.phone = phone
    }
    
}


// MARK: - ResponseSignIn
struct ResponseClient: Codable {
    let success: Bool
    let responseCode: Int
    let message: String
    let data: Client?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - SignInUser
struct Client: Codable {
    let id: Int?
    let name, email, phone: String?
    let image: String?
    let type, status: Int?
    let balance: String?
    let token: String?
}

