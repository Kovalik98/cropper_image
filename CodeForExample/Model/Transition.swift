//
//  Transition.swift
//  Momenzo
//
//  Created by Flo Vouin on 10/10/2016.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation

/**
    Describes an instance of a transition used in a template: the unique ID for the transition type,
    and a dictionary of parameters.
*/
@objcMembers
class Transition: YepObject {
    /**
        A dictionay of parameters for the transition.
    */
    private(set) var parameters: [String: String] = [:]

    init(id: String, parameters: [String: String]) {
        self.parameters = parameters
        super.init(id: id)
    }
    
    init(overlay: _Transition) {
        
        self.parameters = [:]
        super.init(id: ExtraScenesTransitionID.transitionNone.rawValue)
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
