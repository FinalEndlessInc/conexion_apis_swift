//
//  pantalla_publicacion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

struct PantallaPublicacion: View {
    
    @Environment(ControladorGeneral.self) var controlador
    var id: Int
    
    var body: some View {
        VStack{
            switch(controlador.estado){
            case .descargando_publicacion:
                Image(systemName: "arrowshape.down.circle")
                    .symbolEffect(.bounce.down, options: .repeat(3))
                
            case .en_espera:
                if let publicacion = controlador.publicacion{
                    VerPublicacion(publicacion: publicacion)
                }else{
                    Text("Error en la descarga")
                }
                
            case .error_en_descarga:
                Text("Existe un error en la descarga")
                
            default:
                Text("Si ves esto, puedes mostrar esta pantalla por una galleta")
            }
        }
        .onAppear{
            controlador.descargar_publicacion(id: id)
        }
    }
}

#Preview {
    PantallaPublicacion(id: 2)
        .environment(ControladorGeneral())
}
