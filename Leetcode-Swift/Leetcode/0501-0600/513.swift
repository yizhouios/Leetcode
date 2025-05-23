//
//  513.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/8.
//

import Foundation

/*
 513. 找树左下角的值 (中等)
 https://leetcode-cn.com/problems/find-bottom-left-tree-value/
 */

class Solution_513 {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        if root == nil {
            return -1
        }

        var ans = -1
        var queue = [root]

        while !queue.isEmpty {
            ans = queue[0]!.val
            var count = queue.count
            while count > 0 {
                let node = queue.removeFirst()
                if node?.left != nil {
                    queue.append(node?.left)
                }
                if node?.right != nil {
                    queue.append(node?.right)
                }

                count -= 1
            }
        }

        return ans
    }
}
