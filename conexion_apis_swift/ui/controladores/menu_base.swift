//
//  menu_base.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

struct MenuBase: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        TabView{
            Tab("Publicaciones", systemImage: "square.and.pencil"){
                Inicio()
            }.badge(2)
            
            Tab("Perfil", systemImage: "person.crop.circle"){
                PantallaUsuario(id:7)
            }
            
            Tab("Congiguracion", systemImage: "gearshape"){
                Text("Tambien una configuracion")
            }
            .badge("!")
        }
    }
}

#Preview {
    MenuBase()
        .environment(ControladorGeneral())
}
