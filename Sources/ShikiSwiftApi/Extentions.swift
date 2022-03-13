import Alamofire
import Foundation

extension AnimeAPI.ImagesURL.ImageURL {
    typealias ImageData = Data
    func loadImage() async throws -> ImageData {
        let dataTask = AF.request(Setting.shikimoriURL + self,method: .get).serializingData()
        return try await dataTask.value
    }
    
}
