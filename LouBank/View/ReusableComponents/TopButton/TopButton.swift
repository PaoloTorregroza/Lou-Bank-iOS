//
//  TopButton.swift
//  LouBank
//
//  Created by Paolo Torregrosa on 11/02/23.
//

import UIKit

@IBDesignable class TopButton: UIButton {
    
    @IBInspectable var btnImage: UIImage = UIImage(systemName: "square.and.arrow.up")! {
        didSet {
            self.setImage(btnImage, for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func prepareForInterfaceBuilder() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.clipsToBounds = true
        self.setTitle("", for: .normal)
        self.backgroundColor = UIColor(named: "gray4")
        self.tintColor = .white
    }
}
