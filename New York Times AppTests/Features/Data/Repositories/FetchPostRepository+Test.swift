//
//  FetchPostRepository+Test.swift
//  New York Times AppTests
//
//  Created by Cane Allesta on 15/1/22.
//

import XCTest
@testable import New_York_Times_App

class FetchPostRepositoryTest: XCTestCase {

    // GIVEN
    var sut: FetchPostsRepository?
    var sutMock: FetchPostsRepository?
    
    override func setUp() {
        super.setUp()
        sut = DefaultFetchPostsRepository()
        sutMock = DefaultFetchPostsRepository(apiService: MockFailureApiService())
    }
    
    override func tearDown() {
        sut = nil
        sutMock = nil
        super.tearDown()
    }
    
    func testFetchPosts_whenIsPostTypeEmailedAndResultSuccess() {
        let expt = self.expectation(description: "I expect a success result and inflate decodable data")
        
        // WHEN
        sut?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "emailed",
                                                                   period: "7",
                                                                   sharedType: "")) { result in
            
            switch result {
                case .success(let decodable):
                    // THEN
                    XCTAssertNotNil(decodable)
                case .failure(let error):
                    // THEN
                    XCTAssertNil(error)
            }
            
            expt.fulfill()
        }
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultSuccess() {
        let expt = self.expectation(description: "I expect a success result and inflate decodable data")
        
        // WHEN
        sut?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "shared",
                                                                   period: "7",
                                                                   sharedType: "facebook")) { result in
            
            switch result {
                case .success(let decodable):
                    // THEN
                    XCTAssertNotNil(decodable)
                case .failure(let error):
                    // THEN
                    XCTAssertNil(error)
            }
            
            expt.fulfill()
        }
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailure() {
        let expt = self.expectation(description: "I expect a failure error")
        
        // WHEN
        sutMock?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "shared",
                                                                   period: "7",
                                                                   sharedType: "facebook")) { result in
            
            switch result {
                case .success(let decodable):
                    // THEN
                    XCTAssertNil(decodable)
                case .failure(let error):
                    // THEN
                    XCTAssertNotNil(error)
            }
            
            expt.fulfill()
        }
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailureForInvalidUrl() {
        let expt = self.expectation(description: "I expect a failure error")
        
        // WHEN
        sut?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "sharedssss",
                                                                   period: "7",
                                                                   sharedType: "facebook")) { result in
            
            switch result {
                case .success(let decodable):
                    // THEN
                    XCTAssertNil(decodable)
                case .failure(let error):
                    // THEN
                    XCTAssertNotNil(error)
            }
            
            expt.fulfill()
        }
        
        wait(for: [expt], timeout: 10.0)
    }
}
