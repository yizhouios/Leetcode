//
//  208.implement-trie-prefix-tree.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/18.
//

import Foundation

/*
 208. 实现 Trie (前缀树) (中等)
 https://leetcode-cn.com/problems/implement-trie-prefix-tree/
 */

func TrieMakeBySelf() {
    class Trie {

        var items: [Trie?] = [Trie?](repeating: nil, count: 26)
        var isEndOfWord = false
        
        /** Initialize your data structure here. */
        init() {
            
        }
        
        /** Inserts a word into the trie. */
        func insert(_ word: String) {
            if word.count == 0 {
                return
            }
            var lastTrieNode = self
            for alphabet in word {
                let index = Int(alphabet.unicodeScalars.first!.value - 97)
                if lastTrieNode.items[index] != nil {
                    lastTrieNode = lastTrieNode.items[index]!
                } else {
                    let trie: Trie = Trie()
                    lastTrieNode.items[Int(index)] = trie
                    lastTrieNode = trie
                }
            }
            lastTrieNode.isEndOfWord = true
        }
        
        func searchPrefix(_ prefix: String) -> Trie? {
            if prefix.count == 0 {
                return nil
            }
            var lastTrieNode = self
            for alphabet in prefix {
                let index = Int(alphabet.unicodeScalars.first!.value) - 97
                guard let last = lastTrieNode.items[index] else {
                    return nil
                }
                lastTrieNode = last
            }
            return lastTrieNode
        }
        
        /** Returns if the word is in the trie. */
        func search(_ word: String) -> Bool {
            let searchedTrieNode = searchPrefix(word)
            return searchedTrieNode != nil && searchedTrieNode!.isEndOfWord
        }
        
        /** Returns if there is any word in the trie that starts with the given prefix. */
        func startsWith(_ prefix: String) -> Bool {
            return self.searchPrefix(prefix) != nil
        }
    }
}

class Solution208 {
    
    /*
     测试用例
     1. 多次添加含有重复前缀的词以及以重复前缀结尾的词
     */
    func test() {
//        let obj = Trie()
//        obj.insert("word")
//        obj.insert("worda")
//        obj.insert("wordb")
//        obj.insert("app")
//        obj.insert("apple")
//        obj.insert("add")
//        print(obj.search("worda"))
//        print(obj.startsWith("wod"))
//        print(obj.startsWith("app"))
        
        let obj1 = Trie();
        obj1.insert("apple");
        print(obj1.search("apple"));   // 返回 True
        print(obj1.search("app"));     // 返回 False
        print(obj1.startsWith("app")); // 返回 True
        print(obj1.insert("app"));
        print(obj1.search("app"));     // 返回 True
        
        /*
         ["Trie","insert","insert","insert","insert","insert","insert","search","search","search","search","search","search","search","search","search","startsWith","startsWith","startsWith","startsWith","startsWith","startsWith","startsWith","startsWith","startsWith"]
         [[],["app"],["apple"],["beer"],["add"],["jam"],["rental"],["apps"],["app"],["ad"],["applepie"],["rest"],["jan"],["rent"],["beer"],["jam"],["apps"],["app"],["ad"],["applepie"],["rest"],["jan"],["rent"],["beer"],["jam"]]
         */
    }
}



/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
