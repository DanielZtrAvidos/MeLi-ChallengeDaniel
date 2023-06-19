//
//  SplashView.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var estaActivo = false
    
    var body: some View {
        VStack {
            Text("¡Bienvenido!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.estaActivo = true
            }
        }
        .fullScreenCover(isPresented: $estaActivo, content: {
            ContentView()
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
