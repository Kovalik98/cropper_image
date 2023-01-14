//
//  TemplateSoundtrack.swift
//  Momenzo
//
//  Created by Flo Vouin on 13/12/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

/**
    A soundtrack that can be selected by the user.
*/
@objcMembers
class TemplateSoundtrack: YepObject {
    /**
        The name of the soundtrack.
    */
    private(set) var title: String = ""
    /**
        The text that can be displayed during the video when this soundtrack is selected.
    */
    private(set) var overlayText: String = ""

    init(id: String, title: String, overlayText: String) {
        self.title = title
        self.overlayText = overlayText
        super.init(id: id)
    }
    
    init(overlay: defaultSceneSoundtrack) {
        self.title = overlay.title!
        self.overlayText = overlay.overlayText!
        super.init(id: overlay.id!)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
