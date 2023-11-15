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
    
    func getPopular(lat:Float,lng:Float) -> URL{
        endPoint = "/popular-sellers?lat=\(lat)&lng=\(lng)&filter=1"
        return URL(string: base_url + endPoint)!
    }
    
    func getTrending(lat:Float,lng:Float) -> URL{
        endPoint = "/trending-sellers?lat=\(lat)&lng=\(lng)&filter=1"
        return URL(string: base_url + endPoint)!
    }
    
}
