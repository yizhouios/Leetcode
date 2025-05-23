//
//  55.1.er-cha-shu-de-shen-du-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/27.
//

import Foundation

/*
 剑指 Offer 55 - I. 二叉树的深度 (简单)
 https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/
 */

class Solution_Offer_55_1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    func test() {
        let tests = [
            [],
            [1,2,3,4,nil,nil,nil]
        ]
        
        for i in tests {
            print(maxDepth(createTreeNode(i)))
        }
    }
}
