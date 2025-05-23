//
//  32.3-cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/11.
//

import Foundation

/*
 剑指 Offer 32 - III. 从上到下打印二叉树 III (中等)
 https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/
 */

class Solution_Offer_32_3 {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }

        var ans = [[Int]]()
        var queue = [root]
        var level = -1
        
        while !queue.isEmpty {
            level += 1
            var vals = [Int]()
            var nextQueue = [TreeNode?]()
            // 当前是偶数层：从左到右
            // 当前是奇数层：从右到左
            let isEvenLevel = (level & 1 == 0)

            while !queue.isEmpty {
                let node = queue.removeFirst()
                vals.append(node!.val)
                
                if isEvenLevel {
                    if node?.left != nil {
                        nextQueue.insert(node?.left, at: 0)
                    }
                    if node?.right != nil {
                        nextQueue.insert(node?.right, at: 0)
                    }
                } else {
                    if node?.right != nil {
                        nextQueue.insert(node?.right, at: 0)
                    }
                    if node?.left != nil {
                        nextQueue.insert(node?.left, at: 0)
                    }
                }
            }

            queue = nextQueue
            ans.append(vals)
        }

        return ans
    }

    func levelOrder_2(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var stacks = [[TreeNode](), [TreeNode]()]
        var current = 0
        var next = 1
        
        stacks[current] = [root!]
        var ans = [[Int]]()
        var vals = [Int]()
        while !stacks[0].isEmpty || !stacks[1].isEmpty {
            let node = stacks[current].popLast()!
            vals.append(node.val)
            if current == 0 {
                if node.left != nil {
                    stacks[next].append(node.left!)
                }
                if node.right != nil {
                    stacks[next].append(node.right!)
                }
            } else {
                if node.right != nil {
                    stacks[next].append(node.right!)
                }
                if node.left != nil {
                    stacks[next].append(node.left!)
                }
            }
            
            if stacks[current].isEmpty {
                current = 1 - current
                next = 1 - next
                ans.append(vals)
                vals = [Int]()
            }
        }
        return ans
    }
    
    func levelOrder_1(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [root!]
        var direction = 1
        var ans = [[Int]]()
        while queue.count > 0 {
            var levelVals = [Int](repeating: 0, count: queue.count)
            let count = queue.count
            for i in 0..<count {
                let node = queue.removeFirst()
                if direction == 1 {
                    levelVals[i] = node.val
                } else {
                    levelVals[count - i - 1] = node.val
                }
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            ans.append(levelVals)
            direction = 1 - direction
        }
        
        return ans
    }
    
    /*
     Test cases：
     1. 功能测试：完全/非完全二叉树；所有节点都在左子树；所有节点都在右子树
     2. 特殊输入测试：空树；只有1个节点的二叉树
     */
    func test() {
        print(levelOrder(createTreeNode([1,2,3,4,5,6,7])))
        print(levelOrder(createTreeNode([1,2,3,4,5,6,nil])))
        print(levelOrder(createTreeNode([1,2,nil,3,nil])))
        print(levelOrder(createTreeNode([1,nil,2,nil,3])))
        print(levelOrder(nil))
        print(levelOrder(createTreeNode([1,nil,nil])))
    }
}
