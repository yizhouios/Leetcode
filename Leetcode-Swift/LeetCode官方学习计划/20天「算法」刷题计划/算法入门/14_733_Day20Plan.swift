//
//  733_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/15.
//

import Foundation

/*
 733. 图像渲染 (简单)
 https://leetcode-cn.com/problems/flood-fill/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/flood-fill/solution/tu-xiang-xuan-ran-by-leetcode-solution/
 */

class Solution_733_Day20Plan {
    /// 深度优先搜索
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let rows = image.count
        let cols = image[0].count
        
        var image = image
        let oldColor = image[sr][sc]
        
        func dfs(_ x: Int, _ y: Int, _ oldColor: Int, _ newColor: Int) {
            image[x][y] = newColor
            
            for (row, col) in [(x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)] {
                if row < 0 || row >= rows || col < 0 || col >= cols || image[row][col] != oldColor {
                    continue
                }
                dfs(row, col, oldColor, newColor)
            }
        }
        
        if oldColor != newColor {
            dfs(sr, sc, oldColor, newColor)
        }
        
        return image
    }
    
    /// 广度优先搜索
    func floodFill_1(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let rows = image.count
        let cols = image[0].count
        
        var image = image
        let pixelVal = image[sr][sc]
        
        if pixelVal == newColor {
            return image
        }
        
        var queue = [(sr, sc)]
        while !queue.isEmpty {
            let head = queue.removeFirst()
            let x = head.0
            let y = head.1
            
            image[x][y] = newColor
            
            if y - 1 >= 0 && image[x][y - 1] == pixelVal {
                queue.append((x, y - 1))
            }
            if y + 1 < cols && image[x][y + 1] == pixelVal {
                queue.append((x, y + 1))
            }
            if x - 1 >= 0 && image[x - 1][y] == pixelVal {
                queue.append((x - 1, y))
            }
            if x + 1 < rows && image[x + 1][y] == pixelVal {
                queue.append((x + 1, y))
            }
        }
        
        return image
    }
    
    func test() {
        print(floodFill([[1,1,1],
                         [1,1,0],
                         [1,0,1]], 1, 1, 2))
    }
}
