//
//  429.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/7.
//

import Foundation

/*
 429. N 叉树的层序遍历 (中等)
 https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
 */

class Solution_429 {
    class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
    
    func levelOrder(_ root: Node?) -> [[Int]] {
        if root == nil {
            return []
        }

        var ans = [[Int]]()
        var queue = [root]
        
        while !queue.isEmpty {
            var count = queue.count
            var vals = [Int]()

            while count > 0 {
                let node = queue.removeFirst()
                vals.append(node!.val)
                
                if node!.children.count > 0 {
                    for child in node!.children {
                        queue.append(child)
                    }
                }

                count -= 1
            }

            ans.append(vals)
        }

        return ans
    }
    
    func test() {
        
    }
}
