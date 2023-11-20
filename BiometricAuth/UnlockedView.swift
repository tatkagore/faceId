//
//  Unlocked View.swift
//  BiometricAuth
//
//  Created by Tatiana Simmer on 20/11/2023.
//

import Foundation
import UIKit

class UnlockedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let text = UILabel(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 50))
        text.text = "Application Unlocked"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(text)
        
        let lineView = UIView(frame: CGRect(x: 50, y: text.frame.origin.y + text.frame.size.height + 5, width: view.bounds.width - 100, height: 2))
        lineView.backgroundColor = .systemGreen
        view.addSubview(lineView)
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 190, width: 100, height: 100))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "chestOpen")
        view.addSubview(imageView)
        imageView.center.x = view.center.x
        
        let openButton = UIButton(frame: CGRect(x: 50, y: 400, width: 200, height: 50))
        view.addSubview(openButton)
        openButton.center = view.center
        openButton.setTitle("Lock", for: .normal)
        openButton.backgroundColor = .systemRed
        openButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        openButton.setTitleColor(.white, for: .normal)
        openButton.addTarget(self, action: #selector(didTapLockButton), for: .touchUpInside)
        
    }
    
    @objc func didTapLockButton() {
        self.dismiss(animated: true, completion: nil)
        
    }
}
