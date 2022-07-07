//
//  FetchPostUseCase+Test.swift
//  New York Times AppTests
//
//  Created by Cane Allesta on 23/2/22.
//

import XCTest
@testable import New_York_Times_App

class FetchPostRepositoryUseCaseTest: XCTestCase {
    
    // Given
    var sut: FetchPostsUseCase?
    var sutMockFailure: FetchPostsUseCase?
    var sutMockEmptyResult: FetchPostsUseCase?
    
    override func setUp() {
        super.setUp()
        sut = DefaultFetchPostsUseCase(fetchPostRepository: DefaultFetchPostsRepository())
        sutMockFailure = DefaultFetchPostsUseCase(fetchPostRepository: FetchPostsRepositoryFailureMock())
        sutMockEmptyResult = DefaultFetchPostsUseCase(fetchPostRepository: FetchPostsRepositoryMockEmptyResult())
    }
    
    override func tearDown() {
        sut = nil
        sutMockFailure = nil
        super.tearDown()
    }
    
    func testFetchPosts_whenIsPostTypeEmailedAndResultSuccess() {
        let expt = self.expectation(description: "I expect a success result and inflate Entity data")
        
        // WHEN
        sut?.execute(params: FetchPostsUseCaseParameters(postType: "emailed",
                                                         period: "7",
                                                         sharedType: ""),
                     completion: { result in
            switch result {
                case .success(let entity):
                    // THEN
                    XCTAssertNotNil(entity)
                case .failure(let error):
                    // THEN
                    XCTAssertNotNil(error)
            }
            
            expt.fulfill()
        })
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultSuccess() {
        let expt = self.expectation(description: "I expect a success result and inflate Entity data")
        
        // WHEN
        sut?.execute(params: FetchPostsUseCaseParameters(postType: "shared",
                                                         period: "7",
                                                         sharedType: "facebook"),
                     completion: { result in
            switch result {
                case .success(let entity):
                    // THEN
                    XCTAssertNotNil(entity)
                case .failure(let error):
                    // THEN
                    XCTAssertNil(error)
            }
            
            expt.fulfill()
        })
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailure() {
        let expt = self.expectation(description: "I expect a failure error")
        
        // WHEN
        sutMockFailure?.execute(params: FetchPostsUseCaseParameters(postType: "shared",
                                                         period: "7",
                                                         sharedType: "facebook"),
                     completion: { result in
            switch result {
                case .success(let decodable):
                    // THEN
                    XCTAssertNil(decodable)
                case .failure(let error):
                    // THEN
                    XCTAssertNotNil(error)
            }
            
            expt.fulfill()
        })
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailureForInvalidUrl() {
        let expt = self.expectation(description: "I expect a failure error")
        
        // WHEN
        sut?.execute(params: FetchPostsUseCaseParameters(postType: "sharedsssss",
                                                         period: "7",
                                                         sharedType: "facebook"),
                     completion: { result in
            switch result {
                case .success(let entity):
                    // THEN
                    XCTAssertNil(entity)
                case .failure(let error):
                    // THEN
                    XCTAssertNotNil(error)
            }
            
            expt.fulfill()
        })
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailureForEmptyResult() {
        let expt = self.expectation(description: "I expect a failure error")
        
        // WHEN
        sutMockEmptyResult?.execute(params: FetchPostsUseCaseParameters(postType: "shared",
                                                         period: "7",
                                                         sharedType: "facebook"),
                     completion: { result in
            switch result {
                case .success(let entity):
                    // THEN
                    XCTAssertNil(entity)
                case .failure(let error):
                    // THEN
                    XCTAssertNotNil(error)
            }
            
            expt.fulfill()
        })
        
        wait(for: [expt], timeout: 10.0)
    }
}
