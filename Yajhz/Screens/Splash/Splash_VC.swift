//
//  Splash_VC.swift
//  Yajhz
//
//  Created by MAC on 15/11/2023.
//

import UIKit

class Splash_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(navigate), userInfo: nil, repeats: false)
        
    }
    
   @objc func navigate() {
       // Check if the user is logged in
       if !isLoggedIn().isEmpty {
           navigateToHome() // User is logged in, show the main content
       } else {
           navigateToSignIn() // User is not logged in, show the login screen
       }
    }
    
    func isLoggedIn() -> String {
        return UserDefaults.standard.string(forKey: ConstantsStrings.USER_NAME) ?? ""
    }
    
    func navigateToHome() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: ConstantsStrings.HOME_VC) as! Home_VC
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }
    
    func navigateToSignIn(){
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: ConstantsStrings.SIHNIN_VC) as! SignIn_VC
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }
    
}
