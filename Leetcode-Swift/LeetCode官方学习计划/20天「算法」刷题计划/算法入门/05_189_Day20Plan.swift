//
//  189_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/10.
//

import Foundation

/*
 189. 旋转数组 (中等)
 https://leetcode-cn.com/problems/rotate-array/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/rotate-array/solution/xuan-zhuan-shu-zu-by-leetcode-solution-nipk/
 
 方法：
 法一：使用额外数组（将元素重新放到新数组的 (i + k) % 数组长度）
 法二：环状替换（参考官方题解；https://leetcode-cn.com/problems/rotate-array/solution/xuan-zhuan-shu-zu-by-leetcode-solution-nipk/）
 法三：三次翻转数组
    1. 翻转 0 - n-1
    2. 翻转 0 - ((k % n)-1)
    3. 翻转 k - n-1
 */

class Solution_189_Day20Plan {
    /// 法三：三次翻转数组
    func rotate_3(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        let k = k % len
        
        if len > 0 && k > 0 {
            func reverse(_ start: Int, _ end: Int) {
                var start = start, end = end
                while start < end {
                    nums.swapAt(start, end)
                    start += 1
                    end -= 1
                }
            }
            
            reverse(0, len - 1)
            reverse(0, k - 1)
            reverse(k, len - 1)
        }
    }
    
    /// 方法二：环状替换（参考官方题解；https://leetcode-cn.com/problems/rotate-array/solution/xuan-zhuan-shu-zu-by-leetcode-solution-nipk/）
    func rotate(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        let k = k % len
        
        /// 返回最大公约数（greatest common divisor(gcd)
        func gcd(_ x: Int, _ y: Int) -> Int {
            return y > 0 ? gcd(y, x % y) : x
        }
        
        let count = gcd(len, k)
        for start in 0..<count {
            var curIndex = start
            var prev = nums[start]
            repeat {
                let nextIndex = (curIndex + k) % len
                let temp = nums[nextIndex]
                nums[nextIndex] = prev
                
                prev = temp
                curIndex = nextIndex
            } while curIndex != start
        }
    }
    
    /// 方法一：使用额外数组（将元素重新放到新数组的 (i + k) % 数组长度）
    func rotate_1(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        if len > 0 && k > 0 {
            var ans = nums
            for i in 0..<len {
                ans[(i + k) % len] = nums[i]
            }
            nums = ans
        }
    }
    
    func test() {
        var nums = [1,2,3,4,5,6,7]
        
        rotate(&nums, 1)
        print(nums)
    }
}
