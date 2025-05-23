//
//  862.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/29.
//

import Foundation

/*
 862. 和至少为 K 的最短子数组 （困难）
 https://leetcode-cn.com/problems/shortest-subarray-with-sum-at-least-k/
 */

class Solution_862 {
    
    func shortestSubarray_2(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        let len = nums.count
        var nums = nums
        var sum = 0, begin = 0, ans = -1
        
        for i in 0..<len {
            let val = nums[i]
            if val >= k {
                return 1
            }
            
            sum += val
            
            if sum < 1 {
                sum = 0
                begin = i + 1
                continue
            }
            
            // 举例：将[5,-1,-1] 变成 [3,0,0]
            for j in stride(from: i - 1, to: -1, by: -1) {
                if nums[j + 1] >= 0 {
                    break
                }
                nums[j] = nums[j] + nums[j + 1]
                nums[j + 1] = 0
            }
            
            if sum >= k {
                while sum - nums[begin] >= k || nums[begin] == 0 {
                    sum -= nums[begin]
                    begin += 1
                }
                let length = i - begin + 1
                if ans < 0 || ans > length {
                    ans = length
                }
            }
        }
        
        return ans
    }
    
    // 超时
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        let count = nums.count
        var prefixSumx = [Int](repeating: 0, count: count + 1)
        for i in 0..<count {
            let value = nums[i]
            prefixSumx[i + 1] = prefixSumx[i] + value
        }
        
        // Want smallest y-x with Py - Px >= K
        var ans = count + 1
        var queue = [Int]()
        
        for index in 0...count {
            let py = prefixSumx[index]
            while !queue.isEmpty && py <= prefixSumx[queue[queue.count - 1]] {
                queue.removeLast()
            }
            while !queue.isEmpty && (py - prefixSumx[queue[0]] >= k) {
                let newAns = index - queue.removeFirst()
                ans = ans > newAns ? newAns : ans
            }
            queue.append(index)
        }
        
        return ans != count + 1 ? ans : -1
    }
    
    /*
     测试用例：
     1. 全正、全负、正负均有；存在和至少为k的子数组（个数为1、2、全部）
     2. 空数组
     */
    func test() {
        print(shortestSubarray([1], 1))
        print(shortestSubarray([1,2], 4))
        print(shortestSubarray([2,-1,2], 3))

        print(shortestSubarray([-1,-2,-3], 5))

        // leetcode
        print(shortestSubarray([84,-37,32,40,95], 167)) // 3
        print(shortestSubarray([-34,37,51,3,-12,-50,51,100,-47,99,34,14,-13,89,31,-14,-44,23,-38,6], 151)) // 2
    }
}

/*
 JavaScript
 
 /**
  * @param {number[]} nums
  * @param {number} k
  * @return {number}
  */

 var shortestSubarray = function(nums, k) {
   let queue = [];
   let len = nums.length;
   let sums = new Array(len+1).fill(0);
   let minLen = Infinity;
   for (let i = 0; i < len; i++) {
     sums[i+1] = sums[i] + nums[i];
   }
   for (let i = 0; i < len+1; i++) {
     let currentSum = sums[i];
     while (queue.length && sums[queue[queue.length-1]] >= currentSum) {
       queue.pop();
     }
     while (queue.length && currentSum - sums[queue[0]] >= k) {
       minLen = Math.min(minLen, i - queue[0]);
       queue.shift();
     }
     queue.push(i);
   }
   return minLen === Infinity ? -1 : minLen;
 };

 */
