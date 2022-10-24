//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

public struct MainRepository {
    
    public var policyRepo: PolicyRepository

    public var environment: Environment
    
    public init(environment: Environment) {
        self.environment = environment
       
        policyRepo = PolicyRepository(baseUrl: environment.url)
    }
}
