//
//  145.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/20.
//

import Foundation

/*
 145. 二叉树的后序遍历 (简单)
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
 */

class Solution_145 {
    /// 法一：递归
    func postorderTraversal_1(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans = [Int]()
        ans += postorderTraversal(root?.left)
        ans += postorderTraversal(root?.right)
        ans += [root!.val]
        return ans
    }
    
    /// 法一：递归写法二
    func postorderTraversal_2(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var ans = [Int]()
        postorderTraversal_core(root, &ans)

        return ans
    }

    func postorderTraversal_core(_ root: TreeNode?, _ traversals: inout [Int]) {
        if root == nil {
            return
        }

        postorderTraversal_core(root?.left, &traversals)
        postorderTraversal_core(root?.right, &traversals)
        traversals.append(root!.val)
    }
    
    /// 法二：迭代
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans = [Int]()
        var node: TreeNode? = root
        var stack = [TreeNode]()
        var pre: TreeNode?
        
        while !stack.isEmpty || node != nil {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            
            node = stack.removeLast()
            
            if node?.right == nil || node!.right === pre {
                ans.append(node!.val)
                pre = node
                node = nil
            } else {
                stack.append(node!)
                node = node?.right
            }
        }
        
        return ans
    }
    
    func test() {
        print(postorderTraversal(createTreeNode([3,1,nil,nil,2])))
    }
}
