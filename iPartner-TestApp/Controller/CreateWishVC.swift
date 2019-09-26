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
    
    private let api = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDoneBtn()
    }
    
    private func configureDoneBtn() {
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
            let sessionID = UserDefaults.standard.string(forKey: UserDefaultsKeys.sessionID)
            print(sessionID)
            guard let session = sessionID else { return }
            let parameters = ["a": "add_entry",
                              "session": session,
                              "body": text]

            api.postEntries(url: URL_BASE, parameters: parameters) { (_) in }
            dismiss(animated: true, completion: nil)
        }
    }
    

    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
