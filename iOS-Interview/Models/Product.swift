//
//  Product.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

struct Product: Codable, CoreDataTable {
    let id: String
    let title: String
    let description: String
    let price: Decimal
    let user: User
    let create_at: Date
}
