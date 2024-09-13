//
//  Gender.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case Male, Female
    var id: Self { self }
}
