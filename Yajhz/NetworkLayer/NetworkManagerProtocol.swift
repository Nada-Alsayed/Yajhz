//
//  NetworkManagerInterface.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation

protocol NetworkManagerProtocol{
    
    func postMethod(object: Cleint, url: URL, completionHandler: @escaping (Bool) -> Void)
    
    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () )
}
