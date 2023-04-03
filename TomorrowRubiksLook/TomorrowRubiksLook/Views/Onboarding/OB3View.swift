//
//  SwiftUIView.swift
//
//
//  Created by 김하은 on 2023/03/29.
//

import SwiftUI

struct OB3View: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundwr")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            Text("애잇팅! 팀원들")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
                            Text("루빅은 검은색을 제일 좋아해서"+"\n"+"검은색 옷만 입는 거에요? ")
                                .frame(width: 270, height: 78)
                                .foregroundColor(Color(red: 0.221, green: 0.221, blue: 0.221))
                                .background(Color(red: 1, green: 1, blue: 1).opacity(0.6))
                                
                                .cornerRadius(30)
                            
                        }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0.0))
                        Spacer()
                    }
                    NavigationLink {
                        OB4View()
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
                        }.padding(EdgeInsets(top: 30, leading: 0, bottom: 70, trailing: 32.0))
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OB3View_Previews: PreviewProvider {
    static var previews: some View {
        OB3View()
    }
}
