import XCTest
@testable import ShikiSwiftApi

final class ShikiSwiftApiTests: XCTestCase {
    func testExample() async throws {
        print( try await AnimeAPI().getAnimes(withParametors: nil))
        sleep(2)
    }
}
