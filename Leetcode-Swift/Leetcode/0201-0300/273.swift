//
//  273.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/8/4.
//

import Foundation

/*
 273. 整数转换英文表示 (困难)
 https://leetcode-cn.com/problems/integer-to-english-words/
 */

class Solution_273 {
    // 1 <= num <= 2,147,483,647
    func numberToWords(_ num: Int) -> String {
        if num < 0 || num > 0x7FFFFFFF {
            return ""
        }
        
        let digitMap = [
            // 单个数
            0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
            5: "Five",  6: "Six", 7: "Seven", 8: "Eight", 9: "Nine",
            // 小于20
            10: "Ten", 11: "Eleven", 12: "Twelve", 13: "Thirteen", 14: "Fourteen",
            15: "Fifteen", 16: "Sixteen", 17: "Seventeen", 18: "Eighteen", 19: "Nineteen",
            // 整十
            20: "Twenty", 30: "Thirty", 40: "Forty", 50: "Fifty",
            60: "Sixty", 70: "Seventy", 80: "Eighty", 90: "Ninety",
        ]
        
        func convertNumToStringByLessThanOneHundred(_ nums: [Int]) -> String {
            if nums.isEmpty {
                return ""
            }
            
            let len = nums.count
            if len == 1 {
                return digitMap[nums[0]]!
            }
            if len == 2 {
                if nums[0] == 0 && nums[1] == 0 {
                    return ""
                }
                
                if nums[1] == 0 {
                    return digitMap[nums[0]]!
                }
                
                let num = nums[1] * 10 + nums[0]
                if let val = digitMap[num] {
                    return val
                }
                
                return "\(digitMap[nums[1] * 10]!) \(digitMap[nums[0]]!)"
            }
            if len == 3 {
                var other = convertNumToStringByLessThanOneHundred([nums[0], nums[1]])
                if nums[2] == 0 {
                    return other
                }
                if !other.isEmpty {
                    other = " \(other)"
                }
                
                return "\(digitMap[nums[2]]!) Hundred" + other
            }
            
            return ""
        }
        
        func numberToWordsCore(_ num: Int, _ level: Int) -> String {
            if num < 0 {
                return ""
            }
            
            var num = num
            var nums = [Int]()
            for _ in 0..<3 {
                if num < 10 {
                    nums.append(num)
                    num = -1
                    break
                }
                
                let newNum = num / 10
                let lastNum = num - newNum * 10
                nums.append(lastNum)
                
                num = newNum
                
                if num <= 0 {
                    break
                }
            }
            var numStr = convertNumToStringByLessThanOneHundred(nums)
            if !numStr.isEmpty {
                if level == 1 {
                    numStr += " Thousand"
                } else if (level == 2) {
                    numStr += " Million"
                } else if (level == 3) {
                    numStr += " Billion"
                }
            }
            
            var remainStr = numberToWordsCore(num, level + 1)
            if !remainStr.isEmpty && !numStr.isEmpty {
                remainStr += " "
            }
            
            return remainStr + numStr
        }
        
        return numberToWordsCore(num, 0)
    }
    
    /*
     测试用例：
     1. 功能：个、十、百、Thousand、Million、Billion
     2. 特殊：0、100、1000、2,147,483,647
     */
    func test() {
        print(numberToWords(8))
        print(numberToWords(11))
        print(numberToWords(100))
        print(numberToWords(101))
        print("'\(numberToWords(1000))'")
        print("'\(numberToWords(1001))'")
        print(numberToWords(10000))
        print(numberToWords(123))
        print(numberToWords(1234567891))
    }
}
