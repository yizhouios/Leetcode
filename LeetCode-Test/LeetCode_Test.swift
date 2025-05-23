//
//  LeetCode_Test.swift
//  LeetCode-Test
//
//  Created by yizhou on 2025/5/23.
//

import Testing
import XCTest
import LeetCode_Library

struct LeetCode_Test {

    /*
     2. 两数相加
     https://leetcode-cn.com/problems/add-two-numbers/
     */
    @Test func test_Solution2() {
        /*
         测试案例：
         1. 位数相等（有进位、无进位）
         2. 位数不等（有进位、无进位）
         3. 都是0
         */
        
        let so = Solution_0002()
        
        var l1 = createListNode(values: [1,2])
        var l2 = createListNode(values: [9,9])
        XCTAssertEqual(so.addTwoNumbers(l1, l2)?.toArray(), [1,1,1])
        
        l1 = createListNode(values: [1,2])
        l2 = createListNode(values: [2,3])
        XCTAssertEqual(so.addTwoNumbers(l1, l2)?.toArray(), [3,5])
        
        l1 = createListNode(values: [1,2,3])
        l2 = createListNode(values: [2,3,9,9,8])
        XCTAssertEqual(so.addTwoNumbers(l1, l2)?.toArray(), [3,5,2,0,9])
        
        l1 = createListNode(values: [1,2,3])
        l2 = createListNode(values: [2,3,6,9,8])
        XCTAssertEqual(so.addTwoNumbers(l1, l2)?.toArray(), [3,5,9,9,8])
        
        l1 = createListNode(values: [0])
        l2 = createListNode(values: [0])
        XCTAssertEqual(so.addTwoNumbers(l1, l2)?.toArray(), [])
    }
    
    /*
     1.两数之和（简单）
     https://leetcode-cn.com/problems/two-sum
     */
    @Test func test_Solution1() {
        let so = Solution_0001()
        XCTAssertEqual(so.twoSum([1,2,3], 5), [1,2])
        XCTAssertEqual(so.twoSum([1,2], 3), [0,1])
        XCTAssertEqual(so.twoSum([1,2,3,1], 2), [0,4])
    }
}
