//
//  ContentView.swift
//  SportsApp
//
//  Created by fayza on 4/28/21.
//  Copyright © 2021 fayza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var animate: Bool = false
        var body: some View {
            ZStack{
                
                ZStack {
                    Image("logo")
                        .resizable()
                        .background(Color.white)
                        .frame(width: 150, height: 150)
                        .offset(y: animate ? -100 : 0)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image("yellow")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: animate ? 300 : 150, y: animate ? -300 : -150)
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        Image("yellow")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .offset(x: animate ? -500 : -150, y: animate ? 500 : 150)
                        
                        
                        Spacer()
                    }
                }
                
                ZStack(alignment: .bottom){
                    
                    GeometryReader { g in
                        VStack (alignment: .leading, spacing: 20){
                            Text("Welcome")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.top, 15)
                            
                            Text("Sports is one of the most sources of entertainment that intrigues millions. With the best sports apps, you can keep a tab on how your favorite team is performing on the tap of your fingers")
                            
                            HStack {
                                
                                Button(action: {}) {
                                    Text("Start")
                                        .frame(width: 100, height: 30)
                                        .padding(10)
                                        .foregroundColor(.black)
                                        .background(Color.white)
                                        .clipShape(Capsule())
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .background(Color.yellow)
                        .clipShape(CustomShape(leftCorner: .topLeft, rightCorner: .topRight, radii: 16))
                        .offset(y: self.animate ? g.size.height : UIScreen.main.bounds.height)
                        
                    }
                    
                }.frame(height: 300)
            }
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation(Animation.easeOut(duration: 1.20)){
                        self.animate.toggle()
                    }
                }
            })
        }
    }

    struct CustomShape: Shape {
        var leftCorner: UIRectCorner
        var rightCorner: UIRectCorner
        var radii: CGFloat
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [leftCorner, rightCorner], cornerRadii: CGSize(width: radii, height: radii))
            
            return Path(path.cgPath)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
}
