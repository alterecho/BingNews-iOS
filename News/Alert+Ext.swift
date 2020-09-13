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
        if let primaryButtonTitle = vm.primaryButtonTitle {
            if let secondaryButtonTitle = vm.secondaryButtonTitle {
                self.init(
                    title: Text(vm.title ?? ""),
                    message: Text(vm.message ?? ""),
                    primaryButton: .default(Text(primaryButtonTitle), action: primaryAction),
                    secondaryButton: .default(Text(secondaryButtonTitle), action: secondaryAction)
                )
            } else {
                self.init(
                    title: Text(vm.title ?? ""),
                    message: Text(vm.message ?? ""),
                    dismissButton: .default(Text(primaryButtonTitle), action: primaryAction)
                )
            }
        } else {
            self.init(title: Text(vm.title ?? ""), message: Text(vm.message ?? ""))
        }
    }
}
