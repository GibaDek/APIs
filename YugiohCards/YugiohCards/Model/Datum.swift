// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name: String?
    let type: TypeEnum?
    let desc: String?
    let race: Race?
    let archetype: String?
    let cardSets: [CardSet]?
    let cardImages: [CardImage]?
    let cardPrices: [CardPrice]?
    let atk, def, level: Int?
    let attribute: Attribute?
    let banlistInfo: BanlistInfo?
    let scale, linkval: Int?
    let linkmarkers: [Linkmarker]?

    enum CodingKeys: String, CodingKey {
        case id, name, type, desc, race, archetype
        case cardSets = "card_sets"
        case cardImages = "card_images"
        case cardPrices = "card_prices"
        case atk, def, level, attribute
        case banlistInfo = "banlist_info"
        case scale, linkval, linkmarkers
    }
}

enum Attribute: String, Codable {
    case dark = "DARK"
    case divine = "DIVINE"
    case earth = "EARTH"
    case fire = "FIRE"
    case light = "LIGHT"
    case water = "WATER"
    case wind = "WIND"
}
