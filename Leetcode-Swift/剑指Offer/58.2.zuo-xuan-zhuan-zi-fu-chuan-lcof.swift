//
//  58.2.zuo-xuan-zhuan-zi-fu-chuan-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/30.
//

import Foundation

/*
 剑指 Offer 58 - II. 左旋转字符串 (简单)
 https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/
 */

class Solution_Offer_58_2 {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        if s.count == 0 || n <= 0 || n > s.count {
            return ""
        }
        
        func swapInRange(_ arr: inout [Character], _ begin: Int, _ end: Int) {
            var begin = begin
            var end = end
            while begin < end {
                arr.swapAt(begin, end)
                begin += 1
                end -= 1
            }
        }
        
        var s = Array(s)
        let begin = 0
        let end = s.count - 1
        swapInRange(&s, begin, end)
        swapInRange(&s, begin, end - n)
        swapInRange(&s, end - n + 1 , end)
        
        return String(s)
    }
    
    /*
     测试用例：
     1. 功能：k为[1,字符串的长度]
     2. 特殊：空串；k小于1；大于字符串的长度
     */
    func test() {
        let tests = [
            ("abcdefg", 1),
            ("abcdefg", 2),
            ("abcdefg", 7),
            ("lrloseumgh", 0),
            ("lrloseumgh", 6),
            ("lrloseumgh", 20),
            ("", 6)
        ]
        
        for i in tests {
            print(reverseLeftWords(i.0, i.1))
        }
    }
}
