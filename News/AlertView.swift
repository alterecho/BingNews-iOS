//
//  Alert.swift
//  News
//
//  Created by v.a.jayachandran on 24/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI

extension Alert {
    init(vm: AlertVM, primaryAction: (() -> ())? = nil, secondaryAction: (() -> ())? = nil) {
        self.init(
            title: Text(vm.title),
            message: Text(vm.message),
            primaryButton: .default(Text(vm.primaryButtonTitle), action: primaryAction),
            secondaryButton: .default(Text(vm.secondaryButtonTitle), action: secondaryAction)
        )
    }
}
