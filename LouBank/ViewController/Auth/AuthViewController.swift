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
        
        menuButton.layer.cornerRadius = menuButton.layer.bounds.width / 2
        menuButton.clipsToBounds = true
        menuButton.setTitle("", for: .normal)
        menuButton.transform = menuButton.transform.rotated(by: .pi/2)
        
        setupButtons([logInButton, beClientButton])
    }
    
    func setupButtons(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 22
        }
    }
}
