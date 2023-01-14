//
//  UserSettingsDictionary.swift
//  Momenzo
//
//  Created by Flo Vouin on 16/07/2018.
//  Copyright © 2018 Flo. All rights reserved.
//

import Foundation

/**
    Settings that can be modified by the user.
*/
@objcMembers
class UserSettingsDictionary: YepObject {
    /**
        The dictionary containing the settings.
    */
    private(set) var settings: [String: Any] = [:]

    init(id: String, settings: [String: Any]) {
        self.settings = settings
        super.init(id: id)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
