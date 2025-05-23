//
//  DataStructure.swift
//  LeetCode-Library
//
//  Created by yizhou on 2025/5/23.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    // MARK: - 实例方法
    func inorder() -> [Int] {
        return TreeNode.inorder(self)
    }
    
    func preorder() -> [Int] {
        return TreeNode.preorder(self)
    }
    
    func postorder() -> [Int] {
        return TreeNode.preorder(self)
    }
    
    func levelOrder() -> [Int] {
        return TreeNode.levelOrder(self)
    }
    
    // MARK: - 类方法
    public static func inorder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return inorder(root?.left) + [root!.val] + inorder(root?.right)
    }
    
    public static func preorder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return [root!.val] + preorder(root?.left) +  preorder(root?.right)
    }
    
    public static func postorder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return postorder(root?.left) +  postorder(root?.right) + [root!.val]
    }
    
    public static func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var queue1 = [root]
        var ans = [Int]()
        while queue1.count > 0 {
            let head = queue1.removeFirst()!
            ans.append(head.val)
            
            if head.left != nil {
                queue1.append(head.left!)
            }
            if head.right != nil {
                queue1.append(head.right!)
            }
        }
        return ans
    }
}

// Definition for a Node.
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
    
    static func printLevelNext(_ root: Node?) {
        if root == nil {
            return
        }
        
        var ans = [String]()
        var head = root
        while head != nil {
            var newHead: Node? = nil
            while head != nil {
                if newHead == nil {
                    newHead = head?.left
                }
                if newHead == nil {
                    newHead = head?.right
                }
                ans.append("\(head!.val)")
                head = head?.next
            }
            ans.append("#")
            head = newHead
        }
        print(ans)
    }
}

/// Trie树（字典树）
class Trie {
    var isEndOfWord = false
    var nexts = [Character: Trie]()
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var next = self

        for character in word {
            if let temp = next.nexts[character] {
                next = temp
            } else {
                let temp = Trie()
                next.nexts[character] = temp
                next = temp
            }
        }

        next.isEndOfWord = true
    }
    
    func searchPrefix(_ prefix: String) -> Trie? {
        if prefix.count == 0 {
            return nil
        }
        
        var next = self
        for character in prefix {
            if let temp = next.nexts[character] {
                next = temp
            } else {
                return nil
            }
        }
        return next
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let searchedNode = searchPrefix(word)
        return searchedNode != nil && searchedNode!.isEndOfWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return searchPrefix(prefix) != nil
    }
}
