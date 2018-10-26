//
//  post.swift
//  microposter
//
//  Created by Akarsh Seggemu on 26.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import Foundation

struct post: Codable {
    var content: String
    var authorID: Int
    var id: Int
}
