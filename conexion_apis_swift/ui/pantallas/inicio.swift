//
//  inicio.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

import SwiftUI


struct Inicio: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        Text("Mes en yer")
        NavigationStack{
            switch(controlador.estado){
                case .descargando_publicaciones:
                    Text("Cargando, por favor espera")
                    
                case .en_espera:
                    ScrollView{
                        ForEach(controlador.publicaciones){ publicacion in
                            NavigationLink{
                                PantallaPublicacion(id: publicacion.id)
                            } label: {
                                Text(publicacion.title)
                            }
                            /*/.simultaneousGesture(TapGesture().onEnded{
                                controlador.descargar_publicacion(id: publicacion.id)
                            })*/
                        }
                    }
                
                case .descargando_publicacion:
                Image(systemName: "arrowshape.down.circle")
                    .symbolEffect(.pulse)
                    
                case .error_en_descarga:
                    Text("ERROR: Asegurate de tener wifi RAHH!!!")
            }
        }
        .onAppear{
            controlador.descargar_publicaciones()
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
