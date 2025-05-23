//
//  56.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/26.
//

import Foundation

/*
 56. 合并区间 (中等)
 https://leetcode-cn.com/problems/merge-intervals/
 */

class Solution_56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 参数校验
        if intervals.isEmpty {
            return []
        }

        // 根据区间的最左侧进行排序
        var sortedIntervals = intervals
        quickSort(&sortedIntervals, 0, sortedIntervals.count - 1)

        var ans = [[Int]]()
        ans.append(sortedIntervals[0])

        // 依次遍历，进行区间合并（如果当前区间的最左侧和上一个重叠就进行合并）
        var lastIndex = 0
        for i in 1..<sortedIntervals.count {
            let cur = sortedIntervals[i]
            if cur[0] <= ans[lastIndex][1] {
                ans[lastIndex][1] = max(cur[1], ans[lastIndex][1])
            } else {
                ans.append(cur)
                lastIndex += 1
            }
        }

        return ans
    }

    // 快速排序
    func quickSort(_ intervals: inout [[Int]], _ l: Int, _ r: Int) {
        if l >= r {
            return
        }

        let p = partition(&intervals, l, r)
        quickSort(&intervals, l, p - 1)
        quickSort(&intervals, p + 1, r)
    }

    func partition(_ intervals: inout [[Int]], _ l: Int, _ r: Int) -> Int {
        // 双指针
        var i = l
        var j = r - 1
        let referenceVal = intervals[r][0]
        while i < j {
            while i < j && intervals[i][0] < referenceVal {
                i += 1
            }
            while i < j && intervals[j][0] >= referenceVal {
                j -= 1
            }
            if i < j {
                swap(&intervals, i, j)
                i += 1
                j -= 1
            }
        }

        // 如果i == j，那么需要判断是要调换i还是i+1
        // 如果i > j，直接调换i
        if i == j {
            if intervals[i][0] <= referenceVal {
                i += 1
            }
        }
        swap(&intervals, i, r)
        return i
    }

    func swap(_ intervals: inout [[Int]], _ p: Int, _ q: Int) {
        let tmp = intervals[p]
        intervals[p] = intervals[q]
        intervals[q] = tmp
    }
}
