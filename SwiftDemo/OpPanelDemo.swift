//
//  OpPanelDemo.swift
//  SwiftDemo
//
//  Created by 小山 on 2022/1/3.
//

import SwiftUI

struct OpPanelDemo: View {
    
    private let topToolBarHeight: Double = 40
    private let sortedOptions: [String] = ["最近下单", "最近发货", "最近签收"]
    private let opPanelAnimationDuringTime : Double = 0.3
    @State private var sortedByIndex: Int = 0
    
    @State private var maskOp: Double = 0

    @State private var sortHeight: CGFloat = .zero
    @State private var sortPanelOffsetY: Double = -UIScreen.main.bounds.size.height
    
    private let sortLblColorSelected: Color = Color.init(hex:"#1477F9, 100%")!
    private let sortLblColor: Color = Color.init(hex: "#262626, 100%")!
    
    var body: some View {
        ZStack(alignment: .top) {
            
            dataList.padding(.top, topToolBarHeight)
            
            mask
            
            OpPanelSort.offset(y: sortPanelOffsetY)
                
            topOpToolBar
                
            
        }.frame(maxWidth: .infinity)
            .background(Color.init(hex: "#F5F6F9, 100%")!.ignoresSafeArea())
    }
    
    var mask: some View {
        Rectangle().fill(Color.black).opacity(0.4).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .opacity(maskOp)
            .onTapGesture(perform: {
                hideAllTopPanel()
            })
            .ignoresSafeArea()
            .animation(.linear(duration: opPanelAnimationDuringTime), value: maskOp)
    }
    
    var topOpToolBar: some View {
        HStack {
            // 筛选/排序 状态面板
            Button(action: {
                toggleSortPanel()
            }) {
                Text("排序：\(sortedOptions[sortedByIndex])").padding(.leading, 16)
                Image(systemName: "chevron.down")
            }
            Spacer()
            Image(systemName: "magnifyingglass")
            Text("筛选").padding(.trailing, 16)
            
            
        }.frame(maxWidth: .infinity)
            .font(.system(size: 14))
            .foregroundColor(Color.init(hex: "#595959, 100%"))
            .frame(height: topToolBarHeight, alignment: .leading)
            .background(.white)
    }
    
    var OpPanelSort: some View {
        VStack {
            VStack {
                ForEach (0..<sortedOptions.count) { ind in
                    
                    Button(action: {
                        sortedByIndex = ind
                        toggleSortPanel()
                    }) {
                        Text(sortedOptions[ind]).frame(maxWidth: .infinity, maxHeight: 44,
                            alignment: .leading)
                            .foregroundColor(ind == sortedByIndex ? sortLblColorSelected : sortLblColor)
                    }
                }
                
                
            }
            .font(.system(size: 14))
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 13, trailing: 16))
        }.frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
            .shadow(color: Color.init(hex: "#000000, 4%")!, radius: 8, x: 0, y: 12)
//            .animation(.linear(duration: opPanelAnimationDuringTime), value: sortPanelOffsetY)
            .alignmentGuide(.top, computeValue: { d in
                DispatchQueue.main.async {
                    sortHeight = max(d.height, sortHeight)
                    if (sortPanelOffsetY == -UIScreen.main.bounds.size.height) {
                        sortPanelOffsetY = -sortHeight + topToolBarHeight
                    }
                }
                return d[.top]
            })
    }
    
    var dataList: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach (0 ..< 20) { ind in
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("订单号：1234567890123")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.init(hex: "#595959, 100%"))
                                Spacer()
                            }.overlay(Text("待发货").font(.system(size: 13)).foregroundColor(.white)
                                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                                        .frame(width: nil, height: 24, alignment: .center)
                                        .background(Color.init(hex: "#1477F9, 100%")).cornerRadius(12), alignment: .trailing)
                            
                            Text("苹果").font(.system(size: 18))
                            
                            HStack {
                                Text("数量：1箱")
                                    .font(.system(size: 14))
                                Spacer()
                                Text("下单日期：2022-01-03")
                                    .font(.system(size: 14))
                            }.foregroundColor(Color.init(hex: "#595959, 100%"))
                        }.padding(13)
                    }.frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    
                }
            }.frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        }
    }
    
    func hideMask() {
        self.maskOp = 0
    }
    func showMask() {
        self.maskOp = 1
    }
    
    func hideAllTopPanel(){
        hideSortPanel()
        hideMask()
    }
    
    func showSortPanel() {
        withAnimation {
            sortPanelOffsetY = topToolBarHeight
        }
    }
    func hideSortPanel() {
        withAnimation {
            sortPanelOffsetY = -sortHeight + topToolBarHeight
        }
    }
    func toggleSortPanel() {
        if( self.sortPanelOffsetY >= 0 ) {
            hideSortPanel()
            hideMask()
        } else {
            showSortPanel()
            showMask()
        }
    }
}
