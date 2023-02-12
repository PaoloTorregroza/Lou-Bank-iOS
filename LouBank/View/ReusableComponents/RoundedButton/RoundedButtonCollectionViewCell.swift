//
//  RoundedButtonCollectionViewCell.swift
//  LouBank
//
//  Created by Paolo Torregrosa on 12/02/23.
//

import UIKit

class RoundedButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    var action: () -> Void = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        button.layer.cornerRadius = button.layer.bounds.width / 2
    }

    @IBAction func buttonPressed(_ sender: Any) {
        action()
    }
}
