//
//  ProfileHeaderView.swift
//  LabShare-Front
//
//  Created by Alexander Frazis on 20/9/20.
//  Copyright © 2020 CITS3200. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var userAuthVM: UserAuthenticationViewModel
    @ObservedObject var profileVM: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage()
                .padding(.leading, 30)
                .padding(.trailing, 30)
            HStack (alignment: .center) {
                Text("\(self.profileVM.profile.owner.firstName) \(self.profileVM.profile.owner.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3").font(Font.largeTitle)
                }
            }
            

            VStack (alignment: .leading, spacing: 7) {
                Text("About")
                    .font(.title)
                    .fontWeight(.medium)
                
                Text("Email: \(self.profileVM.profile.owner.email)")
                Text("Born: \(self.profileVM.profile.dob)")
                Text("Occupation: \(self.profileVM.profile.occupation)")
                Text("Employer: \(self.profileVM.profile.employer)")
                Text("Bio: \(self.profileVM.profile.bio)")
            }.padding(.leading, 5)
            Spacer()
        }.padding()
        .onAppear(perform: self.profileVM.getProfile)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(profileVM: ProfileViewModel(userId: 1, userAuthVM: UserAuthenticationViewModel(id: 1, token: "e3ef7d0655f1698e348a81eb184156b74612ad59", isLoggedIn: true)))
    }
}
