//
//  19.zheng-ze-biao-da-shi-pi-pei-lcof.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/5/2.
//

import Foundation

/*
 剑指 Offer 19. 正则表达式匹配 (困难)
 https://leetcode-cn.com/problems/zheng-ze-biao-da-shi-pi-pei-lcof/
 */

class Solution_Offer_19 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        // 先将字符串转为数组
        let sArray = Array(s)
        let pArray = Array(p)
        func _matchCore(_ sChars: [Character], _ pChars: [Character]) -> Bool {
            print(sChars, pChars, sChars.count, pChars.count)
            if sChars.count == 0 && pChars.count == 0 {
                return true
            }
            if sChars.count > 0 && pChars.count == 0 {
                return false
            }
        
            if pChars.count >= 2 && pChars[1] == "*" {
                if (sChars[0] == pChars[0] || (sChars.count != 0 && pChars[0] == ".")) {
                    // move on the next state
//                    let match1 = _matchCore(Array(sChars[1...]), Array(pChars[2...]))
//                    if match1 {
//                        return true
//                    }
//                    // stay on the current state
//                    let match2 = _matchCore(Array(sChars[1...]), pChars)
//                    if match2 {
//                        return true
//                    }
//                    /// ignore a '*'
//                    let match3 = _matchCore(sChars, Array(pChars[2...]))
//                    if match3 {
//                        return true
//                    }
                    return _matchCore(Array(sChars[1...]), Array(pChars[2...])) || _matchCore(Array(sChars[1...]), pChars) || _matchCore(sChars, Array(pChars[2...]))
                } else {
                    // ignore a '*'
                    return _matchCore(sChars, Array(pChars[2...]))
                }
            }
            if (sChars[0] == pChars[0] || (sChars.count != 0 && pChars[0] == ".")) {
                return _matchCore(Array(sChars[1...]), Array(pChars[1...]))
            }
            return false
        }
        
        return _matchCore(sArray, pArray)
    }
    
    /// 下列会无限循环
//    func isMatch(_ s: String, _ p: String) -> Bool {
//            // 先将字符串转为数组
//            let sArray = Array(s)
//            let pArray = Array(p)
//            func _matchCore(_ sChars: [Character], _ pChars: [Character]) -> Bool {
//                print(sChars, pChars, sChars.count == 0 && pChars.count == 0)
//                if sChars.count == 0 && pChars.count == 0 {
//                    return true
//                }
//                if sChars.count > 0 && pChars.count == 0 {
//                    return false
//                }
//
//                if pChars.count >= 2 && pChars[1] == "*" {
//                    if (sChars.count > 0 && (sChars[0] == pChars[0] || pChars[0] == ".")) {
//                        // move on the next state
//                        let match1 = _matchCore(Array(sChars[1...]), Array(pChars[2...]))
//                        if match1 {
//                            return true
//                        }
//                        // stay on the current state
//                        let match2 = _matchCore(Array(sChars[1...]), pChars)
//                        if match2 {
//                            return true
//                        }
//                        /// ignore a '*'
//                        let match3 = _matchCore(sChars, Array(pChars[2...]))
//                        if match3 {
//                            return true
//                        }
//                        return false
//                    } else {
//                        // ignore a '*'
//                        return _matchCore(sChars, Array(pChars[2...]))
//                    }
//                }
//                if  (sChars.count > 0 && (sChars[0] == pChars[0] || pChars[0] == ".")) {
//                    return _matchCore(Array(sChars[1...]), Array(pChars[1...]))
//                }
//                return false
//            }
//
//            return _matchCore(sArray, pArray)
//        }
    
    /*
     测试用例：
     1. 功能测试：模式字符串里包含普通字符、"."、"*"；模式字符串和输入字符串匹配/不匹配
     2. 特殊输入测试：输入字符串和模式字符串是nil、空字符串
     */
    func test() {
//        print(isMatch("abc", "a.c")) // true
//        print(isMatch("abc", "ab*c")) // true
//        print(isMatch("abbbbbcc", "a.*c")) // true
//
//        print(isMatch("abc", "a.cd")) // false
//        print(isMatch("abc", "ab*cd")) // false
//        print(isMatch("abbbbbcc", "a.*cd")) // false
//
//        print(isMatch("", ""))
//        print(isMatch("", "abc"))
//        print(isMatch("abc", ""))
//
//        print(isMatch("", "."))
        
//        print(isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*a*a*b"))
        print(isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*c"))
        
        // 未过用例
        // 1. s = ""  p = "."
        // 2. 超时 "aaaaaaaaaaaaab"   "a*a*a*a*a*a*a*a*a*a*a*a*b"
        // 3. 超时 "aaaaaaaaaaaaab"   "a*a*a*a*a*a*a*a*a*a*c"
    }
}
