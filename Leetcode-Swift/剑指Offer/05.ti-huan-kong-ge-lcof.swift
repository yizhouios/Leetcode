//
//  05.ti-huan-kong-ge-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/25.
//

import Foundation

/*
 剑指 Offer 05. 替换空格 (简单)
 https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/
 */

class Solution_Offer_05 {
    func replaceSpace(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        var spaceCount = 0
        for i in s {
            if i == " " {
                spaceCount += 1
            }
        }
        var ans = [Character](repeating: " ", count: s.count + 2 * spaceCount)
        var index = 0
        for i in s {
            if i != " " {
                ans[index] = i
                index += 1
            } else {
                ans[index] = "%"
                ans[index + 1] = "2"
                ans[index + 2] = "0"
                index = index + 3
            }
        }
        return String(ans)
    }
    
    /*
     测试用例：
     1. 1个或多个空格在第一个；最后一个；在中间；字符串中有连续的空格
     2. 无空格
     3. 空串；全是空格
     */
    func test() {
        print(replaceSpace(" 123"))
        print(replaceSpace("  123"))
        print(replaceSpace("1 2  3"))
        print(replaceSpace("123  "))
        print(replaceSpace("1   3"))
        print(replaceSpace("123"))
        print(replaceSpace(""))
        print(replaceSpace("   "))
    }
}
