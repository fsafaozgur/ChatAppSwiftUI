//
//  TopArea.swift
//  ChatAppSwiftUI
//
//  Created by Safa on 17.12.2023.
//

import SwiftUI

struct TopArea: View {
    
    @Binding var user : UserFeature

    var body: some View {
        HStack{
            AsyncImage(url: URL(string: user.userImage)) { image in
                image
                    .resizable()
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .padding()
            } placeholder: {
                ProgressView()
            }
            
            Text(user.userName)
                .font(.title2)
            
            Spacer()
            
            Button {
                self.user = self.user == .Sender ? .Receiver : .Sender
            } label: {
                Text("Switch User")
                    .bold()
                    .font(.caption2)
                    .padding()
            }

        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .background(Color.topAreaBackground)
    }
}

/*struct TopArea_Previews: PreviewProvider {
    static var previews: some View {
        TopArea()
    }
}*/
