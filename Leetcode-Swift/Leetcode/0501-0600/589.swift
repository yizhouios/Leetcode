//
//  589.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/3/30.
//

import Foundation

/*
 589. N 叉树的前序遍历 (简单)
 https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
 */

class Solution_589 {
    class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
    
    /*
     递归解法：
     
     func preorder(_ root: Node?) -> [Int] {
         if root == nil {
             return []
         }

         var ans = [Int]()
         preorder_core(root, &ans)

         return ans
     }

     func preorder_core(_ root: Node?, _ orders: inout [Int]) {
         if root == nil {
             return
         }

         orders.append(root!.val)
         if !(root!.children.isEmpty) {
             for child in root!.children {
                 preorder_core(child, &orders)
             }
         }
     }
     */
    
    /// 迭代解法
    func preorder(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }

        var ans = [Int]()
        var node: Node? = root
        var queue = [Node]()

        while node != nil || !queue.isEmpty {
            while node != nil {
                ans.append(node!.val)
                
                if let childs = node?.children, childs.count > 0 {
                    node = childs[0]
                    if childs.count > 1 {
                        var tmpQueue = Array(childs[1...])
                        tmpQueue.append(contentsOf: queue)
                        queue = tmpQueue
                    }
                } else {
                    node = nil
                }
            }

            if node == nil && !queue.isEmpty {
                node = queue.removeFirst()
            }
        }

        return ans
    }
    
    
    
    
    func test() {
        let root = Node(1)
        
        let c1 = Node(2)
        let c2 = Node(6)
        let c3 = Node(7)
        
        root.children = [c1, c2, c3]
        
        c1.children = [Node(3), Node(4), Node(5)]
        
        print(preorder(root))
    }
}
