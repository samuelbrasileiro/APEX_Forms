//
//  ViewController.swift
//  APEX Forms
//
//  Created by Samuel Brasileiro on 09/03/20.
//  Copyright © 2020 Samuel Brasileiro. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet var startFormButton: UIButton!
    
    @IBOutlet var detailsButton: UIButton!
    
    @IBOutlet var discoverButton: UIButton!
    
    @IBOutlet var showMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("dddd")
        self.navigationItem.hidesBackButton = true
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "power"), style: .done, target: self, action: #selector(exit)),animated: true)
        
    }
    @objc func exit(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func pressButton(_ sender: UIButton){
        if sender == startFormButton{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

