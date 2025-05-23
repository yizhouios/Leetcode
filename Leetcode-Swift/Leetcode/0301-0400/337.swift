//
//  337.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/23.
//

import Foundation

/*
 337. 打家劫舍 III (中等)
 https://leetcode.cn/problems/house-robber-iii/
 */

class Solution_337 {
    // MARK: - 树形动态规划（利用二叉树的后序遍历）
    func rob(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let money: (Int, Int) = postorder(root)
        return max(money.0, money.1)
    }

    // 后序遍历，返回不选与选当前节点的最大值组成的元组（最大值（不选），最大值（选））
    func postorder(_ root: TreeNode?) -> (Int, Int) {
        if root == nil {
            return (0, 0)
        }

        let left = postorder(root?.left)
        let right = postorder(root?.right)
        
        let noChoose = max(left.0, left.1) + max(right.0, right.1)
        let choose = root!.val + left.0 + right.0

        return (noChoose, choose)
    }
}
