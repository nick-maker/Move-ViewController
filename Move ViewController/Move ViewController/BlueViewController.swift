//
//  YellowViewController.swift
//  Move ViewController
//
//  Created by Nick Liu on 2023/5/31.
//
import UIKit

class BlueViewController: UIViewController {
    var isPresenting = false {
        didSet {
            showCloseButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 166/255, green: 208/255, blue: 221/255, alpha: 1)
        
        showCloseButton()
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func showCloseButton() {
        if isPresenting {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        } else {
            let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
            navigationItem.leftBarButtonItem = backButton
        }
    }
    
    @objc func closeButtonTapped() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
