//
//  ServiceResponse.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 25/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct BaseWish: Codable {
    var data: [[Wish]]
}

struct Wish: Codable {
    var body: String
    var da: String
    var dm: String
    var id: String
}

struct BaseNewSession: Codable {
    var data: NewSession
}

struct NewSession: Codable {
    let id: String
}
