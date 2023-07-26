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
            
        }
                
    }
}

struct HStack_Previews: PreviewProvider {
    static var previews: some View {
        MyHStack()
    }
}
