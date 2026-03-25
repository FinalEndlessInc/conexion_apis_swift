//
//  controlador_general.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

@Observable
class ControladorGeneral{
    
    public var estado: EstadosControladorGeneral
    
    public var publicaciones: [Publicacion] = []
    
    public var publicacion: Publicacion? = nil
    
    init(){
        estado = .en_espera
        
        //descargar_publicaciones() /// Al rato lo borramos
    }
    
    func descargar_publicacion(id: Int){
        if(estado != .en_espera){
            return
        }
        
        self.publicacion = nil
        
        estado = .descargando_publicacion
        
        Task{
            try await Task.sleep(for: .seconds(5))
            await _descargar_publicacion(id: String(id))
            await _descargar_comentarios_de_publicacion(id: String(id))
            await _descargar_usuario(id: self.publicacion?.userId ?? -1)
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
    
    func descargar_usuario(id: Int){
        if(estado != .en_espera){
            return
        }
        
        estado = .descargando_publicacion
        
        Task{
            try await Task.sleep(for: .seconds(3))
            await _descargar_usuario(id: id)
            
            estado = .en_espera
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
        if(estado != .en_espera){
            return
        }
        
        Task{
            try await Task.sleep(for: .seconds(5))
            await _descargar_publicaciones()
        }
        
        estado = .en_espera
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
    
    private func _descargar_usuario(id: Int) async{
        let url = "\(url_base)/users/\(id)"
        
        let dinosaurio: Usuario? = await ServicioAPI.descargar_informacion(desde: url)
        
        if let dinosaurio = dinosaurio{
            self.publicacion?.usuario = dinosaurio
        }
        else{
            estado = .error_en_descarga
        }
    }
}
