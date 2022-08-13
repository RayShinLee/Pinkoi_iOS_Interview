//
//  CoreDataStorer.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

final class CoreDataStorer {
    
    private let coreDateService: CoreDataService
    
    init(coreDateService: CoreDataService) {
        self.coreDateService = coreDateService
    }
}

extension CoreDataStorer {
    enum CoreDataStorerError: Error {
        case notFound
    }
}

extension CoreDataStorer {
    // TODO:
    // Step 1. Convert User to UserTable
    // Step 2. Save UserTable to CoreDataService (with .store(UserTable))
    func save(user: User) {
        // -- before refactor --//
        let userTable = UserTable(user: user)
        coreDateService.store(userTable)
        
        // -- after refactor --//
        coreDateService.store(user)
    }
    
    // TODO:
    // Step 1. Fetch user with specifically User.id
    // Step 1-1. if User.id is not exists in coreDateService than completion with notFound Failure
    // Step 1-2. if User.id is exists in coreDateService than convert it to User and completion with User Success
    func fetch(user: User, completion: @escaping (Result<User, CoreDataStorerError>) -> Void) {
        // -- before refactor --//
        coreDateService.fetchAll(UserTable.self) { userTables in
            guard let userTable = (userTables.first() { $0.id == user.id }) else {
                completion(.failure(.notFound))
                return
            }
            completion(.success(userTable.user))
        }
        
        // -- after refactor --//
        coreDateService.fetchAll(User.self) { users in
            guard let user = (users.first() { $0.id == user.id }) else {
                completion(.failure(.notFound))
                return
            }
            completion(.success(user))
        }
    }
}
