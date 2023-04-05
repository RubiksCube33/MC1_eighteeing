//
//  SwiftUIView.swift
//
//
//  Created by 김하은 on 2023/03/29.
//

import SwiftUI

struct OB2View: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundwr")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    VStack{
                        Text("생각해보니 어제도")
                            .font(.title3)
                            .fontWeight(.bold)
                           
                        Text("루빅은 검은 옷을 입었다!")
                            .font(.title3)
                            .fontWeight(.bold)
                          
                    }.frame(width: 340.0, height: 86.0)
                    NavigationLink {
                        OB3View()
                    } label: {
                        HStack(alignment: .center){
                            Spacer()
                            Text("NEXT")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            Image("arrow")
                                .resizable()
                                .frame(width: 24.0, height: 24.0)
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 32.0))
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OB2View_Previews: PreviewProvider {
    static var previews: some View {
        OB2View()
    }
}
