//
//  controlador_usuario.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/25/26.
//

// GESTIONAR la descarga y el control de un usuario
import SwiftUI

enum EstadosBasicos{
    case decargando
    case error_en_la_descarga
    case espera
}

@Observable
class ControladorUsuario{
    var estado: EstadosBasicos = .espera
    var usuario: Usuario? = nil
    
    func descargar_usuario(id: Int){
        estado = .decargando
        
        Task{
            try await Task.sleep(for: .seconds(5))
            
            await _descargar_usuario(id: id)
        }
    }
    
    private func _descargar_usuario(id: Int) async{
        let url_del_usuario: String = "\(url_base)/users/\(id)"
        
        if let usuario_descargado: Usuario = await ServicioAPI.descargar_informacion(desde: url_del_usuario){ // Si se puede descargar la informacion, porque no hay un nil de regreso, entonces todo esta good
            usuario = usuario_descargado
            estado = .espera
            
        }else{ // Si recibimos un nil entonces algo salio mal y debo poner una pantalla de error
            estado = .error_en_la_descarga
        }
    }
}
