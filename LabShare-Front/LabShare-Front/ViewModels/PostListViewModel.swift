//
//  PostListViewModel.swift
//  LabShare-Front
//
//  Created by Alexander Frazis on 5/9/20.
//  Copyright © 2020 CITS3200. All rights reserved.
//



import Foundation
import SwiftUI
import Combine

class PostListViewModel: ObservableObject {
    @Published var newPostTitle: String = ""
    @Published var newPostContent: String = ""
    @Published var posts = [PostViewModel]() //whenever you change the posts, it will publish an event
    
    init() {
        PostWebservice().getAllPosts { posts in
            if let posts = posts {
                self.posts = posts.map( PostViewModel.init )
            }
        }
    }
    
    
    func createPost() {
        let newPostTitle = self.newPostTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let newPostContent = self.newPostContent.trimmingCharacters(in: .whitespacesAndNewlines)
        if newPostContent.isEmpty || newPostTitle.isEmpty {
            return
        }
        let newPost = PostEncodable(title: newPostTitle, content:newPostContent, author: 1)
        PostWebservice().createPost(post: newPost) { posts in
        
            if let posts = posts {
                self.posts = posts.map( PostViewModel.init )
            }
        }
        self.newPostTitle = ""
        self.newPostContent = ""
        
    }
    
    func updatePost(indexSet: IndexSet) {
        let postToUpdate = self.posts[indexSet.first!]
        let newPostTitle = self.newPostTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let newPostContent = self.newPostContent.trimmingCharacters(in: .whitespacesAndNewlines)
        if newPostContent.isEmpty || newPostTitle.isEmpty {
            return
        }
        
        let newPost = PostEncodable(title: newPostTitle, content: newPostContent, author: postToUpdate.author)
        
        PostWebservice().updatePost(postId: postToUpdate.id, post: newPost) { posts in
            if let posts = posts {
                self.posts = posts.map( PostViewModel.init )
            }
        }
        self.newPostTitle = ""
        self.newPostContent = ""
        
    }
    
    func deletePost(indexSet: IndexSet) {
        let deleteItem = self.posts[indexSet.first!]
        let deleteId = deleteItem.id
        
        PostWebservice().deletePost(itemId : deleteId) { posts in
            if let posts = posts {
                self.posts = posts.map( PostViewModel.init )
            }
        }
    }
}

struct PostViewModel {
    var post: PostModel
    
    init(post: PostModel) {
        self.post = post
    }
    
    var id: Int { return self.post.id }
    var title: String { return self.post.title }
    var content: String { return self.post.content }
    var date_created: String { return self.post.date_created }
    var author: Int { return self.post.author }
    
    
}