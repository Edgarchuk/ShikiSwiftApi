import XCTest
import AppKit
@testable import ShikiSwiftApi

final class ShikiSwiftApiTests: XCTestCase {
    func testExample() async throws {
        _ = try await AnimeAPI.getAnimes(withParametors: nil)
    }
    
    func testLoadImage() async throws {
        if let firstAnime = try await AnimeAPI.getAnimes(withParametors: nil).first {
            let image = NSImage(data: try await firstAnime.image.preview.loadImage())
            assert(image != nil)
        }
    }
}
