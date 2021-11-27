//
//  ProfileView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 11/3/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            VStack {
                HeaderBanner()
                ProfileText()
            }
        }
    }
}

struct HeaderBanner: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            Image(systemName:"person.crop.circle")
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

struct ProfileText: View {
    var first_name = "Vishwam"
    var last_name = "Pandya"
    var subtitle = "Subtitle"
    var description = "Description"
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(first_name + " " + last_name)
                    .bold()
                    .font(.title)
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
