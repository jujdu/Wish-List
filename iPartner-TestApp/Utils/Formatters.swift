//
//  Formatters.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 26/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

public func getStringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter.string(from: date)
}
