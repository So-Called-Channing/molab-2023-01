//
//  Item.swift
//  Week03 - Homework01
//
//  Created by Channing Yang on 2/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
