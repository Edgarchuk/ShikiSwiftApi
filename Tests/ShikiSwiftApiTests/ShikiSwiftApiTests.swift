import XCTest
import AppKit
@testable import ShikiSwiftApi

final class ShikiSwiftApiTests: XCTestCase {
    func testExample() async throws {
        _ = try await AnimeAPI.getAnimes(withParametors: nil)
    }
    
    func testCreateURLForImage() async throws {
        if let image = try await AnimeAPI.getAnimes(withParametors: nil).first?.image {
            _ = image.original.toURL()
        }
    }
}
