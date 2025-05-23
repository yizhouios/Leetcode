//
//  707.design-linked-list.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/24.
//

import Foundation

/*
 707. 设计链表 (中等)
 https://leetcode-cn.com/problems/design-linked-list/
 */

class Solution_707 {
    class MyLinkedList {

        var items: [Int] = []
        var count: Int = 0
        /** Initialize your data structure here. */
        init() {
            
        }
        
        /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
        func get(_ index: Int) -> Int {
            if index < 0 || index > (count - 1) {
                return -1
            }
            return items[index]
        }
        
        /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
        func addAtHead(_ val: Int) {
            count += 1
            items.insert(val, at: 0)
        }
        
        /** Append a node of value val to the last element of the linked list. */
        func addAtTail(_ val: Int) {
            count += 1
            items.append(val)
        }
        
        /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
        func addAtIndex(_ index: Int, _ val: Int) {
            if index < 0 || index > count {
                return
            }
            count += 1
            if index == count {
                items.append(val)
            } else {
                items.insert(val, at: index)
            }
        }
        
        /** Delete the index-th node in the linked list, if the index is valid. */
        func deleteAtIndex(_ index: Int) {
            if index < 0 || index >= count {
                return
            }
            count -= 1
            items.remove(at: index)
        }
    }

    /**
     * Your MyLinkedList object will be instantiated and called as such:
     * let obj = MyLinkedList()
     * let ret_1: Int = obj.get(index)
     * obj.addAtHead(val)
     * obj.addAtTail(val)
     * obj.addAtIndex(index, val)
     * obj.deleteAtIndex(index)
     */
    
    
    func test() {
        print("fda")
    }
}
