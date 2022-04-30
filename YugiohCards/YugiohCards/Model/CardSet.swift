// MARK: - CardSet
struct CardSet: Codable {
    let setName, setCode: String?
    let setRarity: SetRarity?
    let setRarityCode: SetRarityCode?
    let setPrice: String?

    enum CodingKeys: String, CodingKey {
        case setName = "set_name"
        case setCode = "set_code"
        case setRarity = "set_rarity"
        case setRarityCode = "set_rarity_code"
        case setPrice = "set_price"
    }
}

enum SetRarity: String, Codable {
    case collectorSRare = "Collector's Rare"
    case common = "Common"
    case duelTerminalNormalParallelRare = "Duel Terminal Normal Parallel Rare"
    case duelTerminalNormalRareParallelRare = "Duel Terminal Normal Rare Parallel Rare"
    case duelTerminalRareParallelRare = "Duel Terminal Rare Parallel Rare"
    case duelTerminalSuperParallelRare = "Duel Terminal Super Parallel Rare"
    case duelTerminalUltraParallelRare = "Duel Terminal Ultra Parallel Rare"
    case extraSecretRare = "Extra Secret Rare"
    case ghostGoldRare = "Ghost/Gold Rare"
    case ghostRare = "Ghost Rare"
    case goldRare = "Gold Rare"
    case goldSecretRare = "Gold Secret Rare"
    case mosaicRare = "Mosaic Rare"
    case normalParallelRare = "Normal Parallel Rare"
    case platinumRare = "Platinum Rare"
    case platinumSecretRare = "Platinum Secret Rare"
    case premiumGoldRare = "Premium Gold Rare"
    case prismaticSecretRare = "Prismatic Secret Rare"
    case rare = "Rare"
    case secretRare = "Secret Rare"
    case shatterfoilRare = "Shatterfoil Rare"
    case shortPrint = "Short Print"
    case starfoilRare = "Starfoil Rare"
    case starlightRare = "Starlight Rare"
    case superParallelRare = "Super Parallel Rare"
    case superRare = "Super Rare"
    case superShortPrint = "Super Short Print"
    case the10000SecretRare = "10000 Secret Rare"
    case ultimateRare = "Ultimate Rare"
    case ultraParallelRare = "Ultra Parallel Rare"
    case ultraRare = "Ultra Rare"
    case ultraSecretRare = "Ultra Secret Rare"
}

enum SetRarityCode: String, Codable {
    case c = "(C)"
    case cr = "(CR)"
    case dnpr = "(DNPR)"
    case drpr = "(DRPR)"
    case dspr = "(DSPR)"
    case dupr = "(DUPR)"
    case empty = ""
    case gScR = "(GScR)"
    case ggr = "(GGR)"
    case gr = "(GR)"
    case gur = "(GUR)"
    case msr = "(MSR)"
    case pScR = "(PScR)"
    case pg = "(PG)"
    case pir = "(PIR)"
    case ps = "(PS)"
    case r = "(R)"
    case scR = "(ScR)"
    case sfr = "(SFR)"
    case shr = "(SHR)"
    case sp = "(SP)"
    case spr = "(SPR)"
    case sr = "(SR)"
    case ssp = "(SSP)"
    case stR = "(StR)"
    case the10000ScR = "(10000ScR)"
    case uScR = "(UScR)"
    case upr = "(UPR)"
    case ur = "(UR)"
    case utR = "(UtR)"
}

enum Linkmarker: String, Codable {
    case bottom = "Bottom"
    case bottomLeft = "Bottom-Left"
    case bottomRight = "Bottom-Right"
    case linkmarkerLeft = "Left"
    case linkmarkerRight = "Right"
    case top = "Top"
    case topLeft = "Top-Left"
    case topRight = "Top-Right"
}

