//
//  98.validate-binary-search-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/9.
//

import Foundation
/*
 98. 验证二叉搜索树 (中等)
 https://leetcode-cn.com/problems/validate-binary-search-tree/
 */

class Solution_98 {
    /*
     思路2：递归
     时间复杂度：O(n）
     空间复杂度：O(n）
     */
    func isValidBST_recursive(_ root: TreeNode?) -> Bool {
        return isValidBST_core(root, Int.min, Int.max)
    }
    
    func isValidBST_core(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        if root == nil {
            return true
        }
        if root!.val <= min! || root!.val >= max! {
            return false
        }
        return isValidBST_core(root?.left, min, root!.val) && isValidBST_core(root?.right, root!.val, max)
    }

    
    /*
     思路1：利用中序遍历，得出数组，判断是否是升序
     */
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }

        var ans = true
        var stack = [TreeNode?]()
        var node = root
        var preVal: Int?

        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node)
                node = node?.left
            }

            node = stack.removeLast()
            let curVal = node!.val
            if let preVal = preVal, preVal >= curVal {
                ans = false
                break
            }
            
            preVal = curVal
            node = node?.right
        }

        return ans
    }
    
    func test() {
        // 错误用例
        /*
         [2,1,3]
         [5,1,4,null,null,3,6]
         [1,1]
         [5,4,6,null,null,3,7]
         */
        let root1 = createTreeNode([5,1,4,nil,nil,3,6])
        let root2 = createTreeNode([2,1,3])
        let root3 = createTreeNode([5,4,6,nil,nil,3,7])
        print(isValidBST(root1))
        print(isValidBST(root2))
        print(isValidBST(root3))
    }
}
