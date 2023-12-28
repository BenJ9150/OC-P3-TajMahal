//
//  Extensions.swift
//  TajMahal
//
//  Created by Benjamin LEFRANCOIS on 28/12/2023.
//

import Foundation
import SwiftUI

extension UINavigationController {

    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

extension Font {

    // Regular

    static let jakarta_regular_12 = Font.custom("PlusJakartaSans-Regular", size: 12)

    // Semi bold

    static let jakarta_bold_14 = Font.custom("PlusJakartaSans-Bold", size: 14)
    static let jakarta_bold_16 = Font.custom("PlusJakartaSans-Bold", size: 16)
    static let jakarta_bold_18 = Font.custom("PlusJakartaSans-Bold", size: 18)

    // Bold

    static let jakarta_semibold_12 = Font.custom("PlusJakartaSans-SemiBold", size: 12)
    static let jakarta_semibold_14 = Font.custom("PlusJakartaSans-SemiBold", size: 14)
}
