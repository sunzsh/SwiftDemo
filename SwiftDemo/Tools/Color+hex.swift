//
//  Color+hex.swift
//  scbapp
//
//  Created by 孙泽山 on 2021/4/28.
//

import Foundation
import SwiftUI

extension Color {
    public init?(hex: String) {
        self.init(UIColor(hex: hex) ?? UIColor.black)
    }
}
