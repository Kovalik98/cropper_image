//
//  Credentials.swift
//  Momenzo
//
//  Created by Flo Vouin on 12/08/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

/**
    A Momenzo user and the related credentials needed for API access.
*/
@objcMembers
class Credentials: YepObject {
    static let kCredentialsID = "credentials"

    /**
        The user who successfully logged in.
    */
    private(set) var user: User = User(id: "", name: "", phone: "", companies: [], date: Date())
    /**
        The JSON Web Token.
    */
    private(set) var token: String = ""
    /**
        The date at which the JWT expires.
    */
    private(set) var tokenExpirationDate: Date = Date()
    /**
        The token to use to obtain a new JWT.
    */
    private(set) var refreshToken: String = ""

    init(user: User, token: String, tokenExpirationDate: Date, refreshToken: String) {
        self.user = user
        self.token = token
        self.tokenExpirationDate = tokenExpirationDate
        self.refreshToken = refreshToken
        super.init(id: Credentials.kCredentialsID)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
