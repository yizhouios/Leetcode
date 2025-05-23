//
//  32_653.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/17.
//

import Foundation

/*
 653. 两数之和 IV - 输入 BST (简单)
 https://leetcode-cn.com/problems/two-sum-iv-input-is-a-bst/
 */

class Solution_653_3weeksDataStructures {
    /// 中序遍历迭代 + set
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var stack = [TreeNode]()
        var set = Set<Int>()
        var cur = root
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            cur = stack.removeLast()
            if set.contains(k - cur!.val) {
                return true
            }
            set.insert(cur!.val)
            cur = cur?.right
        }
        
        return false
    }
    
    /// 中序遍历迭代 + 双指针
    func findTarget_3(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var stack = [TreeNode]()
        var vals = [Int]()
        var cur = root
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            cur = stack.removeLast()
            vals.append(cur!.val)
            cur = cur?.right
        }
        
        var left = 0, right = vals.count - 1
        while left < right {
            let sum = vals[left] + vals[right]
            if sum == k {
                return true
            } else if sum > k {
                right -= 1
            } else if sum < k {
                left += 1
            }
        }
        
        return false
    }
    
    func test() {
        print(findTarget(createTreeNode([5,3,6,2,4,nil,7]), 9))
    }
}
