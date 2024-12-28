//
//  LoadingView.swift
//  LoadingView
//
//  Created by Storanky on 12/28/24.
//

import Foundation
import SwiftUI
import UIKit

/// `LoadingView` is a start page，creating cool and smooth transition effects.
struct LoadingView: View {
   
    @Environment(\.colorScheme) var colorScheme
    @State private var quote: String = ""
    @State private var opacity: Double = 0.0
    
    /// List of quotations. Because the program displays words horizontally, it is more suitable for Chinese
    
    private let quotes = [
        "胜败乃兵家常事",
        "天行健，君子自强不息",
        "厚积薄发，厚德载物",
        "自助者天助之",
        "坚持就是胜利",
        "逆水行舟，不进则退"
    ]
    
    var body: some View {
        
        let backgroundColor = colorScheme == .dark
            ? Color(red: 32 / 255, green: 35 / 255, blue: 46 / 255)
            : Color.white
        let textColor = colorScheme == .dark
            ? Color.white : Color(UIColor.darkGray)
        
        ZStack {
            
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                
                Image("icon") // display your icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100) // icon size
                
                VStack {
                    // display each word horitally
                    ForEach(0..<quote.count, id: \.self) { index in
                        let character = quote[quote.index(quote.startIndex, offsetBy: index)]
                        Text(String(character))
                            .font(.custom("PingFang", size: 24))
                            .foregroundColor(textColor)
                            .opacity(opacity)
                            .animation(
                                .easeIn(duration: 0.5).delay(Double(index) * 0.1),
                                value: opacity
                            ) // Delayed display of each character
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear {
            // random choose of quotations
            quote = quotes.randomElement() ?? "努力工作，努力生活。"
            
            // wait for 0.6s and display the animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    opacity = 1.0
                }
            }
            
            // wait 2.22 s and go to your main page
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.22) {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    let window = scene.windows.first
                    window?.rootViewController = UIHostingController(rootView: ContentView())
                    window?.makeKeyAndVisible()
                }
            }//replace ContentView() with your main page.
            
        }
    }
}

/*
 hint:
- Make sure you have the `Icon` icon resource in your project.
- Replace `ContentView()` with the actual view of the app's main interface.
*/
