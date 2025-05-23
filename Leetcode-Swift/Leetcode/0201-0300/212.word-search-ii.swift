//
//  212.word-search-ii.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/4/18.
//

import Foundation

/*
 212. 单词搜索 II (困难)
 https://leetcode-cn.com/problems/word-search-ii/
 */

class Solution212 {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String? = nil
        init() {}
    }
    
    func buildTrie( _ words: [String]) -> TrieNode {
        let root = TrieNode()
        for str in words {
            var node = root
            for c in str {
                if node.children[c] == nil {
                    node.children[c] = TrieNode()
                }
                node = node.children[c]!
            }
            node.word = str
        }
        return root
    }
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = buildTrie(words)
        var res = [String]()
        var board = board
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                backtrack(&board, i, j, root, &res)
            }
        }
        return res
    }
    func backtrack(_ board: inout [[Character]], _ i: Int, _ j: Int, _ parentNode: TrieNode, _ res: inout [String]) {
        guard i >= 0, i < board.count, j >= 0, j < board[0].count else { return }
        let char = board[i][j]
        guard let childNode = parentNode.children[char] else {
            return
        }
        if let str = childNode.word {
            res.append(str)
            childNode.word = nil
        }
        if childNode.children.isEmpty {
            parentNode.children[char] = nil
            return
        }
        board[i][j] = "*"
        backtrack(&board, i + 1, j, childNode, &res)
        backtrack(&board, i - 1, j, childNode, &res)
        backtrack(&board, i, j + 1, childNode, &res)
        backtrack(&board, i, j - 1, childNode, &res)
        board[i][j] = char
//        if childNode.children.isEmpty {
//            parentNode.children[char] = nil
//        }
    }
    
    func findWords_old(_ board: [[Character]], _ words: [String]) -> [String] {
        if words.count <= 0 {
            return []
        }
        if board.count <= 0 || board[0].count <= 0 {
            return []
        }
        
        // 校验board是否是矩形
        let rows = board.count
        let cols = board[0].count
//        for i in board {
//            if i.count != cols {
//                return []
//            }
//        }
        
        // 构造Trie树
        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        
        var visted = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        var ans = Set<String>()
        
        let dx = [0, 0, -1 ,1]
        let dy = [1, -1, 0, 0]
        func dfs(_ row: Int, _ col: Int, pathString: String, nexts: [Character: Trie]) {
            let newPathString = pathString + String(board[row][col])
            let newNexts = nexts[board[row][col]]!
            
            if newNexts.isEndOfWord {
                ans.insert(newPathString)
            }
            
            visted[row][col] = true
            for i in 0...3 {
                let newRow = row + dx[i]
                let newCol = col + dy[i]
                
                let isValidRow = newRow >= 0 && newRow < rows
                let isValidCol = newCol >= 0 && newCol < cols
                if isValidRow && isValidCol && !visted[newRow][newCol] && newNexts.nexts[board[newRow][newCol]] != nil {
                    dfs(newRow, newCol, pathString: newPathString, nexts: newNexts.nexts)
                }
            }
            visted[row][col] = false
        }
        for row in 0..<rows {
            for col in 0..<cols {
                if trie.nexts[board[row][col]] != nil {
                    dfs(row, col, pathString: "", nexts: trie.nexts)
                }
            }
        }
        return Array(ans)
    }
    
    /*
     测试用例：
     1.
     */
    func test() {
//        print(findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain"]))
        
        // 未过用例
        print(findWords([["o","a","b","n"],["o","t","a","e"],["a","h","k","r"],["a","f","l","v"]], ["oa","oaa"]))
    }
}
