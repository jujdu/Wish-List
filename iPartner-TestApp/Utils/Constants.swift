//
//  Constants.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 25/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

public let URL_BASE = "https://bnet.i-partner.ru/testAPI/"
public let HEADERS = ["token": "MIoSpS4-bu-Qv3dRkV"]

struct Identifiers {
    static let WishCell = "WishCell"
}

struct Segues {
    static let ToDetailWishVC = "ToDetailWishVC"
}

struct UserDefaultsKeys {
    static let sessionID = "SessionID"
}
