//
//  UIColor+Extension.swift
//  scbapp
//
//  Created by 孙泽山 on 2021/4/27.
//

import Foundation
import UIKit
extension UIColor {
    public convenience init?(hex: String) {
        var he = hex
        let r, g, b: CGFloat
        let regs : [String] = he.components(separatedBy: ",")
        var a:CGFloat = 1
        if (regs.count > 1) {
            he = regs[0]
            let aStr = regs[1].replacingOccurrences(of: "%", with: "").trimmingCharacters(in: .whitespacesAndNewlines);
            a = CGFloat(Double(aStr) ?? 0) / 100;
        }

        if he.hasPrefix("#") {
            let start = he.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(he[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
