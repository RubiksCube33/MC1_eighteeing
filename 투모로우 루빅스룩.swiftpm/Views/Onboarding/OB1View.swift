//
//  SwiftUIView.swift
//  
//
//  Created by 김하은 on 2023/03/29.
//

import SwiftUI
import Combine

struct OB1View: View {
    
    @State var splashOpacity : Double = 100.0

    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundwr")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Text("오늘도 검은 옷을 입은 루빅")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 340.0, height: 86.0)
                    NavigationLink(destination: OB2View()) {
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
                SplashView()
                    .opacity(splashOpacity)
            }
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    splashOpacity = 0
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OB1View_Previews: PreviewProvider {
    static var previews: some View {
        OB1View()
    }
}
