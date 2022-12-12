//
//  Location.swift
//  BucketList
//
//  Created by Derya Antonelli on 12/12/2022.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
