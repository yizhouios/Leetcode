//
//  32.1-cong-shang-dao-xia-da-yin-er-cha-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/10.
//

import Foundation

/*
 剑指 Offer 32 - I. 从上到下打印二叉树 (中等)
 https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
 */

class Solution_Offer_32_1 {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var ans = [Int]()
        var queue = [root]

        while !queue.isEmpty {
            let head = queue.removeFirst()
            ans.append(head!.val)

            if head?.left != nil {
                queue.append(head?.left)
            }
            if head?.right != nil {
                queue.append(head?.right)
            }
        }

        return ans
    }
    
    /*
     Test cases：
     1. 功能测试：完全/非完全二叉树；所有节点都在左子树；所有节点都在右子树
     2. 特殊输入测试：空树；只有1个节点的二叉树
     */
    func test() {
        print(levelOrder(createTreeNode([1,2,3,4,5,6,7])))
        print(levelOrder(createTreeNode([1,2,3,4,5,6,nil])))
        print(levelOrder(createTreeNode([1,2,nil,3,nil])))
        print(levelOrder(createTreeNode([1,nil,2,nil,3])))
        print(levelOrder(nil))
        print(levelOrder(createTreeNode([1,nil,nil])))
    }
}
