//
//  pantalla_usuario.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/25/26.
//

import SwiftUI

struct PantallaUsuario: View {
    var id: Int
    
    @State var gestor_usuario = ControladorUsuario()
    
    var body: some View {
        VStack{
            switch(gestor_usuario.estado){
                case .decargando:
                    Image(systemName: "arrow.down.circle.fill")
                    .symbolEffect(.breathe)
                
                case .error_en_la_descarga:
                    Text("Hayt un erro por ahi")
                
                case .espera:
                    if let usuario = gestor_usuario.usuario{
                        VistaUsuario(usuario: usuario)
                    }else{
                        Text("Error 404")
                    }
            }
            
        }.onAppear{
            gestor_usuario.descargar_usuario(id: id)
        }
    }
}

#Preview {
    PantallaUsuario(id: 5)
}
