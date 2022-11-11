//
//  APIModel.swift
//  Rick&Morty_TestTask
//
//  Created by Поляндий on 11.11.2022.
//

import Foundation

struct APIResponse: Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Location
    let image: String
}

struct Location: Codable {
    let name: String
}
