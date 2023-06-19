//
//  Articulos.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import Foundation
import SwiftUI



struct Articulo : Identifiable {
    
    let id = UUID()
    var idarticulo: String
    var nombre: String
    var precio: Int
    var condicion:String
    var urlImagen:String
    
}
