//
//  Petition.swift
//  HWSProject5
//
//  Created by Rupinder on 01/01/23.
//

import Foundation

struct Petitions: Codable {
    var results: [Petition]
}

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
