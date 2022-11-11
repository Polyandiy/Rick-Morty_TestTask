//
//  CellModel.swift
//  Rick&Morty_TestTask
//
//  Created by Поляндий on 11.11.2022.
//

import Foundation

class CharacterTableViewCellModel {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(name: String,
         status: String,
         species: String,
         gender: String,
         origin: String,
         imageURL: URL?
    ) {
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.origin = origin
        self.imageURL = imageURL
    }
}
