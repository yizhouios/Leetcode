//
//  20_797_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/29.
//

import Foundation

/*
 797. 所有可能的路径 (中等)
 https://leetcode-cn.com/problems/all-paths-from-source-to-target/
 */

class Solution_20_797_Day20Plan {
    /// 深度优先搜索
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        if graph.isEmpty {
            return []
        }
        
        let end = graph.count - 1
        var ans = [[Int]]()
        var stack = [Int]()
        func dfs(_ point: Int) {
            if point == end {
                ans.append(stack + [end])
                return
            }
            for i in graph[point] {
                stack.append(point)
                dfs(i)
                stack.removeLast()
            }
        }
        
        dfs(0)
        return ans
    }
    
    func test() {
        print(allPathsSourceTarget([[1,2],[3],[3],[]]))
        print(allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]]))
        print(allPathsSourceTarget([[1],[]]))
        print(allPathsSourceTarget([[1,2,3],[2],[3],[]]))
        print(allPathsSourceTarget([[],[2],[3],[]]))
        print(allPathsSourceTarget([[1,2,3],[3],[3],[]]))
    }
}
