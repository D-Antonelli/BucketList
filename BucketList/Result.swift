//
//  Result.swift
//  BucketList
//
//  Created by Derya Antonelli on 15/12/2022.
//

import Foundation

struct FetchResult: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
