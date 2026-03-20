//
//  ver_publicacion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct VerPublicacion: View {
    var body: some View {
        VStack{
            HStack{
                SinFotoDePerfil(tamaño: 60)
                Text("Wenas")
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(-5)
            
            HStack{
                Text("mucho Texto asi asi, mucho texto, no mpuede ser se esta llenando esta xingadera")
            }.padding()
            
            AccionesPublicacion()
            
        }
        .padding()
        .background(Color("color_principal"))
    }
}

#Preview {
    VerPublicacion()
}
