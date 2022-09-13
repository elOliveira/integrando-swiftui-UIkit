//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by cit on 11/09/22.
//

import SwiftUI
import UIKit

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    // Storing Each Tab Midpoints to animate it in future...
    @State var tabPoints: [CGFloat] = []
    @State private var apresentar = true


    var body: some View {
        ZStack {
            HStack(spacing:0){
                TabBarButton(image: "magnifyingglass.circle", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "bubble.left.and.bubble.right", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "pawprint", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "globe.americas", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "bell", selectedTab: $selectedTab, tabPoints: $tabPoints)
            }
            .padding()
            .background(
                Color.white
                    .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
            )
            .overlay(
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 10, height: 10)
                    .offset(x: getCurvePoint() - 20)
                
                ,alignment: .bottomLeading
            )
            .cornerRadius(30)
        .padding(.horizontal)
        }.padding(.bottom, 16)
            .sheet(isPresented: $apresentar) {
                NavigationView{
                    teste4().navigationBarHidden(true)
                    teste4().navigationTitle("test")
                }
            }
    }
    // extracting point...
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        }else{
            switch selectedTab{
            case "magnifyingglass.circle":
                return tabPoints[4]
            case "bubble.left.and.bubble.right":
                return tabPoints[3]
            case "bell":
                return tabPoints[0]
            case "globe.americas":
                return tabPoints[1]
            default:
                return tabPoints[2]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader{ reader -> AnyView in
            // extracting MidPoint and Storing...
            let midX = reader.frame(in:.global).midX
            
            DispatchQueue.main.async {
                // avoiding junk data...
                if tabPoints.count <= 5 {
                    tabPoints.append(midX)
                }
            }

            return AnyView (
                Button(action: {
                    //changing tab...
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                        selectedTab = image
                    }
                    
                    if selectedTab == "bell" {
                        print("a aba selecionada ta sendo => \(selectedTab)")

                    }

                }, label: {
                    // filling the color if it selected...
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("colorBackgroundTabBar"))// COLOR IS SELECTED
                    //Lifting View ...
                    // if its selected...
                        .offset(y: selectedTab == image ? -10 : 0)
                })
                // MAX FRAME
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        // MAX Height
        .frame(height: 50)
    }
}


struct teste4: UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("teste")
    }
    

    func makeUIViewController(context: Context) -> some UIViewController {
        let tela = teste()
        return tela
        
    }

}
