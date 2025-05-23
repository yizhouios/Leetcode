//
//  101.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/12.
//

import Foundation

/*
 101. 对称二叉树 (简单)
 https://leetcode-cn.com/problems/symmetric-tree/
 */

class Solution_101 {
    
    /// 迭代
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root, root)
    }

    func check(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        var ans = true
        var queue = [node1, node2]

        while !queue.isEmpty {
            let n1 = queue.removeFirst()
            let n2 = queue.removeFirst()

            if n1 == nil && n2 == nil {
                continue
            }
            if (n1 == nil || n2 == nil) || (n1!.val != n2!.val) {
                ans = false
                break
            }
            
            queue.append(n1?.left)
            queue.append(n2?.right)
            queue.append(n1?.right)
            queue.append(n2?.left)
        }

        return ans
    }
    
    /// 递归
    func isSymmetric_1(_ root: TreeNode?) -> Bool {
        func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            }
            if p == nil || q == nil {
                return false
            }
            return p!.val == q!.val && check(p?.left, q?.right) && check(p?.right, q?.left)
        }
        
        return check(root, root)
    }
    
    func test() {
        let n1 = createTreeNode([1,2,2,3,4,4,3])
        print(isSymmetric(n1))
    }
}
