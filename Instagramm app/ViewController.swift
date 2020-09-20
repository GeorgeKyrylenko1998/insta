//
//  ViewController.swift
//  Instagramm app
//
//  Created by George Kyrylenko on 20.09.2020.
//  Copyright © 2020 TestApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchUserAction(_ sender: Any) {
        guard !(usernameTextField.text?.isEmpty ?? true) else {
            let alert = UIAlertController(title: "Please enter username", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            return
        }
        
        guard let instagramBioController = self.storyboard?.instantiateViewController(withIdentifier: "InstagramBioController") as? InstagramBioController else {return}
        instagramBioController.username = usernameTextField.text
        self.navigationController?.pushViewController(instagramBioController, animated: true)
    }
    
    @IBAction func tapOutside(_ sender: Any) {
        self.view.endEditing(true)
    }
}

