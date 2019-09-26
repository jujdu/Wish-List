//
//  Extensions.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 26/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

extension String {
    func maxLength(length: Int) -> String {
        var str = self
        let nsString = str as NSString
        if nsString.length >= length {
            str = nsString.substring(with:
                NSRange(
                    location: 0,
                    length: nsString.length > length ? length : nsString.length)
            )
        }
        return  str
    }
}
