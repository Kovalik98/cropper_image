//
//  User.swift
//  Momenzo
//
//  Created by Flo Vouin on 09/08/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

/**
    A Momenzo user.
*/
@objcMembers
class User: YepObject {
    /**
        The name of the user.
    */
    private(set) var name: String = ""
    /**
        The phone number of the user.
    */
    private(set) var phone: String = ""
    /**
        The companies to which the user belongs.
    */
    private(set) var companies: [String] = []
    /**
        The date when the user account was created.
    */
    private(set) var date: Date = Date()

    init(id: String, name: String, phone: String, companies: [String], date: Date) {
        self.name = name
        self.phone = phone
        self.companies = companies
        self.date = date
        super.init(id: id)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
