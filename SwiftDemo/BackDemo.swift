//
//  BackDemo.swift
//  SwiftDemo
//
//  Created by 小山 on 2021/12/24.
//

import SwiftUI

struct BackDemo: View {
    
    @State var isShowing3 : Bool = false
    @Binding var isShowing2 : Bool
    
    
    var body: some View {
        Text("2").font(.system(size: 64)).padding(.bottom, 44)
        
        
        
        NavigationLink(
            destination: ContentView3(isShowing3: $isShowing3, isShowing2: $isShowing2),
            isActive: $isShowing3
        ) {
            Text("Enter")
        }.padding(.bottom, 44)
        
        Button(action: {
            isShowing2 = false
        }) {
            Text("返回")
        }
        
        
        
    }
    
}


struct ContentView3: View {
    @State var isShowing4 : Bool = false
    @Binding var isShowing3 : Bool
    @Binding var isShowing2 : Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Text("3").font(.system(size: 64)).padding(.bottom, 44)
            
            
            NavigationLink(
                destination: ContentView4(isShowing4: $isShowing4, isShowing3: $isShowing3, isShowing2: $isShowing2),
                isActive: $isShowing4
            ) {
                Text("Enter")
            }.padding(.bottom, 24)
            
            HStack {
                
                Spacer()
                
                Button (action: {
                    isShowing3 = false
//                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("返回上一页")
                }
                
                Spacer()
                
                Button (action: {
                    isShowing2 = false
                }){
                    Text("返回首页")
                }
                
                Spacer()
            }
        }.navigationBarTitle("3级页面")
    }
}



struct ContentView4: View {
    @Binding var isShowing4 : Bool
    @Binding var isShowing3 : Bool
    @Binding var isShowing2 : Bool

    var body: some View {
        VStack {
            Text("4").font(.system(size: 64)).padding(.bottom, 44)
            
            HStack {
                
                Spacer()
                
                Button (action: {
                    isShowing4 = false
                }){
                    Text("返回上一页")
                }
                
                Spacer()
                
                Button (action: {
                    isShowing3 = false
                }){
                    Text("返回上两页")
                }
                
                Spacer()
                
                
                Button (action: {
                    isShowing2 = false
                }){
                    Text("返回首页")
                }
                
                Spacer()
            }
        }.navigationBarTitle("3级页面")
    }
}
