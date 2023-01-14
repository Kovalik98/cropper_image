//
//  Video.swift
//  Momenzo
//
//  Created by Flo Vouin on 30/09/16.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation

/**
    A video recorded by the user, corresponding to a shot.
*/
@objcMembers
class Video: YepObject {
    /**
        The shot ID corresponding to this video.
    */
    private(set) var shot: String = ""
    /**
        The duration of this video, in milliseconds.
    */
    private(set) var duration: Int = 0
    /**
        The ID of the user who recorded the video.
    */
    private(set) var author: String = ""
    /**
        The subject of the video (e.g. the name of a car, the name / address of a house, etc.).
    */
    private(set) var subject: String = ""
    /**
        The time and date when this video was recorded.
    */
    private(set) var date: Date = Date()

    init(id: String, shot: String, duration: Int, author: String, subject: String, date: Date) {
        self.shot = shot
        self.duration = duration
        self.author = author
        self.subject = subject
        self.date = date
        super.init(id: id)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 17 {
            dictionary["duration"] = Int(0)
        }

        return true
    }

    func setting(duration: Int) -> Video {
        return Video(id: self.id, shot: self.shot, duration: duration, author: self.author, subject: self.subject,
                     date: self.date)
    }
}
