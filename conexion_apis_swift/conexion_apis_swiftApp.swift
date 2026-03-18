//
//  conexion_apis_swiftApp.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

@main
struct conexion_apiApp: App {
    @State var controlador_general = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            MenuBase()
                .environment(controlador_general)
        }
    }
}

#Preview{
    MenuBase()
        .environment(ControladorGeneral())
}
