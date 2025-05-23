//
//  08.10.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2022/5/9.
//

import Foundation

/*
 面试题 08.10. 颜色填充 (简单)
 https://leetcode.cn/problems/color-fill-lcci/
 */

class Solution_08_10 {
    // MARK: - DFS
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if image.isEmpty {
            return []
        }

        if image[sr][sc] == newColor {
            return image
        }

        var image = image
        dfs(&image, sr, sc, image[sr][sc], newColor)

        return image
    }

    func dfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ initialColor: Int, _ newColor: Int) {
        image[sr][sc] = newColor

        let directions = [(0,-1), (0,1), (-1,0), (1,0)]
        for i in directions {
            let newSr = sr + i.0
            let newSc = sc + i.1
            if (newSr < 0) || (newSr >= image.count) || (newSc < 0) || (newSc >= image[0].count) || (image[newSr][newSc] != initialColor) {
                continue
            }
            dfs(&image, newSr, newSc, initialColor, newColor)
        }
    }
}
