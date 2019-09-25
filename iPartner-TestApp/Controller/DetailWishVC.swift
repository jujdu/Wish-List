//
//  DetailWishVC.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 26/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class DetailWishVC: UIViewController {

    @IBOutlet weak var bodyLbl: UILabel!
    
    var wish: Wish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bodyLbl.text = wish.body
    }
    
}
