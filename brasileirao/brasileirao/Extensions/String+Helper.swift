//
//  String+Helper.swift
//  brasileirao
//
//  Created by Ana Julia on 3/12/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

extension String {
    
    func transformToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "pt-br")
        return formatter.date(from: self)
    }
    
    func formatData() -> String? {
        guard let date = self.transformToDate() else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dataString = formatter.string(from: date)

        return dataString
    }
    
    func formatHora() -> String? {
        guard let date = self.transformToDate() else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let horaString = formatter.string(from: date)

        return horaString
    }
    
    func formatDia() -> String? {
        guard let date = self.transformToDate() else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        let horaString = formatter.string(from: date)

        return horaString
    }
    
}
