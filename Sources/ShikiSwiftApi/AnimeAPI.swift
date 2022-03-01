
import Foundation
import Alamofire

class AnimeAPI {
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
        
        public enum KindType: Encodable {
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
        
        public enum StatusType: Encodable {
            case anons
            case ongoing
            case released
        }
        
        public enum DurationType: Encodable {
            case S
            case D
            case F
        }
        
        public enum RatingType: Encodable {
            case none
            case g
            case pg
            case pg_13
            case r
            case r_plus
            case rx
        }
        
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
    
    public struct Anime: Codable {
        public struct Image {
            public let original: String
            public let preview: String
            public let x96: String
            public let x48: String
        }
        
        public let id: Int
        public let name: String
        public let russian: String
        public let url: String
        public let kind: String
        public let score: String
        public let status: String
        public let episodes: Int
        public let episodes_aired: Int
        public let aired_on: String?
        public let released_on: String?
    }
    
    let site = "https://shikimori.one/api/"
    func getAnime(withParametors parameters: SearchParameters?) {
        AF.request(site + "animes",method: .get, parameters: parameters,
                   encoder: URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(boolEncoding: .literal))).response {response in
            print(try! JSONDecoder().decode([Anime].self, from: response.data!))
        }
    }
}

