//
//  DetailArticle.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import SwiftUI

struct DetailArticle: View {
    
    let articulo:Articulo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                
                AsyncImage(url: URL(string: articulo.urlImagen)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 250, height: 250)
             
                
                Text(articulo.nombre)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                
                Text("$\(articulo.precio)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                
                Text("La condición del articulo es '\(articulo.condicion)'")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                
            }
        }
    }
}

struct DetailArticle_Previews: PreviewProvider {
    static var previews: some View {
        DetailArticle(articulo: Articulo(idarticulo: "uid", nombre: "Nombre del articulo", precio: 123456789, condicion: "new", urlImagen: ""))
    }
}
