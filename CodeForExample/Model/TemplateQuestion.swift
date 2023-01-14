//
//  TemplateQuestion.swift
//  Momenzo
//
//  Created by Flo Vouin on 14/05/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

/**
    A question asked to the user about the subject to enhance the montage.
*/
@objcMembers
class TemplateQuestion: YepObject {
    static let kInvalidID = "invalid"

    static let kTypeNumeric = "numeric"
    static let kTypeText = "text"
    static let kTypeBinary = "binary"

    static let kBinaryQuestionOnValue = "true"

    /**
        The question the user will be asked.
    */
    private(set) var question: String = ""
    /**
        The expected type of answer (numeric or text).
    */
    private(set) var type: String = ""
    /**
        The maximum number of characters allowed in the answer.
    */
    private(set) var maxNumCharacters: Int = .max

    init(id: String, question: String, type: String, maxNumCharacters: Int) {
        self.question = question
        self.type = type
        self.maxNumCharacters = maxNumCharacters
        super.init(id: id)
    }
    
//    init(overlay: QuestionElement) {
//        self.question = overlay.question!
//        self.type = overlay.type!
//        self.maxNumCharacters = overlay.maxNumCharacters!
//        super.init(id: overlay.id!)
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    static let invalid = TemplateQuestion(id: kInvalidID, question: "", type: "", maxNumCharacters: .max)
}
