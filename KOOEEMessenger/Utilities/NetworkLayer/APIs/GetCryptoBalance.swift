import Foundation

extension NetworkManager {
    func getBalance(address: String, completion: @escaping (_ CryptoBalance: CryptoBalance?,_ error: String?)->()){
        routerCryptoCurrency.request(.getBalance(address: address)) { data, response, error in

            if error != nil {
                completion(nil, Strings.NETWORK_ERROR)
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        let apiResponse = try JSONDecoder().decode(CryptoBalance.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}
