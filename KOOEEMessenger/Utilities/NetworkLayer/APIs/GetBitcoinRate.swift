import Foundation

extension NetworkManager {
    func getBitcoinRate(completion: @escaping (_ bitcoinRate: BitcoinRate?,_ error: String?)->()){
        routerCryptoRates.request(.getBitcoinRate) { data, response, error in

            if error != nil {
                completion(nil, NETWORK_ERROR)
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
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(BitcoinRate.self, from: responseData)
                        completion(apiResponse, nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}
