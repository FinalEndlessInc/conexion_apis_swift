//
//  publicacion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct VistaPublicacion: View {
    var publicacion: Publicacion
    var body: some View {
        Text("Publicacion: \(publicacion.title)")
        
        VStack{
            if let usuario = publicacion.usuario{
                NavigationLink{
                    PantallaUsuario(id: usuario.id)
                }label:{
                    MiniVistaUsuario(usuario: usuario)
                }
                
            }else{
                Text("Error")
            }
        }
        ScrollView{
            ForEach(publicacion.comentarios ?? []){ comentario in
                VistaComentario(comentario: comentario)
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        PantallaPublicacion(id: 3)
            .environment(ControladorGeneral())
    }
}
