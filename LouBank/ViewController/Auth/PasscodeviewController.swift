//
//  PasscodeviewController.swift
//  LouBank
//
//  Created by Paolo on 24/01/23.
//

import UIKit

class PasscodeViewController: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var backButton: TopButton!
    @IBOutlet weak var buttonsCollectionView: UICollectionView!
    @IBOutlet weak var progressDotsContainer: UIStackView!
    
    let viewModel = AuthViewModel()
    
    let numbers = [
        ("1"," "),
        ("2","ABC"),
        ("3","DEF"),
        ("4","GHI"),
        ("5","JKL"),
        ("6","MNO"),
        ("7","PQRS"),
        ("8","TUV"),
        ("9","WXYZ"),
        ("",""),
        ("0"," "),
        ("","")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.transform = menuButton.transform.rotated(by: .pi/2)
        setupProgressIndicator()
        setupCollectionView()
    }
    
    @IBAction func backPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func canNotLoginPressed() {
        let alert = UIAlertController(title: "Try this", message: "Try: 2 5 8 0 0", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func setupProgressIndicator() {
        for el in progressDotsContainer.arrangedSubviews {
            progressDotsContainer.removeArrangedSubview(el)
        }
        
        for index in 0..<5 {
            let indicator = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
            indicator.layer.cornerRadius = 5
            
            if index < viewModel.currentPassCode.count {
                indicator.backgroundColor = UIColor(named: "accentMint")
            } else {
                indicator.backgroundColor = UIColor(named: "gray3")
            }
            
            progressDotsContainer.addArrangedSubview(indicator)
        }
    }
    
    func setupCollectionView() {
        buttonsCollectionView.backgroundColor = .clear
        buttonsCollectionView.delegate = self
        buttonsCollectionView.dataSource = self
        let nib = UINib.init(nibName: "RoundedButtonCollectionViewCell", bundle: nil)
        buttonsCollectionView.register(nib, forCellWithReuseIdentifier: "numberButton")
    }
    
    func numberPressed(_ number: String) {
        viewModel.passCodeKeyPressed(number)
        
        if viewModel.currentPassCode.count == 5 {
            if viewModel.validatePassCode() {
                performSegue(withIdentifier: "goToHome", sender: nil)
            } else {
                viewModel.deletePassCode()
            }
        }
        
        setupProgressIndicator()
    }
}

extension PasscodeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = buttonsCollectionView.dequeueReusableCell(
            withReuseIdentifier: "numberButton",
            for: indexPath
        ) as! RoundedButtonCollectionViewCell
        
        let lettersString = numbers[indexPath.row].1
        let numberString = numbers[indexPath.row].0
        
        if numberString == "" && lettersString == "" {
            cell.button.backgroundColor = .clear
            cell.button.tintColor = .clear
            return cell
        }
        
        let attributedText = NSMutableAttributedString(string: "\(numberString)\n\(lettersString)")
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 36), range: NSRange(location: 0,length: 1))
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 10), range: NSRange(location: 1,length: lettersString.count+1))
        cell.button.setAttributedTitle(attributedText, for: .normal)
        
        cell.action = { self.numberPressed(numberString) }
        
        return cell
    }
    
    
}
