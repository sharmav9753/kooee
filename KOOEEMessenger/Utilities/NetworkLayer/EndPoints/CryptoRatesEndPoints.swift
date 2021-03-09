import Foundation

public enum CryptoRatesAPI {
    case getCryptoRates(cryptoCurrencies: [String], fiatCurrencies: [String])
}

extension CryptoRatesAPI: EndPointType {

    var environmentBaseURL : String {
        return "https://min-api.cryptocompare.com"
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .getCryptoRates:
            return "/data/pricemulti"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case let .getCryptoRates(cryptoCurrencies, fiatCurrencies):
            let fsyms = cryptoCurrencies.joined(separator: ",")
            let tsyms = fiatCurrencies.joined(separator: ",")

            return .requestParameters(
                bodyParameters: nil,
                bodyEncoding: .urlEncoding,
                urlParameters: ["fsyms": fsyms, "tsyms": tsyms]
            )
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
