//
//  ver_publicacion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct VerPublicacion: View {
    var publicacion: Publicacion
    
    var body: some View {
        VStack{
            HStack{
                SinFotoDePerfil(tamaño: 60)
                Text("\(publicacion.usuario?.name ?? "Anonimo")")
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(-5)
            
            HStack{
                Text("\(publicacion.title)")
            }
            
            HStack{
                Text("\(publicacion.body)")
            }.padding()
            
            AccionesPublicacion()
            
        }
        .padding()
        
        
        
    }
}


