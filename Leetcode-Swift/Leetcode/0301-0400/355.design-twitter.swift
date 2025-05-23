//
//  355.design-twitter.swift
//  Leetcode-Swift
//
//  Created by yizhou on 2021/6/30.
//

import Foundation

/*
 355. 设计推特（中等）
 https://leetcode-cn.com/problems/design-twitter/
 */

class Solution_355 {
    class Twitter {

        var followees: [Int: [Int]] = [:]
        var allTweets: [Int] = []
        var tweetMapUser: [Int: Int] = [:]
        
        /** Initialize your data structure here. */
        init() {

        }
        
        /** Compose a new tweet. */
        func postTweet(_ userId: Int, _ tweetId: Int) {
            allTweets.append(tweetId)
            tweetMapUser[tweetId] = userId
        }
        
        /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
        func getNewsFeed(_ userId: Int) -> [Int] {
            var validUserIds = [userId]
            if let followers = followees[userId] {
                validUserIds.append(contentsOf: followers)
            }
            var ans = [Int]()
            for i in allTweets.reversed() {
                if validUserIds.contains(tweetMapUser[i]!) {
                    ans.append(i)
                }
                if ans.count >= 10 {
                    break
                }
            }
            return ans
        }
        
        /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
        func follow(_ followerId: Int, _ followeeId: Int) {
            if followees[followerId] == nil {
                followees[followerId] = []
            }
            followees[followerId]?.append(followeeId)
        }
        
        /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
        func unfollow(_ followerId: Int, _ followeeId: Int) {
            if let index = followees[followerId]?.firstIndex(of: followeeId) {
                followees[followerId]?.remove(at: index)
            }
        }
    }
    
    /*
     测试用例：
     1. 没有关注的人获取推文；关注1个获取推文；关注多个获取推文
     */
    func test() {
        let obj = Twitter()
        obj.postTweet(1, 5)
        print(obj.getNewsFeed(1))
        obj.follow(1, 2)
        obj.postTweet(2, 6)
        print(obj.getNewsFeed(1))
        obj.unfollow(1, 2)
        print(obj.getNewsFeed(1))
        obj.postTweet(2, 7)
        obj.postTweet(2, 8)
        obj.follow(1, 2)
        print(obj.getNewsFeed(1))
        /**
         * Your Twitter object will be instantiated and called as such:
         * let obj = Twitter()
         * obj.postTweet(userId, tweetId)
         * let ret_2: [Int] = obj.getNewsFeed(userId)
         * obj.follow(followerId, followeeId)
         * obj.unfollow(followerId, followeeId)
         */
    }
}
