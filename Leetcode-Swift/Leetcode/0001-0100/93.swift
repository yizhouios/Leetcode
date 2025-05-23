//
//  93.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/7.
//

import Foundation

/*
 93. 复原 IP 地址 (中等)
 https://leetcode-cn.com/problems/restore-ip-addresses/
 */

class Solution_93 {
    var path = [String]()
    var ans = [String]()

    func restoreIpAddresses(_ s: String) -> [String] {
        if s.isEmpty {
            return []
        }

        let s = Array(s).map { String($0) }
        dfs(s, 0, 0)

        return ans
    }

    func dfs(_ s: [String], _ beginIndex: Int, _ componentCount: Int) {
        if (beginIndex >= s.count) && (componentCount == 4) {
            ans.append(path.joined(separator: "."))
            return
        }
        if (beginIndex >= s.count) {
            return
        }
        if (componentCount == 4) {
            return
        }

        var singleItem = ""
        for i in beginIndex..<s.count {
            singleItem += s[i]

            if singleItem.count > 1 && singleItem.hasPrefix("0") {
                return
            }
            if singleItem.count > 3 {
                return
            }
            if Int(singleItem)! > 255 {
               return
            }

            path.append(singleItem)
            dfs(s, i + 1, componentCount + 1)
            path.removeLast()
        }
    }
}
