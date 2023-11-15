//
//  AlertCreator.swift
//  Yajhz
//
//  Created by MAC on 15/11/2023.
//

import Foundation
import UIKit

class AlertCreator{
     func showToast(controller:UIViewController,message:String,seconds:Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds){
            alert.dismiss(animated: true)
        }
    }
    
     func showAlertWithAction(title: String?,titleAction: String?,titleNoAction: String?, message: String?, viewController: UIViewController, compilitionHandler: @escaping () -> Void){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: titleAction, style: .destructive) {_ in
                compilitionHandler()
            }
            let noAction = UIAlertAction(title: titleNoAction, style: .default ,handler: nil)
                alertController.addAction(okAction)
                alertController.addAction(noAction)
                viewController.present(alertController, animated: true, completion: nil)
    }
}
