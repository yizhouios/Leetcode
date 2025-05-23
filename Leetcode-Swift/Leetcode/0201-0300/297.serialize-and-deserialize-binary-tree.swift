//
//  297.serialize-and-deserialize-binary-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/15.
//

import Foundation

/*
 297. 二叉树的序列化与反序列化 (困难)
 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
 */

class Solution_297 {
    class Codec {
        func serialize(_ root: TreeNode?) -> String {
            if root == nil {
                return "[]"
            }
            
            var queue = [TreeNode?]()
            queue.append(root!)
            var nodeVals = [String]()
            var count = 1
            while queue.count > 0 {
                var loops = count
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
                
                count = queue.count
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
