import Alamofire
import Foundation

extension AnimeAPI.ImagesURL.ImageURL {
    typealias ImageData = Data
    public func toURL() -> URL {
        return .init(string: Setting.shikimoriURL + self)!
    }
}

extension JSONDecoder {
    static var defaultDateDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let formatter = DateFormatter()
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            formatter.dateFormat = "yyyy-MM-dd"
            if let date = formatter.date(from: dateString) {
                return date
            }
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            if let date = formatter.date(from: dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container,
                debugDescription: "Cannot decode date string \(dateString)")
        }
        return decoder
    }
}
