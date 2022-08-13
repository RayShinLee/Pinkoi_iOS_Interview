//
//  UserTable.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

extension CoreDataStorer {
    struct UserTable: CoreDataTable {
        let id: String
        let field_name: String
        let field_email: String
        let field_is_designer: Bool
        let created_at: Date
    }
}

extension CoreDataStorer.UserTable {
    var user: User {
            return User(id: id,
                        name: field_name,
                        email: field_email,
                        isDesigner: field_is_designer,
                        create_at: created_at)
        }
        
        init(user: User, createdDate: Date = Date()) {
            self.id = user.id
            self.field_name = user.name
            self.field_email = user.email
            self.field_is_designer = user.isDesigner
            self.created_at = createdDate
        }
}
