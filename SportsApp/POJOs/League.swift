
import Foundation

// MARK: - LeagueDetailsResponse
struct LeagueDetailsResponse: Codable {
    let leagues: [League]
}

// MARK: - League
struct League: Codable {
    let idLeague: String
    let idSoccerXML: JSONNull?
    let idAPIfootball, strSport, strLeague, strLeagueAlternate: String
    let strDivision, idCup, strCurrentSeason, intFormedYear: String
    let dateFirstEvent, strGender, strCountry, strWebsite: String
    let strFacebook, strTwitter, strYoutube: String
    let strRSS: String
    let strDescriptionEN, strDescriptionDE, strDescriptionFR, strDescriptionIT: String
    let strDescriptionCN, strDescriptionJP, strDescriptionRU, strDescriptionES: String
    let strDescriptionPT, strDescriptionSE, strDescriptionNL, strDescriptionHU: String
    let strDescriptionNO, strDescriptionPL, strDescriptionIL: String
    let strFanart1, strFanart2, strFanart3, strFanart4: String
    let strBanner: String
    let strBadge, strLogo: String
    let strPoster: String
    let strTrophy: String
    let strNaming, strComplete, strLocked: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
