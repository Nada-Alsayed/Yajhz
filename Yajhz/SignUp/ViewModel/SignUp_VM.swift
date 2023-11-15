//
//  SignUp_VM.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation
class SignUPViewModel{
    
    private var network = NetworkManager()
    
    func addClient(cleint : Cleint){
        
        network.postMethod(object: cleint, url: URLCreator().getORPostCleint()) {isSuccessd in
            if isSuccessd {
                print("zozzzzz")

                print("cleint with name \(cleint.name) Added Successfully.")
            } else {
                print("cleint with name \(cleint.name) field to be added.")
            }
        }
        
    }
}
