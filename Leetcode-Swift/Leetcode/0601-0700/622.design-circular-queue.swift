//
//  622.design-circular-queue.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/5.
//

import Foundation

/*
 622. 设计循环队列 (中等)
 https://leetcode-cn.com/problems/design-circular-queue/
 */

class Solution_622 {
    class MyCircularQueue {

        class Node {
            var val: Int
            var next: Node?
            init(_ val: Int) {
                self.val = val
            }
        }
        var capacity: Int
        var count = 0
        var head: Node?
        var tail: Node?
        
        init(_ k: Int) {
            self.capacity = k
        }
        
        func enQueue(_ value: Int) -> Bool {
            if count == capacity {
                return false
            }
            let node = Node(value)
            if head == nil {
                head = node
                tail = node
                head?.next = tail
                tail?.next = head
            } else {
                node.next = head
                tail?.next = node
                tail = node
            }
            count += 1
            return true
        }
        
        func deQueue() -> Bool {
            if count == 0 {
                return false
            }
            if head?.next === head {
                head?.next = nil
                tail?.next = nil
                head = nil
                tail = nil
            } else {
                tail?.next = head?.next
                head = head?.next
                
            }
            count -= 1
            return true
        }
        
        func Front() -> Int {
            guard let head = self.head else {
                return -1
            }
            return head.val
        }
        
        func Rear() -> Int {
            guard let tail = self.tail else {
                return -1
            }
            return tail.val
        }
        
        func isEmpty() -> Bool {
            return count == 0
        }
        
        func isFull() -> Bool {
            return count == capacity
        }
    }

    /**
     * Your MyCircularQueue object will be instantiated and called as such:
     * let obj = MyCircularQueue(k)
     * let ret_1: Bool = obj.enQueue(value)
     * let ret_2: Bool = obj.deQueue()
     * let ret_3: Int = obj.Front()
     * let ret_4: Int = obj.Rear()
     * let ret_5: Bool = obj.isEmpty()
     * let ret_6: Bool = obj.isFull()
     */
    func test() {
        let obj = MyCircularQueue(3)
        print(obj.enQueue(1))
        print(obj.enQueue(2))
        print(obj.enQueue(3))
        print(obj.enQueue(4))
        print(obj.Front())
        print(obj.Rear())
        print(obj.isFull())
        print(obj.isEmpty())
        
        print(obj.deQueue())
        print(obj.Front())
        print(obj.deQueue())
        print(obj.Front())
    }
}
