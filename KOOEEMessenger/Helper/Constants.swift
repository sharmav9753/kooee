/*
 All static constant.
 */

//MARK: Storyboard names and Identifiers

enum StoryboardName: String{
    case Settings
    case Messages
    case Contacts
    case Add
    case Wallet
    case Content
    case Main
}

enum StoryboardIdentifier: String{
    case Settings
}

//MARK: XIB Names and Identifiers

enum XIBName: String{
    case SettingCell
}

enum XIBIdentifier: String{
    case SettingCell
}

//MARK: Currency

enum CurrencyType {

    case USD
    case BTC
    case ETH

    var precision: Int {
        switch self {
        case .USD:
            return 2
        case .BTC:
            return 5
        case .ETH:
            return 5
        }
    }

    var symbol: String {
        switch self {
        case .USD:
            return "USD"
        case .BTC:
            return "BTC"
        case .ETH:
            return "ETH"
        }
    }
}
