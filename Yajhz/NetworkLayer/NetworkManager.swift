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
    func postMethod(object: User, url: URL, completionHandler: @escaping (ResponseClient?, Error?) -> ()) {
        print(object)
        let parameters: [String: String?] = [
            "name": object.name,
            "email": object.email,
            "password": object.password,
            "phone": object.phone,
            "device_token": "12233454566787877"
        ]

        AF.request(url, method: .post, parameters: parameters, headers: headers)
        .validate(statusCode: 200..<300)
            .response { response in
              switch response.result {
              case .success(let data):
                do {
                    let result = try JSONDecoder().decode(ResponseClient.self,from: data!)
                    completionHandler(result,nil)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                }
                case.failure(let error):
                print(error.localizedDescription)
                    completionHandler(nil,error)
                }
            }
    }

    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () ){
                    
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil)
            .response { response in
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

