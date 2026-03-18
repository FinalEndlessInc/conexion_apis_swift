//
//  publicacion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

struct Publicacion: Identifiable, Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    var comentarios: [Comentario]?
}
