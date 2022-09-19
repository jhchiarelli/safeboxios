//
//  ViewController.swift
//  appbox
//
//  Created by Jorge Henrique Chiarelli on 19/09/22.
//

import UIKit

class LoginVC: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    

}

