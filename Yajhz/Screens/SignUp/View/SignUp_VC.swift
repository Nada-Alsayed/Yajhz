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
    
    var viewModel = SignUPViewModel(networkInstance: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setDesignConfig()
        loginLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToSignIn))
        loginLabel.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: - IBActions
    @IBAction func signUpBtn(_ sender: Any) {
        createCleint()
    }
    
    //MARK: - Methods
    func setDesignConfig(){
        setSignUpLabelViewDesign()
        setSignUpBGViewDesign()
        setTransparentLayer()
    }
    
    func setTransparentLayer(){
        // Create a transparent layer with a custom color
        let customColor = UIColor(red: 244.0/255.0, green: 198.0/255.0, blue: 118.0/255.0, alpha: 0.15) // Adjust the RGB and alpha values as needed to have transorency effect
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
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: ConstantsStrings.SIHNIN_VC) as! SignIn_VC
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }
    
    func createCleint(){
        let password = passwordTF.text
        let confirmPassword = confirmPasswordTF.text
        let email = emailTF.text
        let userName = userNameTF.text
        let phone = phoneTF.text
        
        if !(password?.isEmpty ?? true) &&
        !(confirmPassword?.isEmpty ?? true) &&
        !(email?.isEmpty ?? true) &&
        !(userName?.isEmpty ?? true) &&
        !(phone?.isEmpty ?? true) {
            if (password == confirmPassword ){
                let cleint = User(name: userName!, email: email!, password: password!, phone: phone!)
                viewModel.addClient(cleint: cleint,controller: self)
            }else{
                AlertCreator().showToast(controller: self, message: "The password and the confirm password don't match", seconds: 2)
            }
        }else{
            AlertCreator().showToast(controller: self, message:"Please enter all fields", seconds: 2)
        }
    }
}

//MARK: - Extension
extension SignUp_VC : NavigationDelegate{
    func navigateToHome() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: ConstantsStrings.HOME_VC) as! Home_VC
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }
}
