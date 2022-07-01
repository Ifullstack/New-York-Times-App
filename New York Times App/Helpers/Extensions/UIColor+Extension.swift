//
//  UIColor+Extension.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit
import SwiftUI

enum AssetsColors {
    case blurBackGround
    case primaryBackground
    case primaryTextColor
    case shadow
}

extension UIColor {
    static func colorCatalog(name: AssetsColors) -> UIColor? {
        switch name {
            case .blurBackGround:
                return UIColor(named: "BlurBackground")
            case .primaryBackground:
                return UIColor(named: "PrimaryBackground")
            case .primaryTextColor:
                return UIColor(named: "PrimaryTextColor")
            case .shadow:
                return UIColor(named: "ShadowColor")
        }
    }
}

extension Color {
    static let primaryTextColor = Color("PrimaryTextColor")
}
