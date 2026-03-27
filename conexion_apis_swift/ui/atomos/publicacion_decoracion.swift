//
//  publicacion_decoracion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct PublicacionDecorada :View {
    var publicacion: Publicacion
    
    
    var body: some View {
            VStack{
                HStack{
                    SinFotoDePerfil(tamaño: 60)
                    
                    VStack(alignment: .leading){
                        HStack{
                            //Nombre del usuario que lo publico
                            
                            Text("\(publicacion.usuario?.name ?? "Anonimo")")
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.black)
                        }
                        VStack{
                            //Publicacion
                            Text("\(publicacion.body)")
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.black)
                        }
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                   
                }
                AccionesPublicacion()
            }
            .padding()
            //.frame(height: 150)
            .background(Color.white)
    }
}

