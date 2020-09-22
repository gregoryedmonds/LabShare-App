//
//  ProfileHeaderView.swift
//  LabShare-Front
//
//  Created by Alexander Frazis on 20/9/20.
//  Copyright © 2020 CITS3200. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var profileVM: ProfileViewModel
    init(userId: Int) {
        self.profileVM = ProfileViewModel(userId: userId)
    }
    var body: some View {
        VStack {  
            CircleImage()
                .padding(.leading, 30)
                .padding(.trailing, 30)
//            Text("Alex")
            Text("\(self.profileVM.profile.owner.firstName) \(self.profileVM.profile.owner.lastName)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom)
//            HStack {
//                Spacer()
////                Text(self.profileVM.profile.name)
//                
//                Spacer()
//            }.padding(.top, 15)
//                .padding(.bottom, -10)

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("About")
                            .font(.title)
                            .fontWeight(.medium)
                        Text("Email: \(self.profileVM.profile.owner.email)")
                        Text("Born: \(self.profileVM.profile.dob)")
                        Text("Occupation: \(self.profileVM.profile.occupation)")
                        Text("Employer: \(self.profileVM.profile.employer)")
                    }
                    Spacer()
                }
                HStack{
                    Text("\(self.profileVM.profile.owner.firstName) \(self.profileVM.profile.owner.lastName)'s Posts")
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                }
            }.padding(.leading, 5)
            Spacer()
        }.onAppear(perform: self.profileVM.getProfile)
        
        
        
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(userId: 10)
    }
}
