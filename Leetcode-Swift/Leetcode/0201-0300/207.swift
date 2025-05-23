//
//  207.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/10/20.
//

import Foundation

/*
 207. 课程表 (中等)
 https://leetcode-cn.com/problems/course-schedule/
 */

class Solution_207 {
    // MARK: - 拓扑排序 (Kahn算法)
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjacents = [[Int]](repeating: [], count: numCourses)
        var indegrees = [Int](repeating: 0, count: numCourses)

        for i in prerequisites {
            adjacents[i[1]].append(i[0])
            indegrees[i[0]] += 1
        }

        var zeroIndegrees = [Int]()
        for i in 0..<numCourses {
            if indegrees[i] == 0 {
                zeroIndegrees.append(i)
            }
        }

        var zeroIndegreeCount = 0
        while !zeroIndegrees.isEmpty {
            zeroIndegreeCount += 1

            let point = zeroIndegrees.removeLast()
            for i in adjacents[point] {
                indegrees[i] -= 1
                if indegrees[i] == 0 {
                    zeroIndegrees.append(i)
                }
            }
        }

        return zeroIndegreeCount == numCourses
    }
}
