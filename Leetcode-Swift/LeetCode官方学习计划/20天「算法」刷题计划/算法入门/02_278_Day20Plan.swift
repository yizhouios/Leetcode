//
//  278_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/9.
//

import Foundation

/*
 278. 第一个错误的版本 (简单)
 https://leetcode-cn.com/problems/first-bad-version/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/first-bad-version/solution/di-yi-ge-cuo-wu-de-ban-ben-by-leetcode-s-pf8h/
 */

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */
class VersionControl {
    
}

class Solution_278_Day20Plan : VersionControl {
    
    // 优化后
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1;
        var r = n;

        while l < r {
            let m = (l + r) / 2
            if isBadVersion(m) {
                r = m; // 此处, r赋值为m是因为，m或m-1都可能是第一个错误的版本，因此下一个搜索区间应该是 [l,m]
            } else {
                l = m + 1;
            }
        }

        // 来到这里说明 l == r，即l/r均为第一个错误的版本的索引
        return l;
    }
    
    // 初版
    func firstBadVersion_self(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left <= n {
            let mid = left + (right - left) >> 1
            if isBadVersion(mid) {
                if !isBadVersion(mid - 1) {
                    return mid
                } else {
                    right = mid - 1
                }
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
    
    var badVersion = 4
    func isBadVersion(_ version: Int) -> Bool {
        return badVersion == version
    }
    
    func test() {
        badVersion = 4
        print(firstBadVersion(5))
        badVersion = 1
        print(firstBadVersion(1))
    }
}
