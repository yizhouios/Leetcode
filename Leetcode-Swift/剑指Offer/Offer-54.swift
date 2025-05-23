//
//  54.er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/26.
//

import Foundation

/*
 剑指 Offer 54. 二叉搜索树的第k大节点 (简单)
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/
 */

class Solution_Offer_54 {
//    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
//        if root == nil || k <= 0 {
//            return -1
//        }
//        var k = k
//        return kthLargestCore(root, &k) ?? -1
//    }
//
//    func kthLargestCore(_ root: TreeNode?, _ k: inout Int) -> Int? {
//        if root == nil {
//            return nil
//        }
//
//        var ans: Int? = nil
//
//        if root?.left != nil {
//            ans = kthLargestCore(root?.left, &k)
//        }
//
//        if ans == nil {
//            if k == 1 {
//                ans = root?.val
//            }
//
//            k -= 1
//        }
//
//        if ans == nil && root?.right != nil {
//            ans = kthLargestCore(root?.right, &k)
//        }
//
//        return ans
//    }
    
    /// beself
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return 0
        }

        var ans = root!.val
        var node = root
        var stack = [TreeNode?]()
        var k = k

        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node)
                node = node?.right
            }

            node = stack.removeLast()
            k -= 1

            if k == 0 {
                ans = node!.val
                break
            }

            node = node?.left
        }

        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：在开头、结尾、中间；不同形态的二叉树
     2. 边界值测试：k为0、1、二叉树的节点数、二叉树的节点数+1
     3. 特殊输入测试：空树
     */
    func test() {
        let tests = [
            ([1,2,nil,3,nil],1),
            ([1,2,nil,3,nil],2),
            ([1,2,nil,3,nil],3),
            ([1,2,nil,3,nil],4),
            ([1,nil,2,nil,3],1),
            ([5,3,6,2,4,nil,nil,1,nil,nil,nil], 3),
            ([3,1,4,nil,nil,nil,2], 0),
            ([3,1,4,nil,nil,nil,2], 1),
            ([3,1,4,nil,nil,nil,2], 4),
            ([3,1,4,nil,nil,nil,2], 5),
        ]
        
        for test in tests {
            print(kthLargest(createTreeNode(test.0), test.1))
        }
    }
}
