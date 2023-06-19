//
//  Servicios.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import Foundation

class APIService {
    
    func traerMax10Articulos(withSearchQuery query: String, completion: @escaping ([Articulo]?, Error?) -> Void) {
        
        let urlString = "https://api.mercadolibre.com/sites/MLA/search?q=" + query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        //Verificar si la url es válida de lo contrario arrojar un error
           guard let url = URL(string: urlString) else {
               completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL inválida"]))
               return
           }
           
        
        //Verificar si el servidor nos responde de lo contrario arrojar un error
           let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
               if let error = error {
                   completion(nil, error)
                   return
               }
               
               guard let data = data else {
                   completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Datos no disponibles"]))
                   return
               }
               
               do {
                   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                      
                       if let pagin = json["paging"] as? NSDictionary{
                          // verificar si hay mas de 11 resultados de la busqueda para asi solo obtener los 11 primeros de lo contrario obtener todos los resultados que salgan 
                           if pagin["total"] as! Int > 11{
                               if let results = (json["results"] as? Array<NSDictionary>)?.prefix(through: 10){
                                 
                                   var articulosBuscados = [Articulo]()
                                   for result in results{
                                       articulosBuscados.append(Articulo(
                                        idarticulo: (result["id"] as? String) ?? "No id" ,
                                        nombre: (result["title"] as? String) ?? "No nombre" ,
                                        precio: (result["price"] as? Int) ?? 0,
                                        condicion: (result["condition"] as? String) ?? "No nombre",
                                        urlImagen: (result["thumbnail"] as? String) ?? "No url" ))
                                     
                                   }
                                  
                                   completion(articulosBuscados, nil)
                                   
                               }else{
                                   completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error al convertir los datos"]))
                               }
                           }else{
                               if let results = json["results"] as? Array<NSDictionary>{
                                   var articulosBuscados = [Articulo]()
                                   for result in results{
                                       articulosBuscados.append(Articulo(
                                        idarticulo: (result["id"] as? String) ?? "No id" ,
                                        nombre: (result["title"] as? String) ?? "No nombre" ,
                                        precio: (result["price"] as? Int) ?? 0,
                                        condicion: (result["condition"] as? String) ?? "No nombre",
                                        urlImagen: (result["thumbnail"] as? String) ?? "No url" ))
                                   }
                                   completion(articulosBuscados, nil)
                                   
                               }else{
                                   completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error al convertir los datos"]))
                               }
                               
                           }
                       }else{
                           completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error al convertir los datos"]))
                       }
                   } else {
                       completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error al convertir los datos"]))
                   }
               } catch {
                   completion(nil, error)
               }
           }
           
           task.resume()
       }
}
