//
//  PopularAPIResponse.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import Foundation

struct PopularAPIResponse: Codable {
    let results: [Movie]
}
struct Movie: Codable {
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let release_date: String?
}
