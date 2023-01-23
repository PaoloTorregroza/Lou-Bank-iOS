//
//  ViewController.swift
//  LouBank
//
//  Created by Paolo on 23/01/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "goToAuth", sender: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performSegue(withIdentifier: "goToAuth", sender: nil)
    }
}

