//
//  ViewController.swift
//  imc_viewcode
//
//  Created by Daniel Araujo on 23/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    let screen = FirstScreenViewController()
    
    override func loadView() {
        super.loadView()
        self.view = screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

