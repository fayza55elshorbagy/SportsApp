
import Foundation

struct LeaugeDetail : Codable {
    
    var idLeague : String?
    var strBadge : String?
    var strLeague : String?
    var strSport : String?
    var strYoutube : String?
    var strCurrentSeason : String?
}

struct LeagueDetailAPI : Codable {
    let leagues : [LeaugeDetail]?
}
