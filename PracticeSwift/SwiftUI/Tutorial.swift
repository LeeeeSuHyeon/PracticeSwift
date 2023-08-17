//
//  Tutorial.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/17.
//

import SwiftUI

struct Tutorial: View {
    var body: some View {
        
        VStack{
            
            newView()
            newView()
            newView()
            
        } // VStack
    }
}

struct newView : View {
    var body: some View{
        HStack{
            Text("1!")
                .foregroundColor(.blue)     // 글자색 지정
                .bold()                     // 글자 두껍게
                .font(.system(size: 40))    // 글자 사이즈 지정
            
            Text("2!")
                .foregroundColor(.blue)
                .bold()
                .font(.system(size: 40))
            
            Text("3!")
                .foregroundColor(.blue)
                .bold()
                .font(.system(size: 40))
        } // HStack
        .background(.red)   // HStack의 background color 추가
        .padding(10)        // HStack의 패딩 추가
    }
}


// 뷰를 미리보기 하기 위한 제공자 구조체 선언
struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        
        // 미리보기 표시
        Tutorial()
    }
}
