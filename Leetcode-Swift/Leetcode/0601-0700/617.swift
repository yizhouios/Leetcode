//
//  617.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/11.
//

import Foundation

/*
 617. 合并二叉树 (简单)
 https://leetcode-cn.com/problems/merge-two-binary-trees/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/merge-two-binary-trees/solution/he-bing-er-cha-shu-by-leetcode-solution/
 */

class Solution_617 {
    /// 广度优先搜索
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else {
            return root2
        }
        guard let root2 = root2 else {
            return root1
        }
        
        let root = TreeNode(root1.val + root2.val)
        var queue = [root]
        var queue1 = [root1]
        var queue2 = [root2]
        
        while !queue1.isEmpty && !queue2.isEmpty {
            let node = queue.removeFirst()
            let node1 = queue1.removeFirst()
            let node2 = queue2.removeFirst()
            
            if node1.left != nil && node2.left != nil {
                let newLeft = TreeNode(node1.left!.val + node2.left!.val)
                node.left = newLeft
                queue.append(newLeft)
                queue1.append(node1.left!)
                queue2.append(node2.left!)
            } else if node1.left != nil {
                node.left = node1.left
            } else {
                node.left = node2.left
            }
            
            if node1.right != nil && node2.right != nil {
                let newRight = TreeNode(node1.right!.val + node2.right!.val)
                node.right = newRight
                queue.append(newRight)
                queue1.append(node1.right!)
                queue2.append(node2.right!)
            } else if node1.right != nil {
                node.right = node1.right
            } else {
                node.right = node2.right
            }
        }
        
        return root
    }
    
    /// 深度优先搜索
    func mergeTrees_1(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else {
            return root2
        }
        guard let root2 = root2 else {
            return root1
        }
        
        let newNode = TreeNode(root1.val + root2.val)
        newNode.left = self.mergeTrees(root1.left, root2.left)
        newNode.right = self.mergeTrees(root1.right, root2.right)
        return newNode
    }
    
    func test() {
        print(mergeTrees(createTreeNode([1,3,2,5,nil,nil,nil]), createTreeNode([2,1,3,nil,4,nil,7]))!.levelOrder())
    }
}
