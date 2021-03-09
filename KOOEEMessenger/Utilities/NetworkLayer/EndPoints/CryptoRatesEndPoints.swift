import Foundation

public enum CryptoRatesAPI {
    case getBitcoinRate
}

extension CryptoRatesAPI: EndPointType {

    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://blockchain.info"
        }
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .getBitcoinRate:
            return "/ticker"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getBitcoinRate:
            return .request
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
