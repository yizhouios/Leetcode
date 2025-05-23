//
//  641.design-circular-deque.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/4.
//

import Foundation

/*
 641. 设计循环双端队列 (中等)
 https://leetcode-cn.com/problems/design-circular-deque/
 */

class Solution_641 {
    class MyCircularDeque {

        class Node {
            var val: Int
            var next: Node?
            var pre: Node?
            init(_ val: Int) {
                self.val = val
            }
        }
        var capacity: Int
        var count = 0
        var head: Node?
        var tail: Node?
        
        /** Initialize your data structure here. Set the size of the deque to be k. */
        init(_ k: Int) {
            self.capacity = k
        }
        
        
        func insertNode(_ val: Int, _ isFront: Bool) -> Bool {
            if count == capacity {
                return false
            }
            let newNode = Node(val)
            if head == nil {
                head = newNode
                tail = newNode
                head?.pre = tail
                tail?.next = head
            } else {
                newNode.next = head
                newNode.pre = head?.pre
                tail?.next = newNode
                head?.pre = newNode
            }
            count += 1
            if isFront {
                head = newNode
            } else {
                tail = newNode
            }
            return true
        }
        
        /** Adds an item at the front of Deque. Return true if the operation is successful. */
        func insertFront(_ value: Int) -> Bool {
            return self.insertNode(value, true)
        }
        
        /** Adds an item at the rear of Deque. Return true if the operation is successful. */
        func insertLast(_ value: Int) -> Bool {
            return self.insertNode(value, false)
        }
        
        /** Deletes an item from the front of Deque. Return true if the operation is successful. */
        func deleteFront() -> Bool {
            if count == 0 {
                return false
            }
            if head === tail {
                head?.next = nil
                head?.pre = nil
                tail?.next = nil
                tail?.pre = nil
                head = nil
                tail = nil
            } else {
                let newHead = head?.next
                head?.next?.pre = head?.pre
                head?.pre?.next = head?.next
                head = newHead
            }
            count -= 1
            return true
        }
        
        /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
        func deleteLast() -> Bool {
            if count == 0 {
                return false
            }
            if head === tail {
                head?.next = nil
                head?.pre = nil
                tail?.next = nil
                tail?.pre = nil
                head = nil
                tail = nil
            } else {
                let newTail = tail?.pre
                tail?.next?.pre = tail?.pre
                tail?.pre?.next = tail?.next
                tail = newTail
            }
            count -= 1
            return true
        }
        
        /** Get the front item from the deque. */
        func getFront() -> Int {
            return head?.val ?? -1
        }
        
        /** Get the last item from the deque. */
        func getRear() -> Int {
            return tail?.val ?? -1
        }
        
        /** Checks whether the circular deque is empty or not. */
        func isEmpty() -> Bool {
            return count == 0
        }
        
        /** Checks whether the circular deque is full or not. */
        func isFull() -> Bool {
            return count == capacity
        }
    }

    /**
     * Your MyCircularDeque object will be instantiated and called as such:
     * let obj = MyCircularDeque(k)
     * let ret_1: Bool = obj.insertFront(value)
     * let ret_2: Bool = obj.insertLast(value)
     * let ret_3: Bool = obj.deleteFront()
     * let ret_4: Bool = obj.deleteLast()
     * let ret_5: Int = obj.getFront()
     * let ret_6: Int = obj.getRear()
     * let ret_7: Bool = obj.isEmpty()
     * let ret_8: Bool = obj.isFull()
     */
    func test() {
        let obj = MyCircularDeque(3)
        print(obj.insertLast(1))
        print(obj.insertLast(2))
        print(obj.insertFront(3))
        print(obj.insertFront(4))
        print(obj.getRear())
        print(obj.isFull())
        print(obj.deleteLast())
        print(obj.insertFront(4))
        print(obj.getFront())
    }
}
