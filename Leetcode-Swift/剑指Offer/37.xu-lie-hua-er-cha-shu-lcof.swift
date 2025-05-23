//
//  37.xu-lie-hua-er-cha-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/15.
//

import Foundation

/*
 剑指 Offer 37. 序列化二叉树 (困难)
 https://leetcode-cn.com/problems/xu-lie-hua-er-cha-shu-lcof/
 同主站题目：297. 二叉树的序列化与反序列化 （困难）
 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
 */

class Solution_Offer_37 {
    class Codec {
        func serialize(_ root: TreeNode?) -> String {
            if root == nil {
                return "[]"
            }
            
            var queue = [TreeNode?]()
            queue.append(root!)
            var nodeVals = [String]()
            while queue.count > 0 {
                var loops = queue.count
                var hasNextLevel = false
                while loops > 0 {
                    let node = queue.removeFirst()
                    if node != nil {
                        nodeVals.append("\(node!.val)")
                        if node?.left != nil || node?.right != nil {
                            hasNextLevel = true
                        }
                        queue.append(node?.left ?? nil)
                        queue.append(node?.right ?? nil)
                    } else {
                        nodeVals.append("null")
                    }
        
                    loops -= 1
                }
                if !hasNextLevel {
                    break
                }
            }
            return "[" + nodeVals.joined(separator: ",") + "]"
        }
        
        func deserialize(_ data: String) -> TreeNode? {
            if data.count < 3 {
                return nil
            }
            if data.first != "[" || data.last != "]" {
                return nil
            }
            
            var data = data
            data = String(Array(data)[1...(data.count - 2)])
            
            var nodeVals = data.split(separator: ",")
            if nodeVals.count > 0 && nodeVals.first != "null" {
                let root = TreeNode(Int(nodeVals.first!)!)
                nodeVals.removeFirst()
                var queue = [TreeNode?]()
                queue.append(root)
                while nodeVals.count > 0 {
                    var count = queue.count
                    while count > 0 && nodeVals.count > 0 {
                        let node = queue.removeFirst()
                        if node != nil {
                            let leftVal = nodeVals.removeFirst()
                            let rightVal = nodeVals.removeFirst()
                            if leftVal != "null" {
                                node?.left = TreeNode(Int(leftVal)!)
                                queue.append(node?.left)
                            } else {
                                node?.left = nil
                            }
                            if rightVal != "null" {
                                node?.right = TreeNode(Int(rightVal)!)
                                queue.append(node?.right)
                            } else {
                                node?.right = nil
                            }
                        }
                        count -= 1
                    }
                }
                
                return root
            }
            
            return nil
        }
    }

    // Your Codec object will be instantiated and called as such:
    // var ser = Codec()
    // var deser = Codec()
    // deser.deserialize(ser.serialize(root))
    
    func test() {
        let ser = Codec()
        let deser = Codec()
        print(ser.serialize(deser.deserialize("[1,2,3,null,null,4,5]")))
        print(ser.serialize(deser.deserialize("[1,2,3,null,null,4,5,6,7]")))
        
        print(ser.serialize(deser.deserialize("[]")))
        print(ser.serialize(deser.deserialize("[1]")))
        print(ser.serialize(deser.deserialize("[1,2,null,3,null]")))
    }
}



/*
 Javascript 解法:
 
 function TreeNode(val) {
     this.val = val;
     this.left = this.right = null;
 }

 /**
  * Encodes a tree to a single string.
  *
  * @param {TreeNode} root
  * @return {string}
  */
  var serialize = function(root) {
     if (root == null) {
         return "[]"
     }
     var queue = [root]
     var nodeVals = []

     while (queue.length > 0) {
         var hasNextLevel = false
         var count = queue.length
         while (count > 0) {
             let head = queue[0]
             queue.shift()
             if (head != null) {
                 nodeVals.push(head.val)
                 if (head.left != null || head.right != null) {
                     hasNextLevel = true
                 }
                 queue.push(head.left)
                 queue.push(head.right)
             } else {
                 nodeVals.push("null")
             }
             count -= 1
         }
         if (!hasNextLevel) {
             break
         }
     }

     return "[" + nodeVals.join(",") + "]"
 };

 /**
  * Decodes your encoded data to tree.
  *
  * @param {string} data
  * @return {TreeNode}
  */
 var deserialize = function(data) {
     if (data.length < 3) {
         return null
     }
     data = data.substring(1, data.length - 1)
     var nodeVals = data.split(",")
     if (nodeVals.length > 0 && nodeVals[0] !== "null") {
         let root = new TreeNode(parseInt(nodeVals[0]))
         nodeVals.shift()
         var queue = [root]
         while (nodeVals.length > 0) {
             var count = queue.length
             while (count > 0) {
                 let node = queue[0]
                 queue.shift()
                 if (node != null) {
                     let leftVal = nodeVals[0]
                     let rightVal = nodeVals[1]
                     nodeVals.shift()
                     nodeVals.shift()
                     if (leftVal != "null") {
                         node.left = new TreeNode(parseInt(leftVal))
                         queue.push(node.left)
                     }
                     if (rightVal != "null") {
                         node.right = new TreeNode(parseInt(rightVal))
                         queue.push(node.right)
                     }
                 }
                 count -= 1
             }
         }
         return root
     }
     return null
 };

 /**
  * Your functions will be called as such:
  * deserialize(serialize(root));
  */

  console.log(serialize(deserialize("[1,2,3,null,null,4,5]")));
  console.log(serialize(deserialize("[1,2,3,null,null,4,5,6,7]")));
 */
