//
//  commonMethods.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/3.
//

import Foundation


func createListNode(values: [Int]) -> ListNode? {
    var resNode: ListNode? = nil
    if values.count > 0 {
        var lastNode: ListNode? = nil
        for value in values {
            let node = ListNode(value)
            if lastNode != nil {
                lastNode?.next = node
                lastNode = node
            } else {
                lastNode = node
                resNode = lastNode
            }
        }
    }
    return resNode
}

func createCycleListNode(_ values: [Int], pos: Int) -> ListNode? {
    if values.count != 0 && pos != -1 {
        let head: ListNode? = createListNode(values: values)
        
        var endNode: ListNode? = head
        while endNode?.next != nil {
            endNode = endNode?.next
        }
        
        var entranceNode: ListNode? = head
        var index = 0
        while index != pos {
            index += 1
            entranceNode = entranceNode?.next
        }
        
        endNode?.next = entranceNode
        return head
    } else {
        return createListNode(values: values)
    }
}

/// 依次打印链表节点
func printListNode(rootNode: ListNode?) {
    if rootNode == nil {
        print("nil")
        return
    }
    var curNode = rootNode
    var result: [Int] = []
    repeat {
        result.append(curNode!.val)
        curNode = curNode!.next
    } while curNode != nil
    
    print(result, separator: ",", terminator: "\n")
}

func createTreeNode(_ list: [Int?]) -> TreeNode? {
    if list.count < 3 || list[0] == nil {
        return nil
    }
    var queue: [Int?] = list
    let root = TreeNode(list[0]!)
    queue.removeFirst()
    var waitToSetNodes: [TreeNode] = [root]
    while queue.count != 0 {
        var tmpNewNodes: [TreeNode] = []
        for node in waitToSetNodes {
            if queue[0] != nil {
                let left = TreeNode(queue[0]!)
                node.left = left
                tmpNewNodes.append(left)
            }
            queue.removeFirst()
            if queue[0] != nil {
                let right = TreeNode(queue[0]!)
                node.right = right
                tmpNewNodes.append(right)
            }
            queue.removeFirst()
        }
        waitToSetNodes = tmpNewNodes
    }
    return root
}

func createNode(_ list: [Int?]) -> Node? {
    if list.count < 3 || list[0] == nil {
        return nil
    }
    var queue: [Int?] = list
    let root = Node(list[0]!)
    queue.removeFirst()
    var waitToSetNodes: [Node] = [root]
    while queue.count != 0 {
        var tmpNewNodes: [Node] = []
        for node in waitToSetNodes {
            if queue[0] != nil {
                let left = Node(queue[0]!)
                node.left = left
                tmpNewNodes.append(left)
            }
            queue.removeFirst()
            if queue[0] != nil {
                let right = Node(queue[0]!)
                node.right = right
                tmpNewNodes.append(right)
            }
            queue.removeFirst()
        }
        waitToSetNodes = tmpNewNodes
    }
    return root
}

public class LeetCodeTestCaseTool {
    
    /// LeetCode二维数组字符串转数组
    /// - Parameter text: 二维数组字符串
    /// Something like this:
    /// [1,1,2,3,4,5]
    /// [1,2,3,1,2,3]
    /// [1,2,3,4,10]
    /// []
    /// - Returns: 二维数组
    static func arrayWithMultilineText(_ text: String) -> [[Int]] {
        var items = text.split(separator: "\n")
        for (index, i) in items.enumerated() {
            if i.count > 0 && i.first! == "[" {
                items[index].removeFirst()
            }
            if i.count > 0 && i.last! == "]" {
                items[index].removeLast()
            }
        }
//        if items.count > 0 && items.last! == "" {
//            items.removeLast()
//        }
        
        if items.count == 0 {
            return []
        }
        
        var ans = [[Int]]()
        for i in items {
            ans.append(i.split(separator: ",").map { (value) -> Int in
                let val = Int(value)
                if val == nil {
                    assert(false, "\(value) 不能转为Int，请检查~")
                }
                return val!
            })
        }
        
        return ans
    }
}
