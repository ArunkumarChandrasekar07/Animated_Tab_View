//
//  ContentView.swift
//  Animated Tab Icon
//
//  Created by Arunkumar Chandrasekar on 13/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab: Tab = .home
    
    @Environment(\.colorScheme) var scheme
    
    @State var animatedIcon: [AnimatedIcon] = {
        var tabs: [AnimatedIcon] = []
        
        for tab in Tab.allCases {
            tabs.append(.init(tabIcon: tab, lottieView: .init(name: tab.rawValue)))
        }
        
        return tabs
    }()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("home".uppercased())
                    .setBG()
                    .tag(Tab.home)
                
                Text("chat".uppercased())
                    .setBG()
                    .tag(Tab.chat)
                
                Text("notification".uppercased())
                    .setBG()
                    .tag(Tab.notification)
                
                Text("bookmark".uppercased())
                    .setBG()
                    .tag(Tab.bookmark)
                
                Text("account".uppercased())
                    .setBG()
                    .tag(Tab.account)
            }
            if #available(iOS 16, *) {
                TabBar()
                    .toolbar(.hidden, for: .tabBar)
            }else {
                TabBar()
            }
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(animatedIcon) { icon in
                ResizableLottieView(lottieView: icon.lottieView)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        currentTab = icon.tabIcon
                        icon.lottieView.play { _ in
                            
                        }
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            (scheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func setBG() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
            )
    }
}
