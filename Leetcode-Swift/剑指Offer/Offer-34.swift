//
//  34.er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/12.
//

import Foundation

/*
 剑指 Offer 34. 二叉树中和为某一值的路径 (中等)
 https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/
 */

class Solution_Offer_34 {
    var curSum = 0
    var curNodeVals = [Int]()
    var ans = [[Int]]()

    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        preorder(root, target)
        return ans
    }

    func preorder(_ root: TreeNode?, _ target: Int) {
        if root == nil {
            return
        }

        curSum += root!.val
        curNodeVals.append(root!.val)

        if (root?.left == nil) && (root?.right == nil) {
            if target == curSum {
                ans.append(curNodeVals)
            }

            curNodeVals.removeLast()
            curSum -= root!.val

            return
        }

        preorder(root?.left, target)
        preorder(root?.right, target)

        curSum -= root!.val
        curNodeVals.removeLast()
    }
    
    /*
     测试用例：
     1. 功能测试：二叉树有1条、多条符合；没有符合
     2. 特殊输入测试：空树
     */
    func test() {
        print(pathSum(createTreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,5,1]), 22))
        print(pathSum(createTreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,1,1]), 22))
        print(pathSum(createTreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,1,1]), 25))
        print(pathSum(nil, 10))
    }
}
