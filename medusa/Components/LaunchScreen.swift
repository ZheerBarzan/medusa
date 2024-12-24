//
//  LaunchScreen.swift
//  medusa
//
//  Created by Zheer Barzan on 23/12/24.
//

import SwiftUI

struct LaunchScreen: View {
    
    @State private var isActive = false
    
    var body: some View {
        
        if isActive{
            LoginView()
        }else{
            
            ZStack{
                Color.white
                    .ignoresSafeArea()
                Image("Medusa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation{
                        isActive = true
                    }
                }
                
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
