// MARK: - BanlistInfo
struct BanlistInfo: Codable {
    let banTcg, banOcg, banGoat: Ban?

    enum CodingKeys: String, CodingKey {
        case banTcg = "ban_tcg"
        case banOcg = "ban_ocg"
        case banGoat = "ban_goat"
    }
}

enum Ban: String, Codable {
    case banned = "Banned"
    case limited = "Limited"
    case semiLimited = "Semi-Limited"
}
