//
//  publicacion_decoracion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct PublicacionDecorada :View {
    //var publicacion: Publicacion
    
    var body: some View {
            VStack{
                HStack{
                    SinFotoDePerfil(tamaño: 60)
                    
                    VStack(alignment: .leading){
                        HStack{
                            //Nombre del usuario que lo publico
                            Text("Aquí debería ir el usuario")
                                .bold()
                        }
                        VStack{
                            //Publicacion
                            Text("Aquí va todo el rollo del texto")
                        }
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                   
                }
                AccionesPublicacion()
            }
            .padding()
            //.frame(height: 150)
            .background(Color("color_principal"))
    }
}

#Preview {
    PublicacionDecorada()
}
