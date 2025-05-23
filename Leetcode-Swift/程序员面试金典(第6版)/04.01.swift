//
//  04.01.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/9.
//

import Foundation

/*
 面试题 04.01. 节点间通路 (中等)
 https://leetcode.cn/problems/route-between-nodes-lcci/
 */

class Solution_04_01 {
    var visited = [Int: Bool]()
    var found = false

    // MARK: - DFS
    func findWhetherExistsPath(_ n: Int, _ graph: [[Int]], _ start: Int, _ target: Int) -> Bool {
        if graph.isEmpty {
            return false
        }

        found = false

        var digraphs = [Int: [Int]]()
        for i in graph {
            let pointA = i[0]
            let pointB = i[1]
            if let array = digraphs[pointA], !array.contains(pointB) {
                digraphs[pointA]!.append(pointB)
            } else {
                digraphs[pointA] = [pointB]
                visited[pointA] = false
            }
        }

        dfs(digraphs, start, target)

        return found
    }

    func dfs(_ digraphs: [Int: [Int]], _ begin: Int, _ target: Int) {
        if found { return }
        if begin == target {
            found = true
            return
        }

        guard let points = digraphs[begin], let isVisited = visited[begin], !isVisited else {
            return
        }

        visited[begin]! = true

        for i in points {
            dfs(digraphs, i, target)
        }
    }
}
