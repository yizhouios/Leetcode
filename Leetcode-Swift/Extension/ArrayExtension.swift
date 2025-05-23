//
//  ArrayExtension.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/29.
//

import Foundation

extension Array {
    /// 优化数组的展示
    func print() {
        func recursivePrint(_ i: [Any], indent: String, _ showComma: Bool) {
            if i.isEmpty {
                Swift.print("[]")
                return
            }
            if (i[0] as? [Any]) == nil {
                Swift.print("\(indent)\(i)\((showComma ? "," : ""))")
                return
            }
            Swift.print(indent + "[")
            for (index, j) in i.enumerated() {
                recursivePrint(j as! [Any], indent: "  " + indent, index != i.count - 1)
            }
            Swift.print(indent + "]" + (showComma ? "," : ""))
        }
        recursivePrint(self, indent: "", false)
    }
}
