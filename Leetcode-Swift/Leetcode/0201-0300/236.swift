//
//  236.lowest-common-ancestor-of-a-binary-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/10.
//

import Foundation
/*
 236. 二叉树的最近公共祖先 (中等)
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */

class Solution_236 {
    /// 递归思路1
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        if root! === p! || root! === q! {
            return root
        }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        return left == nil ? right : (right == nil ? left : root)
    }
    
    /// 递归思路2
    func lowestCommonAncestor1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }

        var ans: TreeNode?
        let _ = dfs(root, p, q, &ans)
        
        return ans
    }

    func dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ ans: inout TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let leftContains = dfs(root?.left, p, q, &ans)
        if ans != nil {
            return 2
        }

        let rightContains = dfs(root?.right, p, q, &ans)
        if ans != nil {
            return 2
        }

        var rootContains = 0
        if root === p || root === q {
            rootContains = 1
        }
        if rootContains == 0 && leftContains == 1 && rightContains == 1 {
            ans = root
        }
        if rootContains == 1 && (leftContains == 1 || rightContains == 1) {
            ans = root
        }

        return leftContains + rootContains + rightContains
    }
    
    /*
     测试用例：
     1. 有公共祖先：公共祖先为q或q或根节点；p/q相等；公共祖先在左子树；公共祖先在右子树
     2. 没有公共祖先
     3. 空节点
     */
    func test() {
        let root1 = createTreeNode([5,3,9,2,4,7,10])
        print(lowestCommonAncestor(root1, root1?.left, root1?.left?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.right, root1?.right?.left)?.val)
        print(lowestCommonAncestor(root1, root1?.right?.left, root1?.right?.left)?.val)
        print(lowestCommonAncestor(root1, root1?.left?.left, root1?.right?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.left?.left, root1?.left?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.right?.left, root1?.right?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.right?.left, TreeNode(1))?.val)
        print(lowestCommonAncestor(root1, nil, root1?.right?.right)?.val)
    }
}
