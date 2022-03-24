
import Foundation
import Alamofire

public class AnimeAPI {
    public struct SearchParameters: Encodable {
        
        public enum OrderType: Encodable {
            case id
            case ranked
            case kind
            case popularity
            case name
            case aired_on
            case episodes
            case status
            case random
        }
        
        public init () {}
        
        public var limit: Int?
        public var page: Int?
        public var order: OrderType?
        public var kind: KindType?
        public var status: StatusType?
        public var score: Float?
        public var duration: DurationType?
        public var genre: String?
        public var studio: String?
        public var franchise: String?
        public var censored: Bool?
    }
    
    public enum KindType: String, Codable {
        case tv
        case movie
        case ova
        case ona
        case special
        case music
        case tv_13
        case tv_24
        case tv_48
    }
    
    public enum StatusType: String, Codable {
        case anons
        case ongoing
        case released
    }
    
    public enum DurationType: String, Codable {
        case S
        case D
        case F
    }
    
    public enum RatingType: String, Codable {
        case none
        case g
        case pg
        case pg_13
        case r
        case r_plus
        case rx
    }
    
    public struct ImagesURL: Codable {
        public typealias ImageURL = String
        public let original: ImageURL
        public let preview: ImageURL
        public let x96: ImageURL
        public let x48: ImageURL
    }
    
    public struct Anime: Codable, Identifiable {
        public let id: Int
        public let name, russian, url: String
        public let kind: KindType
        public let image: ImagesURL
        public let score, status: String
        public let episodes, episodesAired: Int?
        public let aired_on, released_on: Date?
    }
    
    public struct AnimeInfo: Codable, Identifiable {
        public let id: Int
        public let name, russian: String
        public let image: ImagesURL
        public let url: String
        public let kind: KindType?
        public let score: String
        public let status: StatusType?
        public let episodes, episodesAired: Int?
        public let airedOn, releasedOn: Date?
        public let rating: RatingType?
        public let english, japanese: [String]?
        public let synonyms: [String]?
        public let licenseNameRu: [String]?
        public let duration: Int?
        public let animeInfoDescription, descriptionHTML, descriptionSource, franchise: String?
        public let favoured: Bool?
        public let threadID, topicID, myanimelistID: Int?
//        public let ratesScoresStats, ratesStatusesStats: [String]?
        public let updatedAt, nextEpisodeAt: Anime?
//        public let genres, studios, videos, screenshots: [String]
        public let userRate: Float?
    }
    
    static let site = "https://shikimori.one/api/"
    
    public static func getAnimes(withParametors parameters: SearchParameters? = nil) async throws -> [Anime] {
        let dataTask = AF.request(site + "animes",method: .get, parameters: parameters,
                                  encoder: URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(boolEncoding: .literal)))
            .serializingData()
        return try JSONDecoder.defaultDateDecoder.decode([Anime].self, from: try await dataTask.value)
    }
    
    public static func getAnime(withId id: uint) async throws -> AnimeInfo {
        let dataTask = AF.request(site + "animes/\(id)",method: .get).serializingData()
        return try JSONDecoder.defaultDateDecoder.decode(AnimeInfo.self, from: try await dataTask.value)
    }
}

