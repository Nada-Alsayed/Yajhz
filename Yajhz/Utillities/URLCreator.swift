//
//  URLCreator.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation

class URLCreator {
    
    //MARK: - properties
    private var endPoint = ""
    private let base_url = "https://yogahez.mountasher.online/api"
    
    //MARK: - Methods
    func getORPostCleint() -> URL{
        endPoint = "/client-register"
        return URL(string: base_url + endPoint)!
    }
    
    func getCategories() -> URL{
        endPoint = "/base-categories"
        return URL(string: base_url + endPoint)!
    }
    
    func getPopular ()-> URL{
        endPoint = "/popular-sellers?lat=0.0&lng=0.0&filter=1"
        return URL(string: base_url + endPoint)!
    }
    
    func logIn() -> URL{
        endPoint = "/login"
        return URL(string: base_url + endPoint)!
    }
    
}
