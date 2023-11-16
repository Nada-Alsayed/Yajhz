//
//  NetworkManagerInterface.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation

protocol NetworkManagerProtocol{
    
    //MARK: - Methods
    func postMethod(object: User, url: URL, completionHandler: @escaping (ResponseClient?, Error?) -> ()) 
    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () )
}
