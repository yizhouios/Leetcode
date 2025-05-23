//
//  16_117_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/28.
//

import Foundation

/*
 117. 填充每个节点的下一个右侧节点指针 II (中等)
 https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node-
 */

class Solution_16_117_Day20Plan {
    
    /// 广度优先搜索+迭代（利用多个指针）
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var first = root
        var pre: Node? = nil
        while first != nil {
            var nextFirst: Node? = nil
            while first != nil {
                if first?.left != nil {
                    if pre == nil {
                        pre = first?.left
                    } else {
                        pre?.next = first?.left
                        pre = pre?.next
                    }
                    if nextFirst == nil {
                        nextFirst = pre
                    }
                }
                if first?.right != nil {
                    if pre == nil {
                        pre = first?.right
                    } else {
                        pre?.next = first?.right
                        pre = pre?.next
                    }
                    if nextFirst == nil {
                        nextFirst = pre
                    }
                }
                first = first?.next
            }
            
            first = nextFirst
            pre = nil
        }
    
        return root
    }
    
    func test() {
        Node.printLevelNext(connect(createNode([1,2,nil])))
        Node.printLevelNext(connect(createNode([1,2,3,4,5,nil,7])))
    }
}
