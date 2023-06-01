//
//  ViewController.swift
//  Move ViewController
//
//  Created by Nick Liu on 2023/5/31.
//

import UIKit

class RedViewController: UIViewController {

    var nextButton = UIButton()
    var presentButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 235/255, green: 83/255, blue: 83/255, alpha: 1)
        setupUI()
        
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(presentPage), for: .touchUpInside)
    }
    
    func setupUI() {
        
        var nextConfiguration = UIButton.Configuration.filled()
        nextConfiguration.cornerStyle = .capsule
        nextConfiguration.baseBackgroundColor = UIColor(red: 255/255, green: 235/255, blue: 235/255, alpha: 1)
        nextConfiguration.baseForegroundColor = .red
        nextConfiguration.title = "Next"
        nextButton = UIButton(configuration: nextConfiguration, primaryAction: nil)
        
        var presentConfiguration = UIButton.Configuration.filled()
        presentConfiguration.cornerStyle = .large
        presentConfiguration.baseBackgroundColor = UIColor(red: 109/255, green: 169/255, blue: 228/255, alpha: 1)
        presentConfiguration.baseForegroundColor = .white
        presentConfiguration.title = "Present"
        presentButton = UIButton(configuration: presentConfiguration, primaryAction: nil)
        
        [nextButton, presentButton].forEach { view.addSubview($0)}
        [nextButton, presentButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
        
        ])
        
    }

    @objc func nextPage() {
        let orangeViewController = OrangeViewController()
        navigationController?.pushViewController(orangeViewController, animated: true)
    }
    
    @objc func presentPage() {
        let orangeViewController = OrangeViewController()
        orangeViewController.isPresenting = true
        
        let navController = UINavigationController(rootViewController: orangeViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    func dismissToRedViewController() {
        view.window?.rootViewController = self
    }
    
}

