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
    
    public func sendToken(_ request: ClientTokenRequest){

        let todosEndpoint: String = "\(self.baseUrl)ClientUser/"
        let todosURL = URL(string: todosEndpoint)!
        
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.httpMethod = "PUT"
        todosUrlRequest.addValue(token, forHTTPHeaderField: "Authorization")
                
        do {
            let data = try JSONEncoder().encode(request)
            todosUrlRequest.httpBody = data
        } catch {
            print("Error: cannot create JSON from todo")
        }
        
        let session = URLSession.shared
        session.dataTask(with: todosUrlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /todos/1")
                return//completion("error")
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return//completion("error")
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200{
                    if let str = String(data: responseData, encoding: String.Encoding.utf8) {

                        //valordevuelto = str
                        //completion(str)
                        
                    } else {
                        //completion("error")
                        print("not a valid UTF-8 sequence")
                    }
                }else{
                    do {
                        guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
                                                                                  options: []) as? [String: Any] else {
                                                                                    print("Could not get JSON from responseData as dictionary")
                                                                                    return
                        }
                        print("The todo is: " + receivedTodo.description)
                        
                        guard let todoID = receivedTodo["Message"] as? String else {
                            print("Could not get todoID as int from JSON")
                            return
                        }
                        //valordevuelto = todoID
                        //completion(todoID)
                        
                    } catch  {
                        print("error parsing response from POST on /todos")
                        //completion("error")
                    }
                }
            }
            
            // parse the result as JSON, since that's what the API provides
            
        }.resume()
    }
}
