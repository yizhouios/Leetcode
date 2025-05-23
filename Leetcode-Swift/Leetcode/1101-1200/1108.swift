//
//  1108.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/1.
//

import Foundation

/*
 1108. IP 地址无效化 (简单)
 https://leetcode-cn.com/problems/defanging-an-ip-address/
 */

class Solution_1108 {
    func defangIPaddr(_ address: String) -> String {
        // 如果为空直接返回
        if address.isEmpty {
            return ""
        }
        
        let count = address.count
        // 无效化后的字符串长度
        let newCount = count + 2 * 3
        var chars = [Character](repeating: " ", count: newCount)
        var index = 0
        for i in Array(address) {
            if i == "." {
                chars[index] = "["
                chars[index + 1] = "."
                chars[index + 2] = "]"
                index += 3
            } else {
                chars[index] = i
                index += 1
            }
        }
        
        return String(chars)
    }
    
    func test() {
        /*
         测试用例：
         1. 1.11.111.0
         */
        print(defangIPaddr("1.11.111.0"))
    }
}
