//
//  YellowViewController.swift
//  Move ViewController
//
//  Created by Nick Liu on 2023/5/31.
//
import UIKit

class YellowViewController: UIViewController {
    
    var nextButton = UIButton()
    var presentButton = UIButton()
    var isPresenting = false {
        didSet {
            showCloseButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 255/255, green: 242/255, blue: 204/255, alpha: 1)
        setupUI()

        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(presentPage), for: .touchUpInside)
        
        
        
    }
    
    func showCloseButton() {
        if isPresenting {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        }
    }
    
    func setupUI() {
        
        var nextConfiguration = UIButton.Configuration.filled()
        nextConfiguration.cornerStyle = .capsule
        nextConfiguration.baseBackgroundColor = UIColor(red: 255/255, green: 217/255, blue: 90/255, alpha: 1)
        nextConfiguration.baseForegroundColor = .black
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
        let greenViewController = GreenViewController()
        navigationController?.pushViewController(greenViewController, animated: true)
    }
    
    @objc func presentPage() {
        let greenViewController = GreenViewController()
        greenViewController.isPresenting = true
        
        let navController = UINavigationController(rootViewController: greenViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }
}