enum Race: String, Codable {
    case alexisRhodes = "Alexis Rhodes"
    case andrew = "Andrew"
    case aqua = "Aqua"
    case arkana = "Arkana"
    case asterPhoenix = "Aster Phoenix"
    case axelBrodie = "Axel Brodie"
    case bastionMisaw = "Bastion Misaw"
    case beast = "Beast"
    case beastWarrior = "Beast-Warrior"
    case bonz = "Bonz"
    case chazzPrincet = "Chazz Princet"
    case christine = "Christine"
    case continuous = "Continuous"
    case counter = "Counter"
    case creatorGod = "Creator-God"
    case cyberse = "Cyberse"
    case david = "David"
    case dinosaur = "Dinosaur"
    case divineBeast = "Divine-Beast"
    case drVellianC = "Dr. Vellian C"
    case dragon = "Dragon"
    case emma = "Emma"
    case equip = "Equip"
    case espaRoba = "Espa Roba"
    case fairy = "Fairy"
    case field = "Field"
    case fiend = "Fiend"
    case fish = "Fish"
    case insect = "Insect"
    case ishizu = "Ishizu"
    case ishizuIshtar = "Ishizu Ishtar"
    case jadenYuki = "Jaden Yuki"
    case jesseAnderso = "Jesse Anderso"
    case joey = "Joey"
    case joeyWheeler = "Joey Wheeler"
    case kaiba = "Kaiba"
    case keith = "Keith"
    case lumisUmbra = "Lumis Umbra"
    case machine = "Machine"
    case mai = "Mai"
    case maiValentine = "Mai Valentine"
    case mako = "Mako"
    case normal = "Normal"
    case odion = "Odion"
    case pegasus = "Pegasus"
    case plant = "Plant"
    case psychic = "Psychic"
    case pyro = "Pyro"
    case quickPlay = "Quick-Play"
    case reptile = "Reptile"
    case rex = "Rex"
    case ritual = "Ritual"
    case rock = "Rock"
    case seaSerpent = "Sea Serpent"
    case setoKaiba = "Seto Kaiba"
    case spellcaster = "Spellcaster"
    case syrusTruesda = "Syrus Truesda"
    case teaGardner = "Tea Gardner"
    case thunder = "Thunder"
    case tyrannoHassl = "Tyranno Hassl"
    case warrior = "Warrior"
    case weevil = "Weevil"
    case wingedBeast = "Winged Beast"
    case wyrm = "Wyrm"
    case yamiBakura = "Yami Bakura"
    case yamiMarik = "Yami Marik"
    case yamiYugi = "Yami Yugi"
    case yubel = "Yubel"
    case yugi = "Yugi"
    case zaneTruesdal = "Zane Truesdal"
    case zombie = "Zombie"
}

enum TypeEnum: String, Codable {
    case effectMonster = "Effect Monster"
    case flipEffectMonster = "Flip Effect Monster"
    case fusionMonster = "Fusion Monster"
    case geminiMonster = "Gemini Monster"
    case linkMonster = "Link Monster"
    case normalMonster = "Normal Monster"
    case normalTunerMonster = "Normal Tuner Monster"
    case pendulumEffectFusionMonster = "Pendulum Effect Fusion Monster"
    case pendulumEffectMonster = "Pendulum Effect Monster"
    case pendulumEffectRitualMonster = "Pendulum Effect Ritual Monster"
    case pendulumFlipEffectMonster = "Pendulum Flip Effect Monster"
    case pendulumNormalMonster = "Pendulum Normal Monster"
    case pendulumTunerEffectMonster = "Pendulum Tuner Effect Monster"
    case ritualEffectMonster = "Ritual Effect Monster"
    case ritualMonster = "Ritual Monster"
    case skillCard = "Skill Card"
    case spellCard = "Spell Card"
    case spiritMonster = "Spirit Monster"
    case synchroMonster = "Synchro Monster"
    case synchroPendulumEffectMonster = "Synchro Pendulum Effect Monster"
    case synchroTunerMonster = "Synchro Tuner Monster"
    case token = "Token"
    case toonMonster = "Toon Monster"
    case trapCard = "Trap Card"
    case tunerMonster = "Tuner Monster"
    case unionEffectMonster = "Union Effect Monster"
    case xyzMonster = "XYZ Monster"
    case xyzPendulumEffectMonster = "XYZ Pendulum Effect Monster"
}
