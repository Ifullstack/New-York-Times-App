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
        Task {
            do {
                guard let decodable = try await sut?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "emailed",
                                                                                                     period: "7",
                                                                                                     sharedType: "")) else {
                    return
                }
                // THEN
                XCTAssertNotNil(decodable)
                expt.fulfill()
            } catch {
                // THEN
                XCTAssertNil(error)
                expt.fulfill()
            }
        }
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultSuccess() {
        let expt = self.expectation(description: "I expect a success result and inflate decodable data")
        
        // WHEN
        Task {
            do {
                guard let decodable = try await sut?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "shared",
                                                                                                     period: "7",
                                                                                                     sharedType: "facebook")) else {
                    return
                }
                // THEN
                XCTAssertNotNil(decodable)
                expt.fulfill()
            } catch {
                // THEN
                XCTAssertNil(error)
                expt.fulfill()
            }
        }
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailure() {
        let expt = self.expectation(description: "I expect a failure error")
        
        // WHEN
        Task {
            do {
                guard let decodable = try await sutMock?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "shared",
                                                                                                     period: "7",
                                                                                                     sharedType: "facebook")) else {
                    return
                }
                // THEN
                XCTAssertNil(decodable)
                expt.fulfill()
            } catch {
                // THEN
                XCTAssertNotNil(error)
                expt.fulfill()
            }
        }
        
        wait(for: [expt], timeout: 10.0)
    }
    
    func testFetchPosts_whenIsPostTypeSharedAndResultFailureForInvalidUrl() {
        let expt = self.expectation(description: "I expect a failure error for invalid url")
        
        // WHEN
        Task {
            do {
                guard let decodable = try await sut?.fetchPosts(parameters: FetchPostsRespositoryParameters(postType: "sharedssss",
                                                                                                     period: "7",
                                                                                                     sharedType: "facebook")) else {
                    return
                }
                // THEN
                XCTAssertNil(decodable)
                expt.fulfill()
            } catch {
                // THEN
                XCTAssertNotNil(error)
                expt.fulfill()
            }
        }
        
        wait(for: [expt], timeout: 10.0)
    }
}
