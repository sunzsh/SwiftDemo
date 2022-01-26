//
//  SizeDemo.swift
//  SwiftDemo
//
//  Created by 小山 on 2021/12/28.
//

import SwiftUI

struct SizeDemo: View {
    @State private var offsetY: Double = 80
    var body: some View {
        VStack(spacing: 90) {
            HStack {
                Text("test")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 30)
                .background(Color.mint)
            //                    .background(LinearGradient(gradient: Gradient(colors: [.mint, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                .background(RadialGradient(gradient: Gradient(colors: [.mint, .blue]), center: .center, startRadius: 20, endRadius: 50))
//                                .background(Image(uiImage: UIImage(named: "colorbg.png")!).resizable())
//            .frame(width:60)
                .offset(y:offsetY)
            
                HStack() {
                    Text("test")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 30)
                    .background(Color.blue)
                //                    .background(LinearGradient(gradient: Gradient(colors: [.mint, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    //                                .background(RadialGradient(gradient: Gradient(colors: [.mint, .blue]), center: .center, startRadius: 20, endRadius: 50))
    //                                .background(Image(uiImage: UIImage(named: "colorbg.png")!).resizable())
    //            .frame(width:60)
                    .offset(y:offsetY)
            
            
//            Rectangle()
//                .fill(Color.mint)
//                .frame(maxWidth: .infinity)
//                .frame(height: 30)
//                .offset(y:offsetY)
                
            
            
            Spacer()
            Text("\(Int(offsetY))").font(.system(size: 45))
            Slider(value: $offsetY, in: -300...150, step: 1)
            
            Spacer()
        }
        

    }
}

struct SizeDemo_Previews: PreviewProvider {
    static var previews: some View {
        SizeDemo()
    }
}
