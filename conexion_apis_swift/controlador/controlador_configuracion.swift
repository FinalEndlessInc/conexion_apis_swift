//
//  controlador_configuracion.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/25/26.
//

import SwiftUI

@Observable
class ControladorConfiguracion{
    public var estado: EstadosConfiguracion
    
    public var usuario: Usuario? = nil
    
    init(){
        estado = .espera
    
    }
    
    func obtener_datos_del_usuario(id: Int){
        estado = .descargando_datos
        
        Task{
            try await Task.sleep(for: .seconds(2))
            
            await _obtener_datos_del_usuario(id: id)
        }
    }
    
    private func _obtener_datos_del_usuario(id: Int) async{
        let url_usuario: String = "\(url_base)/users/\(id)"
        
        if let usuario_descargado: Usuario = await ServicioAPI.descargar_informacion(desde: url_usuario){
            usuario = usuario_descargado
            estado = .esperando_edicion
            
        }else{ // Si recibimos un nil entonces algo salio mal y debo poner una pantalla de error
            estado = .error_de_configuracion
        }
    }
}
