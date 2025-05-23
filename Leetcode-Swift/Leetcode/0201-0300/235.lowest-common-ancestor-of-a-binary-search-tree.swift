//
//  235.lowest-common-ancestor-of-a-binary-search-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/10.
//

import Foundation
/*
 235. 二叉搜索树的最近公共祖先 (简单)
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */

class Solution235 {
    /*
     思路：递归
     */
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        if root!.val > p!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else if root!.val < p!.val && root!.val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        }
        return root
    }
    
    /*
     思路：一次遍历迭代，同时判断q和q的值和当前遍历的结点大小关系
     1. 如果当前结点均大于p和q，那么继续继续遍历左子树
     2. 如果当前结点均小于p和q，那么继续继续遍历右子树
     3. 如果出现分叉，返回当前结点
     */
    func lowestCommonAncestor_iterationBy1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        var ancestor: TreeNode? = root
        while ancestor != nil {
            if ancestor!.val > p!.val && ancestor!.val > q!.val {
                ancestor = ancestor?.left
            } else if ancestor!.val < p!.val && ancestor!.val < q!.val {
                ancestor = ancestor?.right
            } else {
                break
            }
        }
        return ancestor
    }
    
    func fineNodePath(_ root: TreeNode, _ target: TreeNode) -> [TreeNode] {
        var paths: [TreeNode] = []
        var cur: TreeNode? = root
        while cur != nil {
            paths.append(cur!)
            if cur! === target {
                return paths
            } else if cur!.val > target.val {
                cur = cur?.left
            } else {
                cur = cur?.right
            }
        }
        return []
    }
    
    /*
     思路：两次迭代，记录到目标结点经过的所有结点。从头到尾遍历找到最后一个相等的结点。
     时间复杂度：O(n)
     空间复杂度：O(n)
     */
    func lowestCommonAncestor_iteraitionBy2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        let pathsOfP = fineNodePath(root!, p!)
        let pathsOfQ = fineNodePath(root!, q!)
        var lowestCommonAncestor: TreeNode? = nil
        for i in 0..<(min(pathsOfP.count, pathsOfQ.count)) {
            if pathsOfP[i] === pathsOfQ[i] {
                lowestCommonAncestor = pathsOfQ[i]
            } else {
                break
            }
        }
        return lowestCommonAncestor
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
