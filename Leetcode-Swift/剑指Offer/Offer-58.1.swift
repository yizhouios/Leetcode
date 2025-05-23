//
//  58.1.fan-zhuan-dan-ci-shun-xu-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/30.
//

import Foundation

/*
 剑指 Offer 58 - I. 翻转单词顺序 (简单)
 https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/
 */

class Solution_Offer_58_1 {
    func reverseWords(_ s: String) -> String {
        // 如果单词为空，直接返回
        if s.isEmpty {
            return ""
        }
        
        // 移除空格
        let s = Array(s)
        var ans = [Character]()
        var ansBegin = 0
        while ansBegin < s.count {
            if s[ansBegin] == " " {
                ansBegin += 1
                continue
            }
            while ansBegin < s.count {
                ans.append(s[ansBegin])
                if s[ansBegin] == " " {
                    break
                }
                ansBegin += 1
            }
        }
        if ans.last == " " {
            ans.removeLast()
        }

        let count = ans.count
        // 先翻转所有
        revereWithRange(&ans, 0, count - 1)

        // 依次寻找单词的区间并交换顺序
        var searchBeginIndex = 0
        while let (letterLeft, letterRight) = findRangeOfSingleWord(ans, searchBeginIndex) {
            revereWithRange(&ans, letterLeft, letterRight)
            searchBeginIndex = letterRight + 1
        }

        return String(ans)
    }
    
    func revereWithRange(_ original: inout [Character], _ rangeLeft: Int, _ rangeRight: Int) {
        var rangeLeft = rangeLeft
        var rangeRight = rangeRight
        while rangeLeft < rangeRight {
            original.swapAt(rangeLeft, rangeRight)
            rangeLeft += 1
            rangeRight -= 1
        }
    }

    func findRangeOfSingleWord(_ letters: [Character], _ searchBeginIndex: Int) -> (Int, Int)? {
        // 如果为字母数组空直接返回
        if letters.isEmpty {
            return nil
        }
        
        let count = letters.count
        // 如果开始的搜索不合法直接返回
        if searchBeginIndex < 0 || searchBeginIndex > (count - 1) {
            return nil
        }

        // 寻找begin
        var begin = searchBeginIndex
        while begin < count && letters[begin] == " " {
            begin += 1
        }
        // 如果begin不合法，直接返回
        if begin > (count - 1) {
            return nil
        }
        
        var end = begin
        while end < count - 1 && letters[end + 1] != " " {
            end += 1
        }
        return (begin, end)
    }
    
    func test() {
        let tests = [
            "",
            "s",
            "  s ",
            "the sky is blue",
            "  hello world!  ",
            "a good   example",
            "  a good   example     "
        ]
        
        for i in tests {
            print(reverseWords(i))
        }
    }
}


/*
 老代码：
 class Solution {
     func reverseWords(_ s: String) -> String {
         if s.count == 0 {
             return ""
         }
         
         // 移除空格
         var s = Array(s)
         var ans = [Character]()
         var ansBegin = 0
         while ansBegin < s.count {
             if s[ansBegin] == " " {
                 ansBegin += 1
                 continue
             }
             while ansBegin < s.count {
                 ans.append(s[ansBegin])
                 if s[ansBegin] == " " {
                     break
                 }
                 ansBegin += 1
             }
         }
         
         if ans.last == " " {
             ans.removeLast()
         }
         
         s = ans
         
         func swapInRange(_ arr: inout [Character], _ begin: Int, _ end: Int) {
             var begin = begin
             var end = end
             while begin < end {
                 arr.swapAt(begin, end)
                 begin += 1
                 end -= 1
             }
         }
         
         var count = s.count
         var end = count - 1
         swapInRange(&s, 0, end)
         
         var begin = 0
         end = 0
         count = s.count
         
         while begin < count && end < count {
             if s[end] == " " {
                 swapInRange(&s, begin, end - 1)
                 while s[end] == " " {
                     end += 1
                 }
                 begin = end
             } else if end == count - 1 {
                 swapInRange(&s, begin, end)
                 break
             } else {
                 end += 1
             }
         }

         return String(s)
     }
 }
 */
