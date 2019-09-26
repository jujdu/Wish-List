//
//  Api.swift
//  iPartner-TestApp
//
//  Created by Michael Sidoruk on 25/09/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    private func fetchData<T: Decodable>(url: String, parameters: Parameters, completion: @escaping (T?) -> ()) {
        guard let url = URL(string: url) else { return }
                   
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: HEADERS).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            
            let decoded = self.decodeJSON(type: T.self, from: data)
            completion(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(type.self, from: data)
            return response
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    func postEntries(url: String, parameters: Parameters, completion: @escaping (BaseWish?) -> ()) {
        fetchData(url: url, parameters: parameters, completion: completion)
    }
    
    func postNewSession(url: String, parameters: Parameters, completion: @escaping (BaseNewSession?) -> ()) {
        fetchData(url: url, parameters: parameters, completion: completion)
    }
}
