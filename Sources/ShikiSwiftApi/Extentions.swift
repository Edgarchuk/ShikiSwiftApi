import Alamofire
import Foundation

extension AnimeAPI.ImagesURL.ImageURL {
    typealias ImageData = Data
    func toURL() -> URL {
        return .init(string: Setting.shikimoriURL + self)!
    }
}
