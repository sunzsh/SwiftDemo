//
//  TopTabDemo.swift
//  SwiftDemo
//
//  Created by 小山 on 2021/12/17.
//

import SwiftUI

private let TITLES = ["待确认", "待运输", "运输中", "已完成"]
private let TITLE_SPACING = 10.0
private let pwidth: CGFloat  = UIScreen.main.bounds.size.width

struct TopTabDemo: View {
    @State private var selectedIndex = 0
    var body: some View {
        VStack {
            TopView
            pageView
        }
    }
}


extension TopTabDemo {
    private var pageView : some View {
        TabView(selection: $selectedIndex) {
            ForEach(0 ..< TITLES.count) {index in
                getView(index: index)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }

    @ViewBuilder func getView(index: Int) -> some View {
        Text(TITLES[selectedIndex])
    }
}


extension TopTabDemo {
    private var TopView : some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: TITLE_SPACING) {
                    ForEach(0 ..< TITLES.count ) { index in
                        Text(TITLES[index])
                                .fontWeight(selectedIndex == index ? .bold : nil)
                                .foregroundColor(selectedIndex == index ? Color.init(hex: "#1477F9, 100%")! : nil)
                                .font(Font.system(size: 16))
                                .frame(height: 30)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            self.selectedIndex = index;
                        }
                    }
                }
                
                GeometryReader { geometry in
                    let itemFullWidth = (geometry.size.width - CGFloat(TITLES.count - 1) * TITLE_SPACING) / CGFloat(TITLES.count) // <- 包含空白
                    let itemStartX = (itemFullWidth  + TITLE_SPACING) * CGFloat(selectedIndex)
                    let currentWidth = TITLES[selectedIndex].width(withConstrainedHeight: 100, font: UIFont.systemFont(ofSize: 16)) // <- 实际文字宽度
                    Capsule()
                        .fill(Color.init(hex: "#1477F9, 100%")!)
                        .frame(height: 2)
                        .frame(width: currentWidth)
                        .offset(x: itemStartX + (itemFullWidth - currentWidth) / 2.0)
                        .animation(.default, value: selectedIndex)
                }.frame(height: 2)
                
                   

            }.background(Color.white)
        }
    }
}


struct TopTabDemo_Previews: PreviewProvider {
    static var previews: some View {
        TopTabDemo()
    }
}
