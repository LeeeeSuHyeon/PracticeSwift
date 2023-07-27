//
//  HStack.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/25.
//

import SwiftUI

struct MyHStack: View {
    var body: some View {
        
        HStack{
            Text("HStack")

            Rectangle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 100, height: 100)
            
            VStack{
                Text("Stack in HStack")
                    .font(.system(size: 10))
                
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50)
            }
            
        }
        .frame(height: 300)
        .background(Color(.orange))
        
                
    }
}

struct HStack_Previews: PreviewProvider {
    static var previews: some View {
        MyHStack()
    }
}
