//
//  SwiftUIView.swift
//
//
//  Created by 김하은 on 2023/03/29.
//

import SwiftUI

struct OB5View: View {
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
                            Text("루빅은 검은색을 제일 좋아해서"+"\n"+"검은색 옷만 입는 거에요? ")
                             
                                .frame(width: 270, height: 78)
                                .foregroundColor(Color(red: 0.221, green: 0.221, blue: 0.221))
                                .background(Color(red: 1, green: 1, blue: 1).opacity(0.6))
                                .cornerRadius(30)
                            
                        }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0.0))
                        Spacer()
                    } //메시지 1
                    HStack{
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("루빅")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                               
                            Text("좋아하기도 하는데, 검은색 옷이             가장 슬림해 보이기도 하고~~~  이건 이런게 다르고 어쩌구 저쩌구")
                              
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 27))
                                .multilineTextAlignment(.trailing)
                                .frame(width: 289, height: 99)
                                .foregroundColor(Color(red: 0.221, green: 0.221, blue: 0.221))
                                .background(Color(red: 1, green: 1, blue: 1).opacity(0.6))
                                .cornerRadius(30)
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                    } //메시지 2
                    HStack{
                        VStack(alignment: .leading){
                            Text("애잇팅! 팀원들")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                            Text("우와! (그런 깊은 뜻이..!)                루빅 옷은 매일 관찰하는 재미가 있어요 🤣 내일은 뭐 입고 오실거에요? 우리 한 번 추측해봐요!!")
                                
                                .padding(EdgeInsets(top: 18, leading: 27, bottom: 18, trailing: 27))
                                .frame(width: 321, height: 125)
                                .foregroundColor(Color(red: 0.221, green: 0.221, blue: 0.221))
                                .background(Color(red: 1, green: 1, blue: 1).opacity(0.6))
                                .cornerRadius(30)
                            
                        }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0.0))
                        Spacer()
                    } //메시지 1
                VStack(alignment: .center){
                    NavigationLink {
                        GameHome()
                    } label: {
                        Text("내일의 루빅룩은?")
                                .padding(.init(top: 20, leading: 108, bottom: 20, trailing: 108))
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                    }
                    Text("다른 러너들과 내기해봐요!")
                        .padding(.init(top: 11, leading: 0, bottom: 0, trailing: 0))
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color(red: 0.229, green: 0.229, blue: 0.229))
                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 50, trailing: 0))
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OB5View_Previews: PreviewProvider {
    static var previews: some View {
        OB5View()
    }
}
