//
//  102.binary-tree-level-order-traversal.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/15.
//

import Foundation

/*
 102. 二叉树的层序遍历 (中等)
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 */

class Solution_102 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }

        var ans = [[Int]]()
        var queue = [root]
        var levelCount = 1

        while !queue.isEmpty {
            var levelVals = [Int]()
            var count = levelCount
            levelCount = 0

            while count > 0 {
                let node = queue.removeFirst()

                levelVals.append(node!.val)

                if node?.left != nil {
                    queue.append(node?.left)
                    levelCount += 1
                }
                if node?.right != nil {
                    queue.append(node?.right)
                    levelCount += 1
                }

                count -= 1
            }

            ans.append(levelVals)
        }

        return ans
    }
    
    /*
     测试用例：
     1. 节点都在左子树；节点都在右子树；节点分布在左右子树
     2. 仅1个节点；
     3. 空节点
     */
    func test() {
        let n1 = createTreeNode([1,2,nil,3,nil,nil,nil])
        let n2 = createTreeNode([1,nil,2,nil,3])
        let n3 = createTreeNode([3,9,20,nil,nil,15,7])
        let n4 = createTreeNode([3,9,20,15,7,nil,nil])
        let n5 = createTreeNode([1,nil,nil])
        print(levelOrder(n1))
        print(levelOrder(n2))
        print(levelOrder(n3))
        print(levelOrder(n4))
        print(levelOrder(n5))
        print(levelOrder(nil))
    }
}
