//
//  VStack.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/25.
//

import SwiftUI

struct MyVStack: View {
    var body: some View {
        
        // Vertical Stack
        // alignment : 각 요소들의 배치, spacing : 각 요소들간의 패딩
        VStack(alignment: .leading, spacing: 50){
            
            // 공간을 만드는 Divider
            Divider().opacity(0)
            
            Text("VStack")
                .font(.system(size: 20))
                .fontWeight(.bold)
    
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
        }
        
        // VStack에 대한 설정
        .frame(width: 300)
        .background(Color.yellow)
        
    }
}

struct VStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
