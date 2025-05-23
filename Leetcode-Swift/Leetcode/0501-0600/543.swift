//
//  543.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/22.
//

import Foundation

/*
 543. 二叉树的直径 (简单)
 https://leetcode-cn.com/problems/diameter-of-binary-tree/
 */

class Solution_543 {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxDiameter = 0
        let _ = depth(root, &maxDiameter)

        return maxDiameter
    }

    func depth(_ root: TreeNode?, _ maxDiameter: inout Int) -> Int {
        if root == nil {
            return 0
        }

        let lDepth = depth(root?.left, &maxDiameter)
        let rDepth = depth(root?.right, &maxDiameter)

        maxDiameter = max(maxDiameter, (lDepth + rDepth))

        return max(lDepth, rDepth) + 1
    }
}
