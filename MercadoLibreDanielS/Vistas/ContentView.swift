//
//  ContentView.swift
//  MercadoLibreDanielS
//
//  Created by AvidosDev on 19/06/23.
//

import SwiftUI


private var listArticulosG = [Articulo(idarticulo: "", nombre: "", precio: 0, condicion: "", urlImagen: "")]

struct ContentView: View {
    let apiService = APIService()
    
    @State private var textoArticulo = ""
    @State private var mostrarlista = false
    @State private var mostrarAlerta = false
    @State private var SpinnerOculto = true
    @State private var mensajeAlerta = ""
    
  
  
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("¿Qué articulo deseas buscar?")
                    .font(.title2)
                    .padding()
                
                
                TextField("Nombre del articulo", text: $textoArticulo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                /**
                 Crear un navegador dentro que se dispara al presionar el boton
                 si el usuario no ingreso nada arroja una alerta de lo contrario
                 ejecuta el endpont de rtar max 11 articulos, al traerlos se navega
                 hacia la pantalla "itemListView" para ver los resultados de la busqueda
                 */
                NavigationLink(
                    destination: ItemListView(searchText: $textoArticulo, listArticulos: listArticulosG),
                                isActive: $mostrarlista,
                                label: {
                                    Button(action: {
                                        
                                        if(textoArticulo.isEmpty){
                                            mensajeAlerta = "Ingrese el nombre del articulo"
                                            mostrarAlerta = true
                                            
                                        }else{
                                            SpinnerOculto = false
                                         
                                                apiService.traerMax10Articulos(withSearchQuery: textoArticulo) { (arrayArticulos, error) in
                                                      if let error = error {
                                                          print("Error: \(error.localizedDescription)")
                                                          mensajeAlerta = "Error: \(error.localizedDescription)"
                                                          mostrarAlerta = true
                                                          SpinnerOculto = true
                                                      } else if let arrayArticulos = arrayArticulos {
                                                           listArticulosG = arrayArticulos
                                                         
                                                          SpinnerOculto = true
                                                          mostrarlista = true
                                                      }
                                                  }
                                        }
                                            }, label: {
                                                    HStack {
                                                        Text("Buscar")
                                                            .font(.headline)
                                                        Image(systemName: "magnifyingglass")
                                            
                                                    }.padding()
                                    }).buttonStyle(.borderedProminent)
                                        .alert(isPresented: $mostrarAlerta) {
                                                    Alert(title: Text("!"), message: Text(mensajeAlerta), dismissButton: .default(Text("OK")))
                                                }
                                }
                            )
                
                ProgressView().isHidden(SpinnerOculto)
                
                
                            
                
            }
            .padding()
            .background(Color.yellow)
            .colorScheme(.light)
            .cornerRadius(20)

            
           
           
            
        }
    }
}

//Se crea la extencion en View para crear la función "isHidden" que nos permite saber en que momento mostrar u ocultar la vista
//en este caso solo se implemento en la vista de ProgressVies

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


