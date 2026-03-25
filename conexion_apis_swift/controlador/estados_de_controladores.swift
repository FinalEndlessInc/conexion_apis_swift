//
//  estados_controlador_general.swift
//  conexion_apis_swift
//
//  Created by alumno on 3/18/26.
//

enum EstadosControladorGeneral{
    case descargando_publicaciones
    case en_espera
    case descargando_publicacion
    case error_en_descarga
}

enum EstadosUsuario{
    case decargando
    case error_en_la_descarga
    case espera
}

enum EstadosConfiguracion{
    case descargando_datos
    case esperando_edicion
    case espera
    case error_de_configuracion
}
