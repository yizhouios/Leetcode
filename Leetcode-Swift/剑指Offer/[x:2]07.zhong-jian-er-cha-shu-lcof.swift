//
//  07.zhong-jian-er-cha-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/25.
//

import Foundation

/*
 剑指 Offer 07. 重建二叉树 (中等)
 https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/
 */

/*
 思路：
 1. 递归
 2. 迭代
 */
class Solution_Offer_07 {
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        return nil
    }
    
    func buildTree_recursive(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || preorder.count != inorder.count {
            return nil
        }
        let rootValue = preorder[0]
        let root = TreeNode(rootValue)
        var index = -1
        for i in 0..<inorder.count {
            if inorder[i] == rootValue {
                index = i
                break
            }
        }
        // 未找到是否需要抛出异常
//        if index == -1 {
//
//        }
        let leftTreeCount = index
        let rightTreeCount = inorder.count - index - 1
        if leftTreeCount != 0 {
            root.left = buildTree(Array(preorder[1...leftTreeCount]), Array(inorder[0...leftTreeCount - 1]))
        }
        if rightTreeCount != 0 {
            root.right = buildTree(Array(preorder[(leftTreeCount+1)...]), Array(inorder[(index+1)...]))
        }
        return root
    }
    
    /*
     测试用例：
     1. 功能测试：普通二叉树（完全二叉树；不完全二叉树）
     2. 特殊测试：特殊二叉树（节点都在左子树；节点都在右子树；只有1个节点）
     3. 空指针；前序遍历和中序遍历不匹配
     */
    func test() {
        print(buildTree([3,9,20,15,7], [9,3,15,20,7]))
        print(buildTree([3,9,20,15,7], [9,3,15,20,9]))
    }
}
