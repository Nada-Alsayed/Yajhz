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
        "Accept": ConstantsStrings.HEADER_TAYPE_VALUE,
        "Authorization": ConstantsStrings.ACCESS_TOKEN,
        "lang": "en"]

    
    //MARK: - Methods
    func postMethod<T: Codable>(object: Cleint, url: URL, completionHandler: @escaping (T?, Error?) -> ()) {
        print("xxxxx")

        let parameters: [String: String] = [
            "name": object.name,
            "email": object.email,
            "password": object.password,
            "phone": object.phone,
            "device_token": ""
        ]

        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .validate() // Ensure response status code is in the 2xx range
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        // Ensure 'data' is of type Data
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: data) else {
                            throw NSError(domain: "", code: 1, userInfo: nil)
                        }

                        let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                        completionHandler(decodedData, nil)
                    } catch {
                        print("catch " + error.localizedDescription)
                        completionHandler(nil, error)
                    }

                case .failure(let error):
                    print("fail " + error.localizedDescription)
                    completionHandler(nil, error)
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


//func postMethod(object: Cleint, url: URL, completionHandler: @escaping (Bool, String?, String?) -> Void) {
//        print("xxxxx")
//        let parameters: [String: String] = [
//            "name": object.name,
//            "email": object.email,
//            "password": object.password,
//            "phone": object.phone,
//            "device_token": ""
//        ]
//
//        AF.request(url, method: .post, parameters: parameters, headers: headers)
//            .validate(statusCode: 200..<300)  // Ensure status code is within the success range
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    if let json = value as? [String: Any] {
//                        let success = json["success"] as? Bool ?? false
//                        let message = json["message"] as? String ?? "Unknown error"
//                        guard let data = json["data"] as? [String: Any],
//                           let name = data["name"] as? String  else {
//                            print("Error accessing 'name' field.")
//                            return
//                        }
//                        completionHandler(success, message, name)
//                    } else {
//                        completionHandler(false, "Invalid response format","No data")
//                    }
//                case .failure(let error):
//                    if let statusCode = response.response?.statusCode {
//                        print("Error: Status Code \(statusCode)")
//                        if let data = response.data {
//                            let errorMessage = String(data: data, encoding: .utf8)
//                            print("Error Data: \(errorMessage ?? "No error data")")
//                            completionHandler(false, errorMessage,"")
//                        } else {
//                            completionHandler(false, "Unknown error","")
//                        }
//                    } else {
//                        print("Error Description: \(error)")
//                        completionHandler(false, "Unknown error","")
//                    }
//                }
//            }
//    }
