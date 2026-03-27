//
//  opciones_configuracion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct OpcionConfiguracion :View {
    var titulo: String
    var descripcion: String
    
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text("\(titulo)").bold()
                    Spacer()
                }
                HStack{
                    Text("\(descripcion)")
                    Spacer()
                }
                
            }
            Image(systemName: "arrowtriangle.right").foregroundStyle(Color("color_principal"))
        }.padding().border(Color("color_principal"), width: 2)
    }
}

#Preview {
    OpcionConfiguracion(titulo: "titulo wea", descripcion: "ayuda")
}
