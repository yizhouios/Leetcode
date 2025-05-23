//
//  1472.design-browser-history.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/7/10.
//

import Foundation

/*
 1472. 设计浏览器历史记录 (中等)
 https://leetcode-cn.com/problems/design-browser-history/
 */

class Solution_1472 {
    class BrowserHistory {
        class Node {
            var val: String
            var next: Node?
            var pre: Node?
            init(_ val: String) {
                self.val = val
            }
        }
        
        var head: Node?
        var cur: Node?
        
        init(_ homepage: String) {
            head = Node(homepage)
            cur = head
        }
        
        func visit(_ url: String) {
            cur?.next = nil
            cur?.next?.pre = nil
            
            cur?.next = Node(url)
            
            cur?.next?.pre = cur
            cur = cur?.next
        }
        
        func back(_ steps: Int) -> String {
            if cur == nil {
                return ""
            }
            
            var steps = steps
            while cur?.pre != nil && steps > 0 {
                cur = cur?.pre
                
                steps -= 1
            }
            return cur!.val
        }
        
        func forward(_ steps: Int) -> String {
            if cur == nil {
                return ""
            }
            
            var steps = steps
            while cur?.next != nil && steps > 0 {
                cur = cur?.next
                
                steps -= 1
            }
            return cur!.val
        }
    }
    
    /**
     * Your BrowserHistory object will be instantiated and called as such:
     * let obj = BrowserHistory(homepage)
     * obj.visit(url)
     * let ret_2: String = obj.back(steps)
     * let ret_3: String = obj.forward(steps)
     */
    
    func test() {
        let obj = BrowserHistory("leetcode.com")
        obj.visit("google.com");       // 你原本在浏览 "leetcode.com" 。访问 "google.com"
        obj.visit("facebook.com");     // 你原本在浏览 "google.com" 。访问 "facebook.com"
        obj.visit("youtube.com");      // 你原本在浏览 "facebook.com" 。访问 "youtube.com"
        print(obj.back(1))                   // 你原本在浏览 "youtube.com" ，后退到 "facebook.com" 并返回 "facebook.com"
        print(obj.back(1))                   // 你原本在浏览 "facebook.com" ，后退到 "google.com" 并返回 "google.com"
        print(obj.forward(1))                // 你原本在浏览 "google.com" ，前进到 "facebook.com" 并返回 "facebook.comobj.visit("linkedin.com");     // 你原本在浏览 "facebook.com" 。 访问 "linkedin.com"
        print(obj.forward(2))                // 你原本在浏览 "linkedin.com" ，你无法前进任何步数。
        print(obj.back(2))                   // 你原本在浏览 "linkedin.com" ，后退两步依次先到 "facebook.com" ，然后到 "google.com" ，并返回 "google.com"
        print(obj.back(7))                   // 你原本在浏览 "google.com"， 你只能后退一步到 "leetcode.com" ，并返回 "leetcode.com"
    }
}
