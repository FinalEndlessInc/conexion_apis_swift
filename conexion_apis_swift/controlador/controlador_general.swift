//
//  controlador_general.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

@Observable
class ControladorGeneral{
    let url_base = "https://jsonplaceholder.typicode.com"
    
    public var estado: EstadosControladorGeneral
    
    public var publicaciones: [Publicacion] = []
    
    public var publicacion: Publicacion? = nil
    
    init(){
        estado = .descargando_publicaciones
        
        descargar_publicaciones()
    }
    
    func descargar_publicacion(id: Int){
        self.publicacion = nil
        
        estado = .descargando_publicacion
        
        Task{
            try await Task.sleep(for: .seconds(5))
            await _descargar_publicacion(id: String(id))
            await _descargar_comentarios_de_publicacion(id: String(id))
        }
    }
    
    private func _descargar_publicacion(id: String) async {
        let url = "\(url_base)/posts/\(id)"
        
        let publicacion: Publicacion? = await ServicioAPI.descargar_informacion(desde: url)
        // print(respuesta)
        if let publicacion = publicacion { // EN efecto pasamos a tener un objeto valido o descarga os bien las cosas
            self.publicacion = publicacion
            print("\(publicacion)")
        }
        else {
            estado = .error_en_descarga
        }
    }
    
    
    private func _descargar_comentarios_de_publicacion(id: String) async {
        let url = url_base + "/posts/\(id)/comments"
        
        let comentarios: [Comentario]? = await ServicioAPI.descargar_informacion(desde: url)
        // print(respuesta)
        if let comentarios = comentarios {
            self.publicacion?.comentarios = comentarios
            
        }
        else {
            estado = .error_en_descarga
        }
    }
    
    func descargar_publicaciones(){
        Task{
            try await Task.sleep(for: .seconds(5))
            await _descargar_publicaciones()
        }
    }
    
    private func _descargar_publicaciones() async {
        let url = url_base + "/posts"
        
        let respuesta: [Publicacion]? = await ServicioAPI.descargar_informacion(desde: url)
        // print(respuesta)
        if let respuesta = respuesta {
            publicaciones = respuesta
            estado = .en_espera
        }
        else {
            estado = .error_en_descarga
        }
    }
}
