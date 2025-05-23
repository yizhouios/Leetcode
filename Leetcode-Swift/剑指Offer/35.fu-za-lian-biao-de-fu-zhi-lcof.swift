//
//  35.fu-za-lian-biao-de-fu-zhi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/13.
//

import Foundation

/*
 剑指 Offer 35. 复杂链表的复制 (中等)
 https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/
 同主站138.复制带随机指针的链表: https://leetcode-cn.com/problems/copy-list-with-random-pointer/
 */

class Solution_Offer_35 {
    class Node {
        var val: Int
        var next: Node?
        var random: Node?
        init(_ val: Int) {
           self.val = val
           self.next = nil
           self.random = nil
        }
        
        static public func createNodes(_ vals: [[Int?]]) -> Node? {
            if vals.count == 0 {
                return nil
            }
            var nodes = [Node]()
            nodes.append(Node(vals.first![0]!))
            if vals.count > 1 {
                var lastNode = nodes.first!
                for values in vals[1...] {
                    let tmpNode = Node(values[0]!)
                    lastNode.next = tmpNode
                    nodes.append(tmpNode)
                    lastNode = tmpNode
                }
            }
            
            for (index, node) in nodes.enumerated() {
                guard let randomIndex = vals[index][1] else {
                    continue
                }
                node.random = nodes[randomIndex]
            }
            
            return nodes.first
        }
        
        static public func printNodes(_ head: Node?) {
            var values = [(Int, Int?)]()
            var head = head
            while head != nil {
                values.append((head!.val, head?.random?.val != nil ? head!.random!.val : nil))
                head = head?.next
            }
            print(values)
        }
    }
    
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil {
            return nil
        }
        cloneNodes(head!)
        connectSiblingNodes(head!)
        return splitToClonedNodes(head!)
    }
    
    func cloneNodes(_ head: Node) {
        var node: Node? = head
        while node != nil {
            let cloneNode = Node(node!.val)
            cloneNode.next = node!.next
            node!.next = cloneNode
            node = cloneNode.next
        }
    }
    
    func connectSiblingNodes(_ head: Node) {
        var node: Node? = head
        while node != nil {
            let cloedNode = node?.next
            if node?.random != nil {
                cloedNode?.random = node?.random?.next
            }
            node = cloedNode?.next
        }
    }
    
    func splitToClonedNodes(_ head: Node) -> Node? {
        let rootA = head
        let rootB = head.next
        
        var pNode = head.next?.next
        
        head.next = nil
        head.next?.next = nil
        
        var endA = rootA
        var endB = rootB
    
        while pNode != nil {
            let tmp = pNode?.next?.next
            
            endA.next = pNode
            endA = endA.next!
            
            endB?.next = pNode?.next
            endB = endB?.next!
            
            pNode?.next = nil
            pNode?.next?.next = nil
            
            pNode = tmp
        }
        
        return rootB
    }
    
    func splitToClonedNodes_book(_ head: Node) -> Node? {
        var pNode: Node? = head
        var pClonedHead: Node? = nil
        var pClonedNode: Node? = nil
        
        pClonedHead = pNode?.next
        pClonedNode = pNode?.next
        pNode?.next = pClonedNode?.next
        pNode = pNode?.next
        
        while pNode != nil {
            pClonedNode?.next = pNode?.next
            pClonedNode = pClonedNode?.next
            pNode?.next = pClonedNode?.next
            pNode = pNode?.next
        }
        
        return pClonedHead
    }
    
    /*
     测试用例：
     1. 功能测试：节点中random指向自身；两个节点的random形成环状；链表中只有1个节点
     2. 特殊输入测试：空链表
     */
    func test() {
        Node.printNodes(copyRandomList(Node.createNodes([[7,nil],[13,0],[11,4],[10,2],[1,0]])))
        Node.printNodes(copyRandomList(Node.createNodes([[7,nil]])))
    }
}
