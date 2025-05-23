//
//  590.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/4.
//

import Foundation

/*
 590. N 叉树的后序遍历 (简单)
 https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/
 */

class Solution_590 {
    class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
    
    /// 迭代解法
    func postorder(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }

        var ans = [Int]()
        var node: Node? = root
        var queue = [Node]()
        var addedChildNodes = [String: Bool]()

        while node != nil || !queue.isEmpty {
            if node != nil {
                if node!.children.count > 0 && addedChildNodes[keyOfNode(node!)] == nil {
                    queue = node!.children + [node!] + queue
                    addedChildNodes[keyOfNode(node!)] = true
                } else {
                    ans.append(node!.val)
                }
                node = nil
            } else {
                node = queue.removeFirst()
            }
        }

        return ans
    }
    
    func keyOfNode(_ node: Node) -> String {
        let a = Unmanaged.passUnretained(node as AnyObject).toOpaque()
        return String(a.hashValue)
    }
    
    func test() {
        let root = Node(1)

        let c1 = Node(2)
        let c2 = Node(6)
        let c3 = Node(7)
        
        root.children = [c1, c2, c3]
        
        c1.children = [Node(3), Node(4), Node(5)]
        
        print(postorder(root))
    }
}
