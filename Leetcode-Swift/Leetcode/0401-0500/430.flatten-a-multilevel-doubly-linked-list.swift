//
//  430.flatten-a-multilevel-doubly-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/21.
//

import Foundation

/*
 430. 扁平化多级双向链表 (中等)
 https://leetcode-cn.com/problems/flatten-a-multilevel-doubly-linked-list/
 */

class Solution_430 {
    
//  Definition for a Node.
    public class Node {
        public var val: Int
        public var prev: Node?
        public var next: Node?
        public var child: Node?
        public init(_ val: Int) {
            self.val = val
            self.prev = nil
            self.next = nil
            self.child  = nil
        }
    }
    
    func flatten(_ head: Node?) -> Node? {
        if head == nil {
            return nil
        }
        let _ = flattern_core(head)
        return head
    }
    
    func flattern_core(_ head: Node?) -> (Node, Node?)? {
        if head == nil {
            return nil
        }
        
        var cur = head
        var pre: Node? = nil
        while cur != nil {
            let next = cur?.next
            if cur?.child != nil {
                let child = flattern_core(cur?.child)
                cur?.child = nil
                child?.0.prev = cur
                cur?.next = child?.0
                child?.1?.next = next
                next?.prev = child?.1
                if child?.1 === child?.0 {
                    pre = cur
                } else {
                    pre = child?.1
                }
                cur = child?.0
            } else {
                pre = cur
                cur = next
            }
        }
        
        return (head!, pre)
    }
    
    /*
     测试用例：
     1. 功能：多级链表child有只有1个节点的
     */
    
    /*
     [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
     [1,null,2,null,3,null]
     [1,2,null,3]
     [1,2,3,4,5,6,null,null,null,7,8,null,null,11,12]
     */
    func test() {
        print("fda")
    }
}
