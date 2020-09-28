//
//  PostSettingsView.swift
//  LabShare-Front
//
//  Created by Alexander Frazis on 28/9/20.
//  Copyright © 2020 CITS3200. All rights reserved.
//

import SwiftUI

struct PostSettingsView: View {
    @ObservedObject var postVM: PostViewModel
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userAuthVM: UserAuthenticationViewModel
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack {
            List {
                NavigationLink(destination: PostEditView(userId: self.postVM.post.author.id, postId: self.postVM.post.id)) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Edit Post")
                    }
                }.buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    self.showingDeleteAlert = true
                }) {
                    HStack {
                        Image(systemName: "trash")
                            .imageScale(.large)
                        Text("Delete Post")
                        
                    }
                    
                }.navigationBarTitle(Text("Settings"), displayMode: .inline)
                    .alert(isPresented: $showingDeleteAlert) {
                        Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                            self.postVM.deletePost(userAuthVM: self.userAuthVM)
                            self.presentationMode.wrappedValue.dismiss()
                            self.presentationMode.wrappedValue.dismiss()
                            }, secondaryButton: .cancel()
                        )
                }
                
            }
        }
    }
}

//                    .foregroundColor(.black)
//                        .sheet(isPresented: $isEdit) {
//                            PostEditView(postVM: PostViewModel(post: self.postVM.post), oldpostVM: self.postVM, isPresented: self.$isEdit)
//                    }
//                    Button(action: {
//                        self.showingAlert = true
//
//                    }){
//                        Image(systemName: "trash")
//                            .imageScale(.large)
//                        Text("Delete Post")
//
//                    }.foregroundColor(.black)
//                        .padding(.top, 10)
//                        .alert(isPresented:$showingAlert) {
//                            Alert(title: Text("Are you sure you want to delete this post?"), primaryButton: .destructive(Text("Delete")) {
//                                    // Actions
//                            }, secondaryButton: .cancel())
//                        }
//                }

//struct PostSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostSettingsView(userId: 37, postId: 27)
//    }
//}

