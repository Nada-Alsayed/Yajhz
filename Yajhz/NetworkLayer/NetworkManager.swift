//
//  NetworkManager.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation
import Alamofire

class NetworkManager : NetworkManagerProtocol {
    
    //MARK: - Properties
    private let headers: HTTPHeaders = [
        "Accept": Constant.HEADER_TAYPE_VALUE,
        "Authorization": Constant.ACCESS_TOKEN,
        "lang": "en"]

    
    //MARK: - Methods
    func postMethod(object: Cleint, url: URL, completionHandler: @escaping (Bool) -> Void){
        print("xxxxx")
        let parameters: [String: String] = [
            "name": object.name,
            "email": object.email,
            "password": object.password,
            "phone": object.phone,
            "device_token": ""
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<300)  // Ensure status code is within the success range
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Success: \(value)")
                case .failure(let error):
                    if let statusCode = response.response?.statusCode {
                        print("Error: Status Code \(statusCode)")
                    }
                    print("Error Description: \(error)")
                }
            }
    }
    
    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () ){
                    
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).response { response in
            switch response.result{
            case .success(let data):
              do{
                  let jsonData = try JSONDecoder().decode(T.self, from: data!)
                  complition(jsonData,nil)
                 // debugPrint(jsonData)
             } catch {
                print(error.localizedDescription)
             }
            case .failure(let error):
                print(error.localizedDescription)
                complition(nil,error)
            }
        }
    }
    
}
