//
//  WishCell.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 25/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class WishCell: UITableViewCell {

    @IBOutlet weak var daLbl: UILabel!
    @IBOutlet weak var dmLbl: UILabel!
    @IBOutlet weak var wishLbl: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateUI(wish: Wish?) {
        guard let wish = wish else { return }
        daLbl.text = "da: \(wish.da)"
        
        if wish.dm == wish.da {
            dmLbl.isHidden = true
        } else {
            dmLbl.text = "dm: \(wish.dm)"
        }
        
        wishLbl.text = wish.body
    }
    
}
