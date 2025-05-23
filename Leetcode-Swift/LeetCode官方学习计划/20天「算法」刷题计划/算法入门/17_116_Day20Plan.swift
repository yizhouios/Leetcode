//
//  116_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/15.
//

import Foundation

/*
 116. 填充每个节点的下一个右侧节点指针 (中等)
 https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node/solution/tian-chong-mei-ge-jie-dian-de-xia-yi-ge-you-ce-2-4/
 */

class Solution_116_Day20Plan {
    // Definition for a Node.
    class Node {
        var val: Int
        var left: Node?
        var right: Node?
        var next: Node?
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.next = nil
        }
    }
    
    /// 借助已建立的next指针（深度优先搜索）
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        func connectCore(_ root: Node?, _ rootNext: Node?) {
            guard let root = root else {
                return
            }
            
            root.left?.next = root.right
            root.right?.next = rootNext?.left
            connectCore(root.left, root.left?.next)
            connectCore(root.right, root.right?.next)
        }
        
        connectCore(root, nil)
        
        return root
    }
    
    /// 借助已建立的next指针（广度优先搜索）
    func connect_2(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var left = root
        while left != nil {
            if left?.left != nil {
                left?.left?.next = left?.right
            }
            if left?.right != nil, left?.next != nil {
                left?.right?.next = left?.next?.left
            }
            left = left?.next
        }
        let _ = connect(root?.left)
        
        return root
    }
    
    /// 层次遍历
    func connect_1(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var queue = [Node]()
        queue.append(root!)
        while !queue.isEmpty {
            var count = queue.count
            while count > 0 {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                if count != 1 {
                    node.next = queue.first
                }
                count -= 1
            }
        }
        
        return root
    }
    
    func test() {
        
    }
}
