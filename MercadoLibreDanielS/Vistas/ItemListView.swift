//
//  ItemListView.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import SwiftUI

struct ItemListView: View {
    
    
    let apiService = APIService()
    @Binding var searchText:String
    var listArticulos:[Articulo]
  
    
       
    
    var body: some View {
       // se crea una lista con los articulos ya decodificados y agregados a una lista de "Articulos" para mostrarlos
            VStack {
                    List(listArticulos) { articulo in
                            NavigationLink(destination: DetailArticle(articulo: articulo)){
                                //se creo una vista de renglon personalizada 
                                    RowView(articulo: articulo)
                            }
                    }
            }
            .navigationTitle("Resultados para: '\(searchText)'")
       
                   
                    
                   
                 
                            
                
    }
}



struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(searchText: .constant("test"), listArticulos: [Articulo(idarticulo: "1", nombre: "1", precio: 1, condicion: "1", urlImagen: "")])
    }
}
