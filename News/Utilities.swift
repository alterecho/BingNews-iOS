//
//  Utilities.swift
//  News
//
//  Created by v.a.jayachandran on 24/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI

protocol Bindable: AnyObject {
    static func createBinding<T>(for obj: Self, path: ReferenceWritableKeyPath<Self, T>, default: T) -> Binding<T>
}

extension Bindable {
    static func createBinding<T>(for obj: Self, path: ReferenceWritableKeyPath<Self, T>, default: T) -> Binding<T> {
        let b = Binding<T>(get: { [weak obj]() -> T in
            return obj?[keyPath: path] ?? `default`
        }) { [weak obj] (value) in
            obj?[keyPath: path] = value
        }
        
        return b
    }
}
