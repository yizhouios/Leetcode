//
//  547.number-of-provinces.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/22.
//

import Foundation

/*
 547. 省份数量 (中等)
 https://leetcode-cn.com/problems/number-of-provinces/
 */

class Solution547 {
    /// 深度优先搜索
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        if isConnected.isEmpty || isConnected[0].isEmpty {
            return 0
        }
        
        let provinces = isConnected.count
        var visited: [Bool] = [Bool](repeating: false, count: provinces)
        
        func dfs(_ provinceIndex: Int) {
            if visited[provinceIndex] {
                return
            }
            
            visited[provinceIndex] = true
            for j in 0..<provinces {
                if isConnected[provinceIndex][j] == 1 && !visited[j] {
                    dfs(j)
                }
            }
        }
        
        var ans = 0
        for i in 0..<provinces {
            if !visited[i] {
                ans += 1
                dfs(i)
            }
        }
        
        return ans
    }
    
    /// 广度优先搜索
    func findCircleNum_bfs(_ isConnected: [[Int]]) -> Int {
        if isConnected.isEmpty || isConnected[0].isEmpty {
            return 0
        }
        
        let provinces = isConnected.count
        var visited: [Bool] = [Bool](repeating: false, count: provinces)
        
        func bfs(_ provinceIndex: Int) {
            var queue = [provinceIndex]
            while !queue.isEmpty {
                let head = queue.removeFirst()
                visited[head] = true
                for j in 0..<provinces {
                    if isConnected[head][j] == 1 && !visited[j] {
                        queue.append(j)
                    }
                }
            }
        }
        
        var ans = 0
        for i in 0..<provinces {
            if !visited[i] {
                ans += 1
                bfs(i)
            }
        }
        
        return ans
    }
    
    func test() {
        print(findCircleNum([
            [1,1,0],
            [1,1,0],
            [0,0,1]
        ]))
        print(findCircleNum([
            [1,0,0],
            [0,1,0],
            [0,0,1]
        ]))
        
        // 未过用例
        /*
         [[1,0,0,1],
          [0,1,1,0],
          [0,1,1,1],
          [1,0,1,1]]
         */
        print(findCircleNum([[1,0,0,1],
                              [0,1,1,0],
                              [0,1,1,1],
                              [1,0,1,1]]))
    }
}
