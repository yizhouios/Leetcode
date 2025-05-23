//
//  1367.linked-list-in-binary-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/9.
//

import Foundation

/*
 1367. 二叉树中的列表 (中等)
 https://leetcode-cn.com/problems/linked-list-in-binary-tree/
 */

class Solution_1367 {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        if head == nil {
            return true
        }
        if root == nil {
            return false
        }
        
        return dfs(head, root) || isSubPath(head, root?.left) || isSubPath(head, root?.right)
    }
    
    // 超时方法名：isSubPathCore
    func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        if head == nil {
            return true
        }
        if root == nil {
            return false
        }
        if let rootValue = root?.val, let headValue = head?.val, rootValue != headValue {
            return false
        }
        return dfs(head?.next, root?.left) || dfs(head?.next, root?.right)
    }
    
    /*
     func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
         if head == nil {
             return true
         }
         if root == nil {
             return false
         }
         return dfs(head, root) || isSubPath(head, root?.left) || isSubPath(head, root?.right)
     }
     
     func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {
         if head == nil {
             return true
         }
         
         if root == nil {
             return false
         }
         
         if let rootValue = root?.val, let headValue = head?.val, rootValue != headValue {
             return false
         }
         
         return dfs(head?.next, root?.left) || dfs(head?.next, root?.right)
     }
     */
    
    func test() {
        print(isSubPath(createListNode(values: [4,2,8]), createTreeNode([1,4,4,nil,2,2,nil,1,nil,6,8,nil,nil,nil,nil,1,3])))
        print(isSubPath(createListNode(values: [1,4,2,6]), createTreeNode([1,4,4,nil,2,2,nil,1,nil,6,8,nil,nil,nil,nil,1,3])))
        print(isSubPath(createListNode(values: [1,4,2,6,8]), createTreeNode([1,4,4,nil,2,2,nil,1,nil,6,8,nil,nil,nil,nil,1,3])))
    }
}
