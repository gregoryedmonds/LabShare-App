//
//  PostDetail.swift
//  LabShare-Front
//
//  Created by Alexander Frazis on 29/8/20.
//  Copyright © 2020 CITS3200. All rights reserved.
//

import SwiftUI

struct PostEditView: View {
    @ObservedObject var postVM: PostViewModel
    @EnvironmentObject var userAuthVM: UserAuthenticationViewModel
    @State var showingAlert: Bool = false
    
    init (userId: Int, postId: Int) {
        self.postVM = PostViewModel(userId: userId, postId: postId)
    }
    
    //    @ViewBuilder
    var body: some View {
        VStack (alignment:.leading) {
            PostHeaderView(postVM: self.postVM)
            VStack {
                HStack {
                    Text("Title:")
                        .font(.title)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                TextField("title", text: self.$postVM.post.title)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }
            VStack {
                HStack {
                    Text("Contents:")
                        .font(.title)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
//                MultilineTextView(postVM: self.postVM)
                MultilineTextView(text: self.$postVM.post.content)
            }
            
            
            HStack {
                Button(action: {
                    self.showingAlert = true
                }){
                    Text("Cancel")
                }.alert(isPresented:$showingAlert) {
                    Alert(title: Text("Are you sure you want to cancel"), message: Text("All edits will be lost"), primaryButton: .destructive(Text("Continue")) {
                    }, secondaryButton: .cancel())
                }
                
                Spacer()
                Button(action: {
                }){
                    Text("Save")
                }
            }
            
            Spacer()
        }.padding([.top, .leading, .trailing])
        .onAppear(perform: self.postVM.getPostClosure(userAuthVM: userAuthVM))
    }
}


struct PostEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostEditView(userId: 37, postId: 27)
                .environmentObject(UserAuthenticationViewModel(id: 37, token: "14f2518e6ffc20cf52642b7c7d51b63b88fe127f", isLoggedIn: true))
        }
        
    }
}