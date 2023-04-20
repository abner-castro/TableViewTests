//
//  RemoteService.swift
//  TableViewTests
//
//  Created by Abner Castro on 20/04/23.
//

import Foundation

protocol RemoteData {
    func getTableData(completion: @escaping ([String]) -> ())
}

class RemoteService: RemoteData  {
    
    func getTableData(completion: @escaping ([String]) -> ()) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0, execute: {
            
            completion(["Primero", "Segundo", "Tercero", "Cuarto", "Quinto"])
            
        })
        
    }
}
