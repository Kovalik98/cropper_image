//
//  Template+Utilities.swift
//  Momenzo
//
//  Created by Flo Vouin on 07/11/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import MomenzoVideoEngine

struct SelectedTemplateVideos {
    /**
        Selected videos corresponding to the `shots` property of the `Template`.
    */
    let compulsoryVideos: [Video]
    /**
        Selected videos corresponding to the `genericShots` property of the `Template`.
    */
    let genericVideos: [Video]
    /**
        Selected videos that are left in the `Montage`, and were shot using one of the defined `availableExtraShots`.
    */
    let extraVideos: [Video]
}

extension Template {
    /**
        The required shots for this template, including available extra shots.
    */
    var requiredShots: [String] {
        get {
            return [String](Set<String>(self.shots).union(self.availableExtraShots))
        }
    }

    /**
        Returns the assets used in the template and that are required to generate the montage.

        - Returns: The list of asset IDs.
    */
    func requiredAssets() -> [String] {
        return Template.requiredAssets(in: [self])
    }

    /**
        Returns the assets used in the templates and that are required to generate the montages.

        - Parameters:
            - in: The templates.

        - Returns: The list of asset IDs.
    */
    static func requiredAssets(in templates: [Template]) -> [String] {
        var assets = Set<String>()
        for template in templates {
            assets.formUnion(template.overlays.map { $0.asset })
            // All shots that are not part of the shots that will be recorded (or generic shots) must be assets.
            assets.formUnion(template.scenes.flatMap { $0.shots.filter { !template.shots.contains($0) } })
            assets.formUnion(template.audioSegments.compactMap { !template.shots.contains($0.asset) ? $0.asset : nil })
            assets.formUnion(template.soundtracks.map { $0.id })

            for (shotID, extraShot) in template.shotProperties {
                assets.formUnion(extraShot.overlays.map { $0.asset })
                if extraShot.defaultScene.id != Scene.kInvalidID {
                    assets.formUnion(extraShot.defaultScene.shots.filter { shotID != $0 })
                    assets.formUnion(extraShot.audioSegments.compactMap { shotID != $0.asset ? $0.asset : nil })
                }
            }
        }
        return [String](assets)
    }

    /**
        Returns the videos that should be used for the template.
        Because the user can change between several template for a single montage, selecting the correct videos from
        the montage is not straightforward. The logic is as follows:
            - The compulsory videos are the first videos in the list that match `shots`.
            - The generic videos are the first videos (excluding compulsory videos) for each generic shot that match the
                generic shot conditions (duration).
            - The extra videos are all the videos that are left, and that were made using a shot specified in
                `availableExtraShots`.

        - Parameters:
            - in: The list of videos to choose from.
            - shots: The shots used by the videos and the template.

        - Returns: The selected videos.
    */
    func selectedVideos(in videos: [Video], shots: [Shot]) -> SelectedTemplateVideos? {
        let mmzVideos = videos.map { $0.mmzVideo(at: URL(fileURLWithPath: "/")) }
        let mmzShots = shots.map { $0.mmzShot }
        guard let mmzSelectedTemplateVideos =
            self.mmzTemplate.selectedVideos(in: mmzVideos, shots: mmzShots) else { return nil }

        let mapToVideos = { (mmzVideos: [MMZVideo]) -> [Video] in
            return mmzVideos.map { mmzVideo in videos.first(where: { $0.id == mmzVideo.id })! }
        }

        return SelectedTemplateVideos(compulsoryVideos: mapToVideos(mmzSelectedTemplateVideos.compulsoryVideos),
                                      genericVideos: mapToVideos(mmzSelectedTemplateVideos.genericVideos),
                                      extraVideos: mapToVideos(mmzSelectedTemplateVideos.extraVideos))
    }
}
