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
        
        let dateDa = Date(timeIntervalSince1970: Double(wish.da) ?? 0)
        let dateDm = Date(timeIntervalSince1970: Double(wish.dm) ?? 0)
        
        let strDateDa = getStringFromDate(dateDa)
        let strDateDm = getStringFromDate(dateDm)
        
        daLbl.text = "da: \(strDateDa)"
        
        if wish.dm == wish.da {
            dmLbl.isHidden = true
        } else {
            dmLbl.isHidden = false
            dmLbl.text = "dm: \(strDateDm)"
        }
        
        wishLbl.text = wish.body.maxLength(length: 200)
    }
    
}
