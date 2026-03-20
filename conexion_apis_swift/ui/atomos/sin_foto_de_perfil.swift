//
//  sin_foto_de_perfil.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct SinFotoDePerfil: View {
    var tamaño: CGFloat;
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: tamaño, height: tamaño)
                .foregroundStyle(Color.gray)
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: tamaño - 10)
                .foregroundStyle(Color.white)
        }.clipShape(Circle())
    }
}

#Preview {
    SinFotoDePerfil(tamaño: 60)
}
