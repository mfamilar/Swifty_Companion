//
//  SearchViewController.swift
//  swiftyCompanion
//
//  Created by Marc FAMILARI on 10/17/17.
//  Copyright © 2017 Marc FAMILARI. All rights reserved.
//

import UIKit

protocol HandleAccesToken {
    func displayServerError()
}

class SearchViewController: UIViewController, HandleAccesToken {
    
    
    @IBAction func searchLoginAction(_ sender: UIButton) {
        guard let login = self.searchLoginTextField.text else {
            return
        }
        
        if UserDefaults.standard.value(forKey: Constants.accessToken) == nil {
            _ = GetAccessToken.init(delegate: self, login: login)
        } else {
            _ = GetUserInformations(delegate: self, login: login)
        }
    }
    
    
    @IBOutlet weak var searchLoginTextField: UITextField!
    @IBOutlet weak var searchLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: Constants.accessToken) == nil {
            _ = GetAccessToken.init(delegate: self, login: nil)
        }
        
        // Set corner radius for text field and button
        self.searchLoginTextField.layer.cornerRadius = 15
        self.searchLoginButton.layer.cornerRadius = 15
    }
    
    
    
    
    // MARK: - HandleAccesToken delegate
    
    func displayServerError() {
        let alertController = UIAlertController(title: "Error", message: "Can't get 'access token' from server", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}