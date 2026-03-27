//
//  pantalla_configuracion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct PantallaConfiguracion :View {
    
    var id: Int
    @State var controlador = ControladorConfiguracion()
    
    var body: some View {
        VStack{
            switch(controlador.estado){
                case .descargando_datos:
                    Image(systemName: "arrow.down.circle.fill")
                    .symbolEffect(.breathe)
                
                case .error_de_configuracion:
                    Text("Hayt un erro por ahi")
                
                case .espera:
                if let usuario = controlador.usuario{
                        VistaConfiguracion(usuario: usuario)
                    }else{
                        Text("Error 404")
                    }
                case .esperando_edicion:
                    Text("No se deberia mostrar esta pantalla todavia")
            }
            
        }.onAppear{
            controlador.obtener_datos_del_usuario(id: id)
        }
    }
}

#Preview {
    PantallaConfiguracion(id: 5)
}
