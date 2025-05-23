//
//  111.minimum-depth-of-binary-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/16.
//

import Foundation

/*
 111. 二叉树的最小深度 (简单)
 https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
 */

class Solution111 {
    
    /*
     思路：BFS
     */
    func minDepth_1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var ans = 1
        var queue = [root!]
        while queue.count > 0 {
            let count = queue.count
            for _ in 0..<count {
                let queueHead = queue.removeFirst()
                if queueHead.left == nil, queueHead.right == nil {
                    return ans
                } else {
                    if queueHead.left != nil {
                        queue.append(queueHead.left!)
                    }
                    if queueHead.right != nil {
                        queue.append(queueHead.right!)
                    }
                }
            }
            ans += 1
        }
        
        return ans
    }
    
    /*
     思路：DFS
     */
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root?.left == nil, root?.right == nil {
            return 1
        }
        let leftMinDepth = minDepth(root?.left)
        let rightMinDepth = minDepth(root?.right)
        
        return leftMinDepth == 0 ? rightMinDepth + 1 : (rightMinDepth == 0 ? leftMinDepth + 1 : (min(leftMinDepth, rightMinDepth) + 1))
    }
    
    /*
     测试用例：
     1. 节点都在左子树；都在右子树；分布在左右（最小深度在第二层；第三层等）
     2. 仅1个节点
     3. 空
     */
    func test() {
        let n1 = createTreeNode([1,2,nil,3,nil])
        let n2 = createTreeNode([1,nil,2,nil,3])
        let n3 = createTreeNode([1,2,nil,4,5])
        let n4 = createTreeNode([1,2,3,4,5,nil,nil])
        let n5 = createTreeNode([1,2,3,nil,nil,4,5])
        let n6 = createTreeNode([1,nil,nil])
        print(minDepth(n1))
        print(minDepth(n2))
        print(minDepth(n3))
        print(minDepth(n4))
        print(minDepth(n5))
        print(minDepth(n6))
        print(minDepth(nil))
    }
}

