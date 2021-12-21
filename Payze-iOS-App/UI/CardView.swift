//
//  CardView.swift
//  Payze-iOS-App
//
//  Created by Bakur Khalvashi on 21.12.21.
//

import SwiftUI

struct CardView: View {
    
    @available(iOS 13.0.0, *)
    var body: some View {
        
        VStack {
            VStack (alignment: .leading){
            Text("Balance")
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
                .lineLimit(1)
                .offset(x: -40, y: 50)
                
            Text("₾4,348,23")
                .font(.system(size: 30, weight: .regular, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
            
            .offset(x: -40, y: 50)
            
            }
            VStack {
                Text("SALOME GELASHVILI")
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }.offset(x: -40, y: 50)
            
            
            HStack (spacing: 54){
                Text("4127 4210 0799 3973")
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(1)
                
                Text("11/22")
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(1)
            }
            .position(x: 135, y: 80)
            Image("img-visa")
                .frame(width: 50, height: 50)
                .position(x: 250, y: -100)
        }
        .frame(width: 290, height: 180)
        .shadow(radius: 20)
        .background(LinearGradient(colors: [Color.purple,Color.init(hex: "1C1D34")], startPoint: .topTrailing, endPoint: .leading))
        .cornerRadius(15)
        
    }
}

struct CardView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        CardView()
    }
}

