//
//  Repositories+Injection.swift
//  MakeItSo
//
//  Created by andrew austin on 6/14/23.
//

import Foundation
import Factory

extension Container {
    public var remindersRepository: Factory<RemindersRepository> {
        self {
            RemindersRepository()
        }.singleton
    }
}
