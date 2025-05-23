//
//  109.convert-sorted-list-to-binary-search-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/14.
//

import Foundation

/*
 109. 有序链表转换二叉搜索树 (中等)
 https://leetcode-cn.com/problems/convert-sorted-list-to-binary-search-tree/
 */

class Solution_109 {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {
            return nil
        }
        
        var vals = [Int]()
        var node = head
        while node != nil {
            vals.append(node!.val)
            node = node?.next
        }
        
        let a = createBST(vals)
        return a
    }
    
    func createBST(_ vals: [Int]) -> TreeNode? {
        if vals.count == 0 {
            return nil
        }
        
        let midIndex = vals.count / 2
        let rootNode = TreeNode(vals[midIndex])
        
        rootNode.left = createBST(Array(vals[0..<midIndex]))
        rootNode.right = createBST(Array(vals[(midIndex + 1)...]))
        return rootNode
    }
    
    /*
     测试用例：
     1. 功能：1个元素、多个元素
     2. 特殊：空链表
     */
    func test() {
        let tests = """
[-10,-3,0,5,9]
[-10]
[-10,-3,0]
[-10,-3,0,5]
[]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            print(sortedListToBST(createListNode(values: i))?.levelOrder() ?? "nil")
        }
    }
}
