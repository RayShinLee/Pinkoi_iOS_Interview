//
//  User.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

struct User: Codable, CoreDataTable {
    let id: String
    let name: String
    let email: String
    let isDesigner: Bool
    let create_at: Date
}
