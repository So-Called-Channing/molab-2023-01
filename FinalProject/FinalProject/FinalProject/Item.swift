//
//  Item.swift
//  FinalProject
//
//  Created by Channing Yang on 2/29/24.
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
