//
//  17_572_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/28.
//

import Foundation

/*
 572. 另一棵树的子树 (简单)
 https://leetcode-cn.com/problems/subtree-of-another-tree/
 */

class Solution_17_572_Day20Plan {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        return dfs(root, subRoot)
    }
    
    func dfs(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil {
            return false
        }
        return check(A, B) || dfs(A?.left, B) || dfs(A?.right, B)
    }

    func check(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil && B == nil {
            return true
        }
        if A == nil || B == nil {
            return false
        }
        if A?.val == B?.val {
            return check(A?.left, B?.left) && check(A?.right, B?.right)
        }
        return false
    }
    
    func test() {
        print(isSubtree(createTreeNode([3,4,5,1,2,nil,nil]), createTreeNode([4,1,2])))
        print(isSubtree(createTreeNode([3,5,5,1,2,nil,nil]), createTreeNode([4,1,2])))
    }
}
