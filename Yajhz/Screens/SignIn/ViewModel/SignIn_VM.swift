//
//  SignIn_VM.swift
//  Yajhz
//
//  Created by MAC on 15/11/2023.
//

import Foundation
import UIKit

class SignInViewModel{
    
    //MARK: - Properties
    weak var delegate: NavigationDelegate?
    private var networkInstance : NetworkManagerProtocol!
        
    init(networkInstance: NetworkManagerProtocol!){
           self.networkInstance = networkInstance
    }
    
    //MARK: - Methods
    func isClientExist(cleint : Cleint , controller:UIViewController){
        networkInstance.postMethod(object: cleint, url: URLCreator().logIn())
        { [weak self] (root: ResponseCleint?, err) in
            if ( (root?.message == NetworkMessage.doneSuccessfullyAR.rawValue) || (root?.message  == NetworkMessage.doneSuccessfullyEN.rawValue) ){
                print("i am in the vm true")
                UserDefaults.standard.set(root?.data[0].name, forKey: ConstantsStrings.USER_NAME)
                self?.delegate?.navigateToHome()
            }else{
                print("i am in the vm false")
                AlertCreator().showToast(controller: controller, message: root?.message ?? "No message", seconds: 2)
            }
        }
    }
}
//func isClientExist(cleint : Cleint , controller:UIViewController){
//    networkInstance.postMethod(object: cleint, url: URLCreator().logIn()) { isSuccessd, message, name in
//        if isSuccessd {
//            if ( (message == NetworkMessage.doneSuccessfullyAR.rawValue) || (message  == NetworkMessage.doneSuccessfullyEN.rawValue) ){
//               // print("i am in the vm true")
//                print("i am in the vm true")
//                AlertCreator().showToast(controller: controller, message: message ?? "No message", seconds: 2)
//                UserDefaults.standard.set(name, forKey: ConstantsStrings.USER_NAME)
//                self.delegate?.navigateToHome()
//            }else{
//                print("i am in the vm vvv")
//                AlertCreator().showToast(controller: controller, message: message ?? "No message", seconds: 2)
//            }
//        } else {
//            //print("i am in the vm mjj")
//            AlertCreator().showToast(controller: controller, message: message ?? "No message", seconds: 2)
//        }
//    }
//}
