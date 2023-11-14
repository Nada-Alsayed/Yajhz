//
//  SignUp_VC.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit

class SignUp_VC: UIViewController {
    
    //MARK: - IBOutlet

    @IBOutlet weak var signUpView: UIView!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var img_bg: UIImageView!
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesignConfig()
        loginLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToSignIn))
        loginLabel.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: - IBActions
    
    @IBAction func signUpBtn(_ sender: Any) {
    }
    
    //MARK: - Methods
    func setDesignConfig(){
        setSignUpLabelViewDesign()
        setSignUpBGViewDesign()
        setTransparentLayer()
    }
    
    func setTransparentLayer(){
        // Create a transparent layer with a custom color
        let customColor = UIColor(red: 244.0/255.0, green: 198.0/255.0, blue: 118.0/255.0, alpha: 0.15) // Adjust the RGB and alpha values as needed
        let transparentLayer = UIView(frame: img_bg.bounds)
        transparentLayer.backgroundColor = customColor
        
        // Add the transparent layer above the image view
        img_bg.addSubview(transparentLayer)
    }
    
    func setSignUpLabelViewDesign(){
        let cornerRadius: CGFloat = 40

        signUpView.layer.cornerRadius = cornerRadius
        signUpView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] // Bottom corners only

        // Add shadow to the view
        signUpView.layer.shadowColor = UIColor.black.cgColor
        signUpView.layer.shadowOpacity = 0.2
        signUpView.layer.shadowOffset = CGSize(width: 2, height: 2)
        signUpView.layer.shadowRadius = 4
    }
    
    func setSignUpBGViewDesign(){
        
        let cornerRadius: CGFloat = 50

        bgView.layer.cornerRadius = cornerRadius
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Top corners only
    }
    
    @objc func navigateToSignIn(){
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignIn_VC") as! SignIn_VC
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }
}
