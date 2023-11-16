//
//  SignUp_VM.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import Foundation
import UIKit

protocol NavigationDelegate:AnyObject {
    func navigateToHome()
}

class SignUPViewModel{
    
    //MARK: - Properties
    weak var delegate: NavigationDelegate?
    private var networkInstance : NetworkManagerProtocol!
        
    init(networkInstance: NetworkManagerProtocol!){
           self.networkInstance = networkInstance
    }
    
    //MARK: - Methods
    func addClient(cleint : User , controller:UIViewController){
        networkInstance.postMethod(object: cleint, url: URLCreator().getORPostCleint()) { [weak self] (root:ResponseClient? , err:Error?) in
            if ( (root?.message == NetworkMessage.doneSuccessfullyAR.rawValue) || (root?.message  == NetworkMessage.doneSuccessfullyEN.rawValue) ){
              //  print("i am in the vm true")
                UserDefaults.standard.set(root?.data?.name, forKey: ConstantsStrings.USER_NAME)
                self?.delegate?.navigateToHome()
            }else{
              //  print("i am in the vm false")
                AlertCreator().showToast(controller: controller, message: root?.message ?? "ERROR!", seconds: 2)
            }
        }
    }
}

//            if isSuccessd {
//                if ( (message == NetworkMessage.doneSuccessfullyAR.rawValue) || (message  == NetworkMessage.doneSuccessfullyEN.rawValue) ){
//                   // print("i am in the vm true")
//                    UserDefaults.standard.set(name, forKey: ConstantsStrings.USER_NAME)
//                    self.delegate?.navigateToHome()
//                }else{
//                    //print("i am in the vm vvv")
//                    AlertCreator().showToast(controller: controller, message: message ?? "No message", seconds: 2)
//                }
//            } else {
//                //print("i am in the vm mjj")
//                AlertCreator().showToast(controller: controller, message: message ?? "No message", seconds: 2)
//            }
