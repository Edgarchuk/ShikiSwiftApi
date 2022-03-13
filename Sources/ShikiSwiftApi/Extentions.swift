import Alamofire
import Foundation

extension AnimeAPI.ImagesURL.ImageURL {
    typealias ImageData = Data
    public func toURL() -> URL {
        return .init(string: Setting.shikimoriURL + self)!
    }
}
