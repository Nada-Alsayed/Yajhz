//
//  NetworkManagerInterface.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation

protocol NetworkManagerProtocol{
    
    func postMethod<T:Codable>(object: Cleint, url: URL, completionHandler: @escaping (T?,Error?) -> ()) 
    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () )
}
