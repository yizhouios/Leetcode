//
//  144.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/20.
//

import Foundation

/*
 144. 二叉树的前序遍历 (简单)
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 */

class Solution_144 {
    /// 法一：递归
    func preorderTraversal_1(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans = [root!.val]
        ans += preorderTraversal(root?.left)
        ans += preorderTraversal(root?.right)
        return ans
    }
    
    /// 法一：递归（写法二）
    func preorderTraversal_2(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var ans = [Int]()
        preorderTraversal_core(root, &ans)
        return ans
    }

    func preorderTraversal_core(_ root: TreeNode?, _ traversals: inout [Int]) {
        if root == nil {
            return
        }
        traversals.append(root!.val)
        preorderTraversal_core(root?.left, &traversals)
        preorderTraversal_core(root?.right, &traversals)
    }
    
    /// 法二：迭代
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans = [Int]()
        var node = root
        var stack = [TreeNode]()
        while node != nil || !stack.isEmpty {
            while node != nil {
                ans.append(node!.val)
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast().right
        }
        return ans
    }
    
    func test() {
        print(preorderTraversal(createTreeNode([1,2,3,4,5,6,7])))
    }
}
