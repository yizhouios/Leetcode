//
//  33_235.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/17.
//

import Foundation

/*
 235. 二叉搜索树的最近公共祖先 (简单)
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */

class Solution_235_3weeksDataStructures {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var root = root
        while true {
            if root!.val > p!.val && root!.val > q!.val {
                root = root?.left
            } else if root!.val < p!.val && root!.val < q!.val {
                root = root?.right
            } else {
                break
            }
        }
        return root
    }
    
    func test() {
        
    }
}
