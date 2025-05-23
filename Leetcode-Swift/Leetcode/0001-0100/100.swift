//
//  100.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/27.
//

import Foundation

/*
 100. 相同的树 (简单)
 https://leetcode-cn.com/problems/same-tree/
 */

class Solution_100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }

        if p!.val != q!.val {
            return false
        }

        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
