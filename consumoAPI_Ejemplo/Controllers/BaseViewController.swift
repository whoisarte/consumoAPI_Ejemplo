//
//  BaseViewController.swift
//  consumoAPI_Ejemplo
//
//  Created by Artemio on 09/09/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    let activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.center = view.center
    }
    
    override func viewDidLayoutSubviews() {
        activityIndicatorView.frame = CGRect(x: view.frame.size.height / 2, y: view.frame.size.width / 2, width: 20, height: 20)
    }
    
    func activityIndicator() {
        activityIndicatorView.color = .gray
        activityIndicatorView.style = .large
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
}
