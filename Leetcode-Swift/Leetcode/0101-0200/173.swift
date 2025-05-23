//
//  173.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/22.
//

import Foundation

/*
 173. 二叉搜索树迭代器 (中等)
 https://leetcode-cn.com/problems/binary-search-tree-iterator/
 */

class Solution_173 {
    class BSTIterator {
        var cur: TreeNode?
        var stack: [TreeNode] = Array()
        
        init(_ root: TreeNode?) {
            self.cur = root
        }
        
        func next() -> Int {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            cur = stack.removeLast()
            let ans = cur!.val
            cur = cur?.right
            return ans
        }
        
        func hasNext() -> Bool {
            return cur != nil || !stack.isEmpty
        }
    }
    
    func test() {
        let obj = BSTIterator(createTreeNode([7,3,15,nil,nil,9,20]))
        print(obj.next()) // 3
        print(obj.next()) // 7
        print(obj.hasNext()) // true
        print(obj.next()) // 9
        print(obj.hasNext()) // true
        print(obj.next()) // 15
        print(obj.hasNext()) // true
        print(obj.next()) // 20
        print(obj.hasNext()) // false
    }
}
