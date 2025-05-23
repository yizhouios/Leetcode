//
//  40.zui-xiao-de-kge-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/18.
//

import Foundation

/*
 剑指 Offer 40. 最小的k个数 (简单)
 https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/
 */

class Solution_Offer_40 {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.count == 0 || (arr.count) < k || k <= 0 {
            return []
        }
        
        func partition(_ arr: inout [Int], _ start: Int, _ end: Int) -> Int {
            if arr.count == 0 {
                return -1
            }
            
            var small = start - 1
            for i in start..<end {
                if arr[i] < arr[end] {
                    small += 1
                    if small != i {
                        arr.swapAt(i, small)
                    }
                }
            }
            
            small += 1
            arr.swapAt(small, end)
            return small
        }
        
        var arr = arr
        var start = 0
        var end = arr.count - 1
        var index = partition(&arr, start, end)
        while index != (k - 1) {
            if index < (k - 1) {
                start = index + 1
            } else {
                end = index - 1
            }
            index = partition(&arr, start, end)
        }
        
        return Array(arr[0..<k])
    }
    
    /*
     测试用例:
     1. 功能测试：输入的数组有/无相同的数字
     2. 边界值测试：k=1或等于数组的长度
     3. 特殊输入：k < 1; k > 数组长度; 数组为空
     */
    func test() {
        print(getLeastNumbers([1,1,2], 2))
        print(getLeastNumbers([1,3,2,5,6], 3))
        print(getLeastNumbers([6,4,2,8], 1))
        print(getLeastNumbers([6,4,2,8], 4))
        print(getLeastNumbers([1,2], 0))
        print(getLeastNumbers([1,2], 5))
        print(getLeastNumbers([], 1))
    }
}
