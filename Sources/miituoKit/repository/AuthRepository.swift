//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 26/10/22.
//

import Foundation

public struct AuthRepository: TokenClient {
    public var token: String
    public var baseUrl: String
    
    public init(baseUrl: String){
        self.baseUrl = baseUrl
        self.token = ""
    }
    
    public func sendToken(_ request: ClientTokenRequest, completion: @escaping(Bool, AppError?) -> Void){

        let todosEndpoint: String = "\(self.baseUrl)ClientUser/"
        let todosURL = URL(string: todosEndpoint)!
        
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.httpMethod = "PUT"
        todosUrlRequest.addValue(token, forHTTPHeaderField: "Authorization")
                
        do {
            let data = try JSONEncoder().encode(request)
            todosUrlRequest.httpBody = data
        } catch {
            completion(false, AppError(message: "Tuvimos un problema, intente más tarde."))
        }
        
        let session = URLSession.shared
        session.dataTask(with: todosUrlRequest) { (data, response, error) in
            
            if let error = error {
                completion(false, AppError(message: error.localizedDescription))
            } else if let data = data {
                do {
                    if let httpresponse = response as? HTTPURLResponse, httpresponse.statusCode != 200 {
                        let resp = try JSONDecoder().decode(MessageResponse.self, from: data)
                        completion(false, AppError(message: resp.message))
                    } else {
                        completion(true, nil)
                    }
                } catch {
                    print(error)
                    completion(false, AppError(message: "Tuvimos un problema, intente más tarde."))
                }
            } else{
                completion(false, AppError(message: "Tuvimos un problema, intente más tarde."))
            }
        }.resume()
    }
}
