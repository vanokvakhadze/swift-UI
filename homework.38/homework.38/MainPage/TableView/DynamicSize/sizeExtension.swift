//
//  sizeExtension.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import Foundation
import SwiftUI

extension DynamicTypeSize {
    
    var customScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.2
        case .large, .xLarge, .xxLarge:
            return 0.9
        default:
           return 0.7
        }
    }
}
