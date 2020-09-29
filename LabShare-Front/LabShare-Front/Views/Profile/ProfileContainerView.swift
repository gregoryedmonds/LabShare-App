//
//  myProfileView.swift
//  LabShare-Front
//
//  Created by Ananda Buckley on 6/9/20.
//  Copyright © 2020 CITS3200. All rights reserved.
//

import SwiftUI

struct ProfileContainerView: View {
    @EnvironmentObject var userAuthVM: UserAuthenticationViewModel
    //May want to think of alternative, does this need to be in a view?
    var body: some View {
        NavigationView {
            ProfileView(userId: userAuthVM.userAuth.id)
        }.accentColor(.green)
    }
}


struct ProfileContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContainerView()
            .environmentObject(UserAuthenticationViewModel(id: 72, token: "d4e3814547b0b328f3baae5ea78a3b1417464386", isLoggedIn: true))
    }
}
