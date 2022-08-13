//
//  CoreDataStorerTests.swift
//  iOS-InterviewTests
//
//  Created by Harry Li on 2022/6/30.
//

import XCTest
@testable import iOS_Interview

// Maybe can replace with In-memory data store (https://www.codementor.io/@koromiko/unit-test-for-core-data-bl5bxqeh3)
class MockCoreDataService: CoreDataService {
    func store(_ table: CoreDataTable) {}
    
    func fetchAll<T>(_ table: T.Type, completion: @escaping ([T]) -> Void) where T : CoreDataTable {}
}


class CoreDataStorerTests: XCTestCase {
    var sut: CoreDataStorer!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CoreDataStorer(coreDateService: MockCoreDataService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveUser() throws {
        let user = User(id: "abc",
                        name: "Rayshin",
                        email: "lee.rayshin@gmail.com",
                        isDesigner: false)
        sut.save(user: user)
        sut.fetch(user: user) { result in
            switch result {
            case .success(let res):
                XCTAssert(res.id == user.id)
            case .failure:
                XCTAssert(false)
            }
        }
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
