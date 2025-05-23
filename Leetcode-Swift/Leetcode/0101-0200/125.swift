//
//  125.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/12/1.
//

import Foundation

/*
 125. 验证回文串 (简单)
 https://leetcode-cn.com/problems/valid-palindrome/
 */

class Solution_125 {
    func isPalindrome(_ s: String) -> Bool {
        // 如果是空字符串，返回true
        if s.isEmpty {
            return true
        }
        
        // 先将字符串都转换为小写
        let array =  Array(s.lowercased())
        var left = 0
        var right = array.count - 1
        while left < right {
            // 排除左侧不是字母和数字
            while left < right {
                if isLetterValid(array[left]) {
                    break
                }
                left += 1
            }
            
            // 排除右侧不是字母和数字
            while right > left {
                if isLetterValid(array[right]) {
                    break
                }
                right -= 1
            }
            
            if array[left] != array[right] {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    func isLetterValid(_ letter: Character) -> Bool {
        let unicodeValue = letter.unicodeScalars.first!.value
        // 合理的Unicode值应为：48(0)-57(9) 97(a)-122(z)
        if (unicodeValue >= 48  && unicodeValue <= 57) || (unicodeValue >= 97  && unicodeValue <= 122) {
            return true
        }
        return false
    }
    
    func test() {
//        print(isPalindrome("A man, a plan, a canal: Panama"))
//        print(isPalindrome("race a car"))
        print(isPalindrome("Nella's simple hymn: \"I attain my help, Miss Allen.\""))
    }
}
