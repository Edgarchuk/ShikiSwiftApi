import XCTest
import AppKit
@testable import ShikiSwiftApi

final class ShikiSwiftApiTests: XCTestCase {
    func testExample() async throws {
        let result = try await AnimeAPI.getAnime(withId: 1)
        print(result)
    }
    
    func testCreateURLForImage() async throws {
        if let image = try await AnimeAPI.getAnimes(withParametors: nil).first?.image {
            _ = image.original.toURL()
        }
    }
}
