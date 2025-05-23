//
//  703.kth-largest-element-in-a-stream.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/6.
//

import Foundation
/*
 703. 数据流中的第 K 大元素 (简单)
 https://leetcode-cn.com/problems/kth-largest-element-in-a-stream/
 */

/*
 思路：使用优先队列，维护一个大小为K的小顶堆。

 推荐阅读：
 1. 【拜托，面试别再问我TopK了】https://mp.weixin.qq.com/s/FFsvWXiaZK96PtUg-mmtEw
 */
class KthLargest {

    private var limit: Int = 0
    private var queue = PriorityQueue<Int>()

    init(_ k: Int, _ nums: [Int]) {
        self.limit = k
        for num in nums {
            self.add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        self.queue.add(val)
        if self.queue.size > self.limit {
            self.queue.dequeue()
        }
        return self.queue.peek()!
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */

 protocol Queue {
    associatedtype DataType: Comparable
    
    /**
     * 将一个新元素插入到队列中
     * - param item: 要添加的元素
     * - return Bool: 插入是否成功
     */
    @discardableResult
    func add(_ item: DataType) -> Bool
    
    /**
     * 删除首个元素
     * - 返回值：被移除的元素
     */
    @discardableResult
    func remove() throws -> DataType
    
    /**
     * 获取队列首个元素，并将其移出队列
     */
    func dequeue() -> DataType?
    
    /**
     * 获取队列中的首个元素，但不将其移出队列
     */
    func peek() -> DataType?
    
    /**
     * 清空队列
     */
    func clear() -> Void
    
}

enum QueueError: Error {
    case noSuchItem(String)
}

private extension Int {
    var leftChild: Int {
        return 2 * self + 1
    }
    
    var rightChild: Int {
        return 2 * self + 2
    }
    
    var parent: Int {
        return (self - 1) / 2
    }
}

class PriorityQueue<DataType: Comparable> {
    // 队列的存储
    private var queue: Array<DataType>
    
    // 当前队列的大小
    public var size: Int {
        return self.queue.count
    }
    
    public init() {
        self.queue = Array<DataType>()
    }
    
    @discardableResult
      public func add(_ item: DataType) -> Bool {
        self.queue.append(item)
        self.heapifyUp(from: self.queue.count - 1)
        return true
      }

      @discardableResult
      public func remove() throws -> DataType {
        guard self.queue.count > 0 else {
          throw QueueError.noSuchItem("Attempt to remove item from an empty queue.")
        }
        return self.popAndHeapifyDown()
      }

      public func dequeue() -> DataType? {
        guard self.queue.count > 0 else {
          return nil
        }
        return self.popAndHeapifyDown()
      }

      public func peek() -> DataType? {
        return self.queue.first
      }

      public func clear() {
        self.queue.removeAll()
      }

      /**
      弹出队列中的第一个元素，并通过将根元素移向队尾的方式恢复最小堆排序。
      - 返回值: 队列中的第一个元素。
      */
      private func popAndHeapifyDown() -> DataType {
        let firstItem = self.queue[0]

        if self.queue.count == 1 {
          self.queue.remove(at: 0)
          return firstItem
        }

        self.queue[0] = self.queue.remove(at: self.queue.count - 1)

        self.heapifyDown()

        return firstItem
      }

      /**
       通过将元素移向队头的方式恢复最小堆排序。
       - 参数 index: 要移动的元素的索引值。
       */
      private func heapifyUp(from index: Int) {
        var child = index
        var parent = child.parent

        while parent >= 0 && self.queue[parent] > self.queue[child] {
          swap(parent, with: child)
          child = parent
          parent = child.parent
        }
      }

      /**
       通过将根元素移向队尾的方式恢复队列的最小堆排序。
       */
      private func heapifyDown() {
        var parent = 0

        while true {
          let leftChild = parent.leftChild
          if leftChild >= self.queue.count {
            break
          }

          let rightChild = parent.rightChild
          var minChild = leftChild
          if rightChild < self.queue.count && self.queue[minChild] > self.queue[rightChild] {
            minChild = rightChild
          }

          if self.queue[parent] > self.queue[minChild] {
            self.swap(parent, with: minChild)
            parent = minChild
          } else {
            break
          }
        }
      }
    
    private func swap(_ firstIndex: Int, with secondIndex: Int) {
        let firstItem = self.queue[firstIndex]
        self.queue[firstIndex] = self.queue[secondIndex]
        self.queue[secondIndex] = firstItem
    }
}

// MARK: - 测试用例
/*
 测试用例：
 1. 添加大于/小于/等于第K大的元素
 */
class Solution703{
    func test() {
        let kla = KthLargest(3, [1,2,3,9,8,5])
        print(kla.add(5))
        print(kla.add(4))
        print(kla.add(6))
    }
}

