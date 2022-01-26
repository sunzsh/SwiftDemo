//
//  ContentView.swift
//  SwiftDemo
//
//  Created by 小山 on 2021/12/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowing2 : Bool = false
    
    var body: some View {
        List {
            NavigationLink {
                TopTabDemo()
                    .navigationTitle("运单")
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                Text("动画Bug")
            }
            
            NavigationLink(destination:
                            BackDemo(isShowing2: $isShowing2)
                            .navigationTitle("返回Demo")
                            .navigationBarTitleDisplayMode(.inline),
                           isActive: $isShowing2,
                           label: {
                Text("返回Demo")
            })
            
            
            NavigationLink(destination:
                            SizeDemo()
                            .navigationTitle("TopBg Demo")
                            .navigationBarTitleDisplayMode(.inline)
                           ,
                           label: {
                Text("TopBg Demo")
            })
            
            
            NavigationLink(destination:
                            OpPanelDemo()
                            .navigationTitle("我的订单")
                            .navigationBarTitleDisplayMode(.inline)
                           ,
                           label: {
                Text("操作面板Bug")
            })

        }
    }
}

