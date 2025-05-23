//
//  599.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/4/10.
//

import Foundation

/*
 559. N 叉树的最大深度 (简单)
 https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/
 */

class Solution_599 {
    class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
    
    func maxDepth(_ root: Node?) -> Int {
        if root == nil {
            return 0
        }

        var height = 0
        var queue = [root]

        while !queue.isEmpty {
            height += 1

            var count = queue.count
            while count > 0 {
                let node = queue.removeFirst()!
                if !node.children.isEmpty {
                    queue += node.children
                }

                count -= 1
            }
        }

        return height
    }
}
