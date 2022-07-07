//
//  File.swift
//  test
//
//  Created by MacBook on 02.07.2022.
//

import UIKit


class SignInVC: UIViewController {
    
    let screen = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backGroundImageView)
        view.addSubview(leftImageView)
        view.addSubview(signButton)
        signButton.addSubview(buttonImageView)
        view.addSubview(createTextField)
        
        view.addSubview(logoView)
        view.addSubview(titleLabel)
        
        view.addSubview(timeLabel)
        view.addSubview(cloudView)
        view.addSubview(degreesLabel)
        view.addSubview(descriptionLabel)
        
        view.addSubview(subtitleLabel)
    }
    
    lazy var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 164, y: 41, width: 120, height: 20)
        lbl.font = UIFont(name: "AvenirNext-Medium", size: 25)
        lbl.text = "06:20 PM"
//        lbl.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var cloudView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: UIScreen.main.bounds.width - 94, y: 40, width: 19, height: 19)
        img.image = UIImage(named: "cloud")
        img.contentMode = .scaleAspectFit
        img.alpha = 1.0
        return img
    }()
    
    lazy var degreesLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 323, y: 40, width: 100, height: 20)
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 13.5)
        lbl.text = "34° C"
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 164, y: 76, width: 170, height: 20)
        lbl.font = UIFont(name: "AvenirNext-Medium", size: 13.5)
        lbl.text = "Nov.10.2020 | Wednesday"
        lbl.textColor = .darkTextColor
//        lbl.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        return lbl
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 165, y: 398, width: 200, height: 120)
        lbl.font = UIFont(name: "AvenirNext-Medium", size: 14.5)
        lbl.text = "Open An Account For Digital\nE-Wallet Solutions. Instant\nPayouts.\n\nJoin For Free."
        lbl.textColor = .darkTextColor
        lbl.numberOfLines = 5
        lbl.setLineHeight(lineHeight: 3)
//        lbl.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        return lbl
    }()

    lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.view.bounds
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .darkBlue
        return imageView
    }()
    
    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 4, width: 210, height: screen.height)
        imageView.image = UIImage(named: "onboarding")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var logoView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 165, y: 279, width: 64, height: 64)
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFit
//        img.transform = CGAffineTransform(rotationAngle: .pi)
        img.alpha = 1.0
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 166, y: 350, width: 100, height: 32)
        lbl.font = UIFont(name: "Ubuntu-Medium", size: 29)
        lbl.text = "eWalle"
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var signButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.frame = CGRect(x: (screen.width / 2) - 28, y: screen.height - 155, width: screen.width / 2, height: 60)
        button.setBackgroundColor(UIColor(red: 243/255, green: 175/255, blue: 78/255, alpha: 50), for: .normal)
        button.setBackgroundColor(UIColor(red: 123/255, green: 212/255, blue: 240/255, alpha: 50), for: .highlighted)
        button.addTarget(self, action: #selector(sign), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.9).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 20
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    @objc func sign() {
        let vc = UINavigationController(rootViewController: MenuController())
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true) {
        }
    }
    
    lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 145, y: 24, width: 25, height: 15)
        imageView.image = UIImage(named: "rightarrows")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var createTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: (screen.width / 2) - 2, y: screen.height - 130 + 50, width: screen.width / 2, height: 60)
        textField.text = "Create an account"
        textField.textColor = .white
        return textField
    }()
 
    
}
