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
                UserDefaults.standard.set(root?.data?.name, forKey: ConstantsStrings.USER_NAME)
                self?.delegate?.navigateToHome()
            }else{
                AlertCreator().showToast(controller: controller, message: root?.message ?? "ERROR!", seconds: 2)
            }
        }
    }
}
