//
//  Montage.swift
//  Momenzo
//
//  Created by Flo Vouin on 30/09/16.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation

/**
    Describes a concrete realisation of a template, composed of recorded videos.
*/
@objcMembers
class Montage: YepObject {
    static let kMontageNameQuestionID = "projectName"

    /**
        The ID of the template used for this montage.
    */
    private(set) var template: String = ""
    /**
        The time and date when the montage was created.
    */
    private(set) var date: Date = Date()
    /**
        The subject of the montage (e.g. the name of a car, the name / address of a house, etc.).
    */
    private(set) var subject: String = ""
    /**
        The ID of the user who filmed the videos and created the montage.
    */
    private(set) var author: String = ""
    /**
        The videos included in this montage.
    */
    private(set) var videos: [String] = []
    /**
        The answers to the template questions.
    */
    private(set) var answers: [String: String] = [:]
    /**
        The ID of the soundtrack to use for the montage.
    */
    private(set) var soundtrack: String = ""
    /**
        The answers to the question of each video.
    */
    private(set) var videoAnswers: [String] = []

    init(id: String, template: String, date: Date, subject: String, author: String, videos: [String],
         answers: [String: String], soundtrack: String, videoAnswers: [String]) {
        self.template = template
        self.date = date
        self.subject = subject
        self.author = author
        self.videos = videos
        self.answers = answers
        self.soundtrack = soundtrack
        self.videoAnswers = videoAnswers
        super.init(id: id)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setting(template: String, soundtrack: String) -> Montage {
        return Montage(id: self.id, template: template, date: self.date, subject: self.subject, author: self.author,
                       videos: self.videos, answers: self.answers, soundtrack: soundtrack,
                       videoAnswers: self.videoAnswers)
    }

    func setting(video: String, at index: Int) -> Montage {
        var videos = self.videos
        videos[index] = video
        return Montage(id: self.id, template: self.template, date: self.date, subject: self.subject,
                       author: self.author, videos: videos, answers: self.answers, soundtrack: self.soundtrack,
                       videoAnswers: self.videoAnswers)
    }

    func setting(videoOrder: [Int]) -> Montage {
        let videos = videoOrder.map { self.videos[$0] }
        let videoAnswers = videoOrder.map { self.videoAnswers[$0] }
        return Montage(id: self.id, template: self.template, date: self.date, subject: self.subject,
                       author: self.author, videos: videos, answers: self.answers, soundtrack: self.soundtrack,
                       videoAnswers: videoAnswers)
    }

    func setting(answers updates: [String: String]) -> Montage {
        var answers = self.answers
        for (key, value) in updates {
            answers[key] = value
        }
        return Montage(id: self.id, template: self.template, date: self.date, subject: self.subject,
                       author: self.author, videos: self.videos, answers: answers, soundtrack: self.soundtrack,
                       videoAnswers: self.videoAnswers)
    }

    func appending(video: String) -> Montage {
        var videos = self.videos
        var videoAnswers = self.videoAnswers
        videos.append(video)
        videoAnswers.append("")
        return Montage(id: self.id, template: self.template, date: self.date, subject: self.subject,
                       author: self.author, videos: videos, answers: self.answers, soundtrack: self.soundtrack,
                       videoAnswers: videoAnswers)
    }

    func setting(videoAnswersIn answersDic: [String: String]) -> Montage {
        var videoAnswers = self.videoAnswers
        for (video, answer) in answersDic {
            guard let videoIndex = self.videos.firstIndex(of: video) else { continue }

            videoAnswers[videoIndex] = answer
        }
        return Montage(id: self.id, template: self.template, date: self.date, subject: self.subject,
                       author: self.author, videos: self.videos, answers: self.answers, soundtrack: self.soundtrack,
                       videoAnswers: videoAnswers)
    }

    func removing(videoAt index: Int) -> Montage {
        var videos = self.videos
        var videoAnswers = self.videoAnswers
        videos.remove(at: index)
        videoAnswers.remove(at: index)
        return Montage(id: self.id, template: self.template, date: self.date, subject: self.subject,
                       author: self.author, videos: videos, answers: self.answers, soundtrack: self.soundtrack,
                       videoAnswers: videoAnswers)
    }

    /**
        The name of the montage, obtained from the `answers`. `nil` if the specific answer cannot be found.
    */
    var nameFromAnswers: String? {
        get {
            guard let name = answers[Montage.kMontageNameQuestionID]?.trimmingCharacters(in: .whitespacesAndNewlines),
                !name.isEmpty else { return nil }

            return name
        }
    }

    /**
        If it's defined, returns the soundtrack for the montage. Otherwise, returns the first soundtrack listed in
        the given template.

        - Parameters:
            - orDefaultIn: The template from which a soundtrack ID can be obtained.

        - Returns: A soundtrack ID, or `nil` for no soundtrack.
    */
    func soundtrack(orDefaultIn template: Template? = nil) -> String? {
        return self.soundtrack.isEmpty ? template?.soundtracks.first?.id : self.soundtrack
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 4 {
            dictionary["soundtrack"] = ""
        }

        if version < 5 {
            let videoCount = (dictionary["videos"] as? [String])?.count ?? 0
            dictionary["videoAnswers"] = [String](repeating: "", count: videoCount)
        }

        return true
    }
}
