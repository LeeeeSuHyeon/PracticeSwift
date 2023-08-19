//
//  Tutorial.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/17.
//

import SwiftUI

struct Tutorial: View {
    
    // @State : 값의 변화를 감지하고 뷰에 적용
    @State private var isActivated : Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                VStack{
                    
                    newView()
                    newView()
                    newView()
                    
                } // VStack
                
                // isAcitved가 true이면 50, false면 10으로 패딩 지정
                .padding(isActivated ? 50 : 10)
                
                // isAcitved가 true이면 .yellow, false면 .green
                .background(isActivated ? .yellow : .green)
                
                // 탭 제스처 추가
                .onTapGesture {
                    
                    // 애니메이션 추가
                    withAnimation{
                        
                        // toggle() true이면 false로 false면 true로 변경
                        self.isActivated.toggle()
                    }
                }
                
                // destination : 이동하고자 하는 뷰
                NavigationLink(destination: myTextView()){
                    Text("네비게이션")
                        .fontWeight(.heavy)
                        .font(.system(size:30))
                        .padding()
                        .background(.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding(30)
                
            }
        }   // NavigationView
    }   // body
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


// 이동할 뷰 
struct myTextView : View{
    
    // 배경색 배열 인덱스
    @State var index = 0
    
    // 배경색 배열
    let backgroundColorArray = [Color.red, Color.blue, Color.green, Color.yellow, Color.brown]
    
    
    var body: some View{
        VStack{
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
                // 배경을 전체로 설정
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .background(self.backgroundColorArray[self.index])
        
        .onTapGesture {
            // index가 backgroundColorArray의 배열 수보다 커지면 index를 0으로 설정
            if (index == backgroundColorArray.count - 1){
                index = 0
            }
            else{
                index += 1
            }
        } // onTopGesture
    }
}


// 뷰를 미리보기 하기 위한 제공자 구조체 선언
struct Tutorial_Previews: PreviewProvider {
    
    static var previews: some View {
        
        // 미리보기 표시
        Tutorial()
    }
}
