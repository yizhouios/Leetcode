//
//  59.2.dui-lie-de-zui-da-zhi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/31.
//

import Foundation

/*
 剑指 Offer 59 - II. 队列的最大值 (中等)
 https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof/
 */

class Solution_Offer_59_2 {
    class MaxQueue {
        var data = [(index: Int, value: Int)]()
        var maximums = [(index: Int, value: Int)]()
        var curIndex = 0
        
        init() {

        }
        
        func max_value() -> Int {
            if maximums.count == 0 {
                return -1
            }
            return maximums.first!.value
        }
        
        func push_back(_ value: Int) {
            while maximums.count > 0 && maximums.last!.value <= value {
                maximums.removeLast()
            }
            data.append((curIndex, value))
            maximums.append((curIndex, value))
            
            curIndex += 1
        }
        
        func pop_front() -> Int {
            if data.count == 0 {
                return -1
            }
            
            if data.first!.index == maximums.first!.index {
                maximums.removeFirst()
            }
            return data.removeFirst().value
        }
    }
    
    func test() {
        /**
         * Your MaxQueue object will be instantiated and called as such:
         * let obj = MaxQueue()
         * let ret_1: Int = obj.max_value()
         * obj.push_back(value)
         * let ret_3: Int = obj.pop_front()
         */
        
        /*
         // leetcode出错用例
         ["MaxQueue","pop_front","pop_front","pop_front","pop_front","pop_front","push_back","max_value","push_back","max_value"]
         [[],[],[],[],[],[],[15],[],[9],[]]
         
         ["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
         [[],[1],[2],[],[],[]]
         */
    }
}
