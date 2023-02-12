//
//  AuthViewController.swift
//  LouBank
//
//  Created by Paolo on 23/01/23.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var beClientButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.transform = menuButton.transform.rotated(by: .pi/2)
        
        setupButtons([logInButton, beClientButton])
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToPasscode", sender: nil)
    }
    
    func setupButtons(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 22
        }
    }
}
