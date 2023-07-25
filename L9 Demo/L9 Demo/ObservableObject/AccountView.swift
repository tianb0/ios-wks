//
//  AccountView.swift
//  L9 Demo
//
//  Created by Tianbo Qiu on 7/24/23.
//

import SwiftUI

struct AccountView: View {
    
//    @ObservedObject var profile = Profile()
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        
        VStack {
            
            if profile.isLoggedIn {
                Text("Hello and welcome back!")
            } else {
                Text("Please log in")
                
            }
            
            BalanceView()
            
            Button {
                profile.isLoggedIn = true
            } label: {
                Text("Log in")
            }
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
