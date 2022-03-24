import XCTest
import AppKit
@testable import ShikiSwiftApi

final class ShikiSwiftApiTests: XCTestCase {
    
    func testDecodeAnimeDetailInfo() {
        do {
            let data = try String(contentsOfFile: Bundle.module.path(forResource: "AnimeDetail", ofType: "json")!).data(using: .utf8)
            _ = try JSONDecoder.defaultDateDecoder.decode(AnimeAPI.AnimeInfo.self, from: data!)
        }
        catch {
            XCTFail()
        }
    }
    
    func testDecodeAnimeInfo() {
        do {
            let data = try String(contentsOfFile: Bundle.module.path(forResource: "AnimesData", ofType: "json")!).data(using: .utf8)
            _ = try JSONDecoder.defaultDateDecoder.decode([AnimeAPI.Anime].self, from: data!)
        }
        catch {
            XCTFail()
        }
    }
    
    func testCreateURLForImage() async throws {
        if let image = try await AnimeAPI.getAnimes(withParametors: nil).first?.image {
            _ = image.original.toURL()
        }
    }
}
