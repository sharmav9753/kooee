import Foundation

public enum CryptoCurrencyAPI {
    case getBalance(address: String)
}

extension CryptoCurrencyAPI: EndPointType {

    var version: String {
        return "v1"
    }

    var environmentBaseURL : String {
        return "https://api.blockcypher.com/\(version)"
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .getBalance(let address):
            return "/btc/main/addrs/\(address)/balance"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getBalance:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil)
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
