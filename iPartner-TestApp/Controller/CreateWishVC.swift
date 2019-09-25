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
        configureDoneBtn()
    }
    
    func configureDoneBtn() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done,
                                      target: self,
                                      action: #selector(donePressed))
        
        toolBar.setItems([doneBtn], animated: false)
        textField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed() {
        view.endEditing(true)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if let text = textField.text, !text.isEmpty {
            guard let session = UserDefaults.standard.string(forKey: UserDefaultsKeys.sessionID) else { return }
            print(session)
            let parameters = ["a": "add_entry", "session": session, "body": text]

            api.postEntries(url: URL_BASE, parameters: parameters) { (_) in }
            dismiss(animated: true, completion: nil)
        }
    }
    

    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
