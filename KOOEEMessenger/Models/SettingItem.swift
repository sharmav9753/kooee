import Foundation

enum ItemType {
    case ICON, TEXT, PASS, BUTTON
}

struct SettingItem {
    var title: String
    var icon: String?
    var type: ItemType
    var value: String?
}
