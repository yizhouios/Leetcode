//
//  33.er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/12.
//

import Foundation

/*
 剑指 Offer 33. 二叉搜索树的后序遍历序列 (中等)
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/
 */

class Solution_Offer_33 {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        if postorder.isEmpty {
            return true
        }
        
        let root = postorder.last!
        var rootValid = true
        var leftPostOrder = [Int]()
        var rightPostOrder = [Int]()

        var index = 0
        let end = postorder.count - 2
        
        while index <= end {
            if postorder[index] < root {
                leftPostOrder.append(postorder[index])
            } else {
                break
            }
            index += 1
        }

        while index <= end {
            if postorder[index] > root {
                rightPostOrder.append(postorder[index])
            } else {
                rootValid = false
                break
            }

            index += 1
        }

        if !rootValid {
            return false
        }

        return verifyPostorder(leftPostOrder) && verifyPostorder(rightPostOrder)
    }
    
    /*
     测试用例：
     1. 功能测试：输入的后序序列对应一颗二叉树：完全二叉树、只有左子树、只有右子树、只有1个节点；输入的后续序列不对应一颗二叉树
     2. 特殊输入测试：空树
     */
    func test() {
        print(verifyPostorder([1,3,2]))
        print(verifyPostorder([1,3,2,6,5]))
        print(verifyPostorder([1,2,5]))
        print(verifyPostorder([7,6,5]))
        print(verifyPostorder([7]))
        print(verifyPostorder([]))
    }
}
