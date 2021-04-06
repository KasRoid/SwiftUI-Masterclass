//
//  Video.swift
//  Africa
//
//  Created by Kas Song on 2021/04/06.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
