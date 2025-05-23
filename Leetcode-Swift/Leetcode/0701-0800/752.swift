//
//  752.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/14.
//

import Foundation

/*
 752. 打开转盘锁 (中等)
 https://leetcode.cn/problems/open-the-lock/
 */

class Solution_752 {
    // MARK: - BFS
    func openLock(_ deadends: [String], _ target: String) -> Int {
        if target == "0000" {
            return 0
        }
        
        if target.count != 4 || deadends.contains(target) || deadends.contains("0000") {
            return -1
        }

        var queue = ["0000"]
        var visited = Set(["0000"])
        var depth = 0

        while !queue.isEmpty {
            var count = queue.count
            depth += 1

            while count > 0 {
                let item = queue.removeFirst()
                let nextResults = slide(item)

                for i in nextResults {
                    if visited.contains(i) || deadends.contains(i) {
                        continue
                    }
                    if i == target {
                        return depth
                    }

                    queue.append(i)
                    visited.insert(i)
                }

                count -= 1
            }
        }

        return -1
    }

    // 根据当前状态，计算可拨动到的下8个状态 ((前拨 + 后拨) * 4)
    func slide(_ str: String) -> [String] {
        let elements = Array(str).map { String($0) }
        var results = [String]()

        for i in 0..<4 {
            var items = elements
            let item = Int(items[i]) ?? 0

            // 后拨
            let next = (item + 1) % 10
            items[i] = String(next)
            results.append(items.joined(separator: ""))

            // 前拨
            var pre = (item - 1)
            if pre < 0 {
                pre = 9
            }
            items[i] = String(pre)
            results.append(items.joined(separator: ""))
        }

        return results
    }
}
