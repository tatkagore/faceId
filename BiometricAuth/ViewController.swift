//
//  ViewController.swift
//  BiometricAuth
//
//  Created by Tatiana Simmer on 20/11/2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = UILabel(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 50))
        text.text = "Application Locked"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(text)
        
        let lineView = UIView(frame: CGRect(x: 50, y: text.frame.origin.y + text.frame.size.height + 5, width: view.bounds.width - 100, height: 2))
        lineView.backgroundColor = .systemRed
        view.addSubview(lineView)
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 190, width: 100, height: 100))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "chestClosed")
        view.addSubview(imageView)
        imageView.center.x = view.center.x
        
        let openButton = UIButton(frame: CGRect(x: 50, y: 400, width: 200, height: 50))
        view.addSubview(openButton)
        openButton.center = view.center
        openButton.setTitle("Open", for: .normal)
        openButton.backgroundColor = .systemGreen
        openButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        openButton.setTitleColor(.white, for: .normal)
        openButton.addTarget(self, action: #selector(didTapOpenButton), for: .touchUpInside)
    }
    
    @objc func didTapOpenButton() {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authorise with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let alert = UIAlertController(title: "Failed to Auth",
                                                      message: "You can't use this feature",
                                                      preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss",
                                                      style: .cancel,
                                                      handler: nil))
                        self?.present(alert, animated: true)
                        return
                    }
                    
                    // show other screen
                    // Authentication successful, present UnlockedViewController
                    let unlockedVC = UnlockedViewController()
                    unlockedVC.modalPresentationStyle = .fullScreen
                    self?.present(unlockedVC, animated: true)
                }
            }
        }
        else {
            // Can't use
            print(3)
            let alert = UIAlertController(title: "Unavailable",
                                          message: "You can't use this feature",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                                          style: .cancel,
                                          handler: nil))
            present(alert, animated: true)
        }
    }
    
}

