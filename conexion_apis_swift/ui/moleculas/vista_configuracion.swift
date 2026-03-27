//
//  vista_configuracion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct VistaConfiguracion :View {
    var usuario: Usuario
    
    var body: some View {
        VStack{
            HStack{
                SinFotoDePerfil(tamaño: 40)
                Text("\(usuario.name)")
                Spacer()
            }.padding()
            OpcionConfiguracion(titulo: "Editar perfil", descripcion: "Cambia los datos")
            OpcionConfiguracion(titulo: "Apariencia", descripcion: "Apariencia de la aplicación")
            OpcionConfiguracion(titulo: "Tu actividad", descripcion: "Me gusta, guardados, tiempo en aplicacion")
            OpcionConfiguracion(titulo: "Privacidad", descripcion: "Datos y otras opciones")
            Spacer()
            
        }
    }
}

