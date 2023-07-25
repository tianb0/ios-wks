//
//  BalanceView.swift
//  L9 Demo
//
//  Created by Tianbo Qiu on 7/24/23.
//

import SwiftUI

struct BalanceView: View {
    
//    @ObservedObject var profile = Profile()
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        
        if profile.isLoggedIn {
            Text("$999999")
        } else {
            Text("$xxxxxxx")
        }
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
