//
//  YellowViewController.swift
//  Move ViewController
//
//  Created by Nick Liu on 2023/5/31.
//
import UIKit

class GreenViewController: UIViewController {
    
    var nextButton = UIButton()
    var presentButton = UIButton()
    var isPresenting = false {
        didSet {
            showCloseButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 218/255, green: 226/255, blue: 182/255, alpha: 1)
        setupUI()

        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(presentPage), for: .touchUpInside)
        showCloseButton()
    }
    
    func showCloseButton() {
        if isPresenting {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        } else {
            let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
            navigationItem.leftBarButtonItem = backButton
        }
    }
    
    func setupUI() {
        
        var nextConfiguration = UIButton.Configuration.filled()
        nextConfiguration.cornerStyle = .capsule
        nextConfiguration.baseBackgroundColor = UIColor(red: 27/255, green: 156/255, blue: 133/255, alpha: 1)
        nextConfiguration.baseForegroundColor = .white
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
        let blueViewController = BlueViewController()
        navigationController?.pushViewController(blueViewController, animated: true)
    }
    
    @objc func presentPage() {
        let blueViewController = BlueViewController()
        blueViewController.isPresenting = true
        blueViewController.modalPresentationStyle = .fullScreen
        let navController = UINavigationController(rootViewController: blueViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func backButtonTapped() {
        if let orangeViewController = navigationController?.viewControllers.first(where: { $0 is OrangeViewController }) {
                navigationController?.popToViewController(orangeViewController, animated: true)
            }
    }

}
