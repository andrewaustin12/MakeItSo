//
//  AuthenticationService+Injection.swift
//  MakeItSo
//
//  Created by andrew austin on 6/14/23.
//

import Foundation
import Factory

extension Container {
    public var authenticationService: Factory<AuthenticationService> {
        self {
            AuthenticationService()
        }.singleton
    }
}
