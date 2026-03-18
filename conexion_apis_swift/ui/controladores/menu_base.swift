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
            Tab("Publicaciones", systemImage: "tray.and.arrow.down.fill"){
                Inicio()
            }.badge(2)
            
            Tab("Perfil", systemImage: "tray.and.arrow.up.fill"){
                Text("Deberia hacer una pantalla de perfil")
            }
            
            Tab("Congiguracion", systemImage: "person.crop.circle.fill"){
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
