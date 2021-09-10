//
//  DataFactory.swift
//  CSVParser
//
//  Created by Bob Ranalli on 7/2/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var flowers: [Flower] = Flower.loadCSV(from: "flower")
}

protocol CSVLoadable {
    init?(raw: [String])
}

struct Plant: Identifiable, CSVLoadable {
    var name: String = ""
    var time: String = ""
    var water: String = ""
    var sun: String = ""
    var height: String = ""
    var plant_distance: String = ""
    var abb: String = ""
    var extras: String = ""
    var id = UUID()
    
    init?(raw: [String]) {
        name = raw[0]
        time = raw[1]
        water = raw[2]
        sun = raw[3]
        height = raw[4]
        plant_distance = raw[5]
        abb = raw[6]
        extras = raw[7]
    }
}


struct Flower: Identifiable, Codable, CSVLoadable {
    var name: String = ""
    var description: String = ""
    var sun: String = ""
    var soil: String = ""
    var water: String = ""
    var isFavorite: Bool = false
    var id = UUID()
    
    init?(raw: [String]) {
        name = raw[0]
        description = raw[1]
        sun = raw[2]
        soil = raw[3]
        water = raw[4]
    }
}

struct Compatible: Identifiable, CSVLoadable {
    var plant_name: String = ""
    var compatible_species: Array<String> = Array()
    var id = UUID()
    
    init?(raw: [String]) {
        plant_name = raw[0]
        compatible_species = [raw[1], raw[2], raw[3], raw[4], raw[6], raw[7], raw[8], raw[9], raw[10], raw[11], raw[12], raw[13], raw[14], raw[15], raw[17], raw[16], raw[18], raw[19], raw[20], raw[21], raw[22], raw[23]]
    }
}



extension CSVLoadable {
   
   static func loadCSV(from csvName: String) -> [Self] {
        var csvToStruct = [Self]()
        
        //locate csv file
        guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
            return[]
        }
        
        //convert contents to long string
        var data = ""
        do {
            data = try String(contentsOfFile: filePath)
        } catch {
            print(error)
            return []
        }
        
        //split long string into array of rows of data. Each row is string.
        //detect '/' then return, then split
        var rows = data.components(separatedBy: "\n")
        
        //count column headers first before removing
        let columnCount = rows.first?.components(separatedBy: ",").count
        rows.removeFirst()
        
        //loop each row and split into columns
        for row in rows {
            let csvColumns = row.components(separatedBy: ",")
            
            if csvColumns.count == columnCount {
                let generic_struct = Self.init(raw: csvColumns)
                csvToStruct.append(generic_struct!)
            }
        }
        return csvToStruct
    }
}
