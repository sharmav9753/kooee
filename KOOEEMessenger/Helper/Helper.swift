import Foundation

class Helper {
    static func getBalanceForDisplay(
        value: Double, type: CurrencyType, withSymbol: Bool = true
    ) -> String {
        let balanceFormatter = NumberFormatter()
        balanceFormatter.groupingSeparator = ","
        balanceFormatter.groupingSize = 3
        balanceFormatter.usesGroupingSeparator = true
        balanceFormatter.decimalSeparator = "."
        balanceFormatter.numberStyle = .decimal
        balanceFormatter.maximumFractionDigits = type.precision

        guard let formattedBalance = balanceFormatter.string(from: value as NSNumber) else {
            return withSymbol ? Strings.BALANCE_PLACEHOLDER + " " + type.symbol : Strings.BALANCE_PLACEHOLDER
        }

        return withSymbol ? formattedBalance + " " + type.symbol : formattedBalance
    }
}
