//
//  vista_usuario.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct VistaUsuario: View {
    var usuario: Usuario
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    SinFotoDePerfil(tamaño: 80)
                    VStack{
                        Text("\(usuario.name)").font(.title2)
                    }
                    Spacer()
                }
                
                VStack{
                    Text("\(usuario.username)")
                    Text("\(usuario.email)")
                    Text("\(usuario.phone)")
                }
            }.padding().border(Color.black, width: 1)
            VStack{
                Spacer()
                
                Text("No hay publicaciones todavia").font(.title)
                Image(systemName: "camera.on.rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                
                Spacer()
            }.padding()
            Spacer()
            
        }
        
    }
}
