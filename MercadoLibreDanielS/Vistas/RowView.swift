//
//  RowView.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import SwiftUI

struct RowView: View {
    var articulo:Articulo
    
    
    var body: some View {
        HStack{
            
            AsyncImage(url: URL(string: articulo.urlImagen)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 90, height: 90)
            
           
            VStack(alignment: .leading){
                
                Text(articulo.nombre)
                    .font(.title2)
                
                Text("$ \(articulo.precio)")
                    .font(.title3)
                
            }.padding()
            
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(articulo: Articulo(idarticulo: "idTest", nombre: "NombreTest", precio: 123456, condicion: "condicion Test", urlImagen: "http://mla-s2-p.mlstatic.com/795558-MLA31003306206_062019-I.jpg"))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
