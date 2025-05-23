//
//  11.xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/27.
//

import Foundation

/*
 剑指 Offer 11. 旋转数组的最小数字 (简单)
 https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/
 */

/*
 思路：
 1. 一次遍历 O(n)
 2. 二分查找 O(logn)
 */
class Solution_Offer_11 {
    
    func minArray(_ numbers: [Int]) -> Int {
        if numbers.count == 0 {
            return -1
        }
        var low = 0
        var hight = numbers.count - 1
        while low < hight {
            let mid = low + (hight - low) / 2
            if numbers[mid] > numbers[hight] {
                low = mid + 1
            } else if (numbers[mid] < numbers[hight]) {
                hight = mid
            } else {
                hight -= 1
            }
        }
        return numbers[low]
    }
    
    func minArray_fuze(_ numbers: [Int]) -> Int {
        if numbers.count == 0 {
            return -1
        }
        if numbers.count == 1 {
            return numbers[0]
        }
        var left = 0
        var right = numbers.count - 1
        var mid = 0
        while numbers[left] >= numbers[right] {
            if right - left == 1 {
                mid = right
                break
            }
            mid = left + (right - left) / 2
            if numbers[left] == numbers[right] && numbers[mid] == numbers[left] {
                var last = numbers[0]
                for i in 1..<numbers.count {
                    if last > numbers[i] {
                        mid = i
                        break
                    }
                    last = numbers[i]
                }
                break
            }
            
            if numbers[mid] >= numbers[left] {
                left = mid
            } else {
                right = mid
            }
        }
        return numbers[mid]
    }
    
    /*
     测试用例：
     1. 功能测试：升序排序数组的一个旋转（数组中有重复或没有重复的数字）
     2. 边界值测试：只包含1个元素；两个元素升序或旋转
     3. 空元素；空指针
     */
    func test() {
        print(minArray([3,4,5,1,2]))
        print(minArray([3,4,5,5,1,2]))

        print(minArray([2,3]))
        print(minArray([3,2]))
        print(minArray([3]))

        print(minArray([]))
        
        // 未过用例
        // 1. [1,1,3,1]
        print(minArray([1,1,3,1]))
    }
}
