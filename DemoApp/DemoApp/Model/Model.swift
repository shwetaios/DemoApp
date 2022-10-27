//
//  Model.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation

struct RoomResponse: Decodable {
    let createdAt: String?
    let isOccupied: Bool
    let maxOccupancy: Int?
    let id: String?
}

struct PeopleResponse: Decodable {
    let createdAt: String?
    let firstName: String?
    let avatar: String?
    let lastName: String?
    let email: String?
    let jobtitle: String?
    let favouriteColor: String?
    let id: String?
}

