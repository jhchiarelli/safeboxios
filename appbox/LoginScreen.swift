//
//  LoginScreen.swift
//  appbox
//
//  Created by Jorge Henrique Chiarelli on 19/09/22.
//

import UIKit
import SnapKit

class LoginScreen: UIView {
    
    var contador: Int = 0

    lazy var subImageView: UIImageView =  {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGLogin")
        return image
    }()
    
    lazy var logoAppImageView: UIImageView =  {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "safe")
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Safe Box"
        return label
    }()
    
    lazy var loginDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Suas contas seguras no novo app"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor =  UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSMutableAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor =  UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSMutableAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(red: 213/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        
        return button
    }()
    
    lazy var subLoginView: UIImageView = {
      let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGGradient")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
       return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signInMetamaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor /* #cf00c0 */
        view.layer.borderWidth = 2
       return view
    }()
    
    lazy var signInMetamaskImageView:UIImageView = {
      let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var signInMetamaskLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com a Metamask"
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.subImageView)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.loginLabel)
        self.addSubview(self.loginDescription)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.recoverPasswordButton)
        self.addSubview(self.subLoginView)
        self.addSubview(self.loginButton)
        self.addSubview(self.lineView)
        self.addSubview(self.signInMetamaskView)
        self.signInMetamaskView.addSubview(self.signInMetamaskImageView)
        self.signInMetamaskView.addSubview(self.signInMetamaskLabel)
        self.configConstarintsSnapkit()
        self.configConstraints()
        self.configGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configGesture() {
        let tapButton = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tapButton.numberOfTapsRequired = 1
        tapButton.numberOfTouchesRequired = 1
        self.signInMetamaskView.addGestureRecognizer(tapButton)
    }
    
    @objc
    func handleTap(_ sender: UITapGestureRecognizer) {
        contador += 1
        print("Valor: \(contador)")
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
//            self.subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.subImageView.topAnchor.constraint(equalTo: self.topAnchor),
//            self.subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 108),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 108),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 16),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.loginDescription.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 4),
            self.loginDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.loginDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.loginDescription.bottomAnchor, constant: 32),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 39),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 16),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 39),
            
            self.recoverPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 16),
            self.recoverPasswordButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            
            self.recoverPasswordButton.heightAnchor.constraint(equalToConstant: 12),
            
            self.loginButton.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor,constant: 36),
            self.loginButton.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 41),
            
            self.subLoginView.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.subLoginView.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.subLoginView.topAnchor.constraint(equalTo: self.loginButton.topAnchor),
            self.subLoginView.bottomAnchor.constraint(equalTo: self.loginButton.bottomAnchor),
            
            self.lineView.topAnchor.constraint(equalTo: self.subLoginView.bottomAnchor,constant: 48),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 64),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            self.signInMetamaskView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor,constant: 48),
            self.signInMetamaskView.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.signInMetamaskView.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.signInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            
            self.signInMetamaskImageView.leadingAnchor.constraint(equalTo: self.signInMetamaskView.leadingAnchor,constant: 53),
            self.signInMetamaskImageView.centerYAnchor.constraint(equalTo: self.signInMetamaskView.centerYAnchor),
            self.signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            self.signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            self.signInMetamaskLabel.leadingAnchor.constraint(equalTo: self.signInMetamaskImageView.trailingAnchor,constant: 17),
            self.signInMetamaskLabel.centerYAnchor.constraint(equalTo: self.signInMetamaskView.centerYAnchor),
        ])
    }
    
    private func configConstarintsSnapkit() {
        self.configSubImage()
    }
    
    private func configSubImage() {
        self.subImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}
