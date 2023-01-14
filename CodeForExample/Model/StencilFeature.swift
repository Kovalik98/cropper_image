//
//  StencilFeature.swift
//  Momenzo
//
//  Created by Flo Vouin on 06/11/2016.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation

/**
    Describes a single feature part of a stencil.
*/
@objcMembers
class StencilFeature: YepObject {
    static let kRectangleID = "@rectangle"
    static let kEllipseID = "@ellipse"
    static let kPositionXKey = "@posX"
    static let kPositionYKey = "@posY"
    static let kWidthKey = "@width"
    static let kHeightKey = "@height"
    static let kAngleKey = "@angle"

    static func rectangle(atX x: Double, andY y: Double, width: Double, height: Double) -> StencilFeature {
        return StencilFeature(id: kRectangleID, parameters: [
            kPositionXKey: String(x), kPositionYKey: String(y), kWidthKey: String(width), kHeightKey: String(height)
        ])
    }

    static func ellipse(atX x: Double, andY y: Double, width: Double, height: Double, angle: Double) -> StencilFeature {
        return StencilFeature(id: kEllipseID, parameters: [
            kPositionXKey: String(x), kPositionYKey: String(y), kWidthKey: String(width),
            kHeightKey: String(height), kAngleKey: String(angle)
        ])
    }

    /**
        A set of parameters for the feature.
    */
    private(set) var parameters: [String: String] = [:]

    init(id: String, parameters: [String: String]) {
        self.parameters = parameters
        super.init(id: id)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Getters
    private func double(forKey key: String) -> Double? {
        guard let string = self.parameters[key] else { return nil }
        return Double(string)
    }

    func positionX() -> Double? { return self.double(forKey: StencilFeature.kPositionXKey) }
    func positionY() -> Double? { return self.double(forKey: StencilFeature.kPositionYKey) }
    func width() -> Double? { return self.double(forKey: StencilFeature.kWidthKey) }
    func height() -> Double? { return self.double(forKey: StencilFeature.kHeightKey) }
    func angle() -> Double? { return self.double(forKey: StencilFeature.kAngleKey) }
}
