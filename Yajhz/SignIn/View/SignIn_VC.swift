//
//  SignIn_VC.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit

class SignIn_VC: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var img_bg: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var logInView: UIView!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var forgetPassordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesignConfig()
        signUpLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToSignUp))
        signUpLabel.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: - IBActions

    @IBAction func logInBtn(_ sender: Any) {
    }
    
    //MARK: - Methods

    func setDesignConfig(){
        setSignUpBGViewDesign()
        setSignUpLabelViewDesign()
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

        logInView.layer.cornerRadius = cornerRadius
        logInView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] // Bottom corners only

        // Add shadow to the view
        logInView.layer.shadowColor = UIColor.black.cgColor
        logInView.layer.shadowOpacity = 0.2
        logInView.layer.shadowOffset = CGSize(width: 2, height: 2)
        logInView.layer.shadowRadius = 4
    }
    
    func setSignUpBGViewDesign(){
        
        let cornerRadius: CGFloat = 50

        bgView.layer.cornerRadius = cornerRadius
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Top corners only
    }
    
    @objc func navigateToSignUp(){
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUp_VC") as! SignUp_VC
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
}
