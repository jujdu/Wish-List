//
//  CreateWishVC.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 25/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class CreateWishVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let api = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        if let text = textField.text, textField.text != nil {
            let parameters = ["a": "add_entry", "session": "VUFPv1ght0yTV4VqPU", "body": text]

            api.postEntries(url: URL_BASE, parameters: parameters) { (_) in }
            dismiss(animated: true, completion: nil)
        }
    }
    

    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
