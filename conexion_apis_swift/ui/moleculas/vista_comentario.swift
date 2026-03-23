//
//  vista_comentario.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct VistaComentario: View {
    var comentario: Comentario
    var body: some View {
        Text("Titulo: \(comentario.body)")
        Text("De: \(comentario.name)")
    }
}
