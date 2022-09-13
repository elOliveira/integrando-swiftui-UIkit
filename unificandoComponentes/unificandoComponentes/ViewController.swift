//
//  ViewController.swift
//  unificandoComponentes
//
//  Created by cit on 12/09/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        extractView()
    }

    func extractView(){
        
        let hostView = UIHostingController(rootView: Home())
        
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(hostView.view)
    
        // Constraints
        
        let contraints = [
            // Contraints
            
            hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //Height and width...
            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        
        self.view.addConstraints(contraints)
        
        
    }

}

