//
//  Bundle+Extension.swift
//  FruitMart
//
//  Created by Dongmin on 2023/08/06.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

extension Bundle {
    
    func decodeJSON<T: Decodable>(atFileName fileName: String) throws -> T {
        guard let fileURL = self.url(forResource: fileName, withExtension: nil) else {
            throw FileError.notExistFile
        }
        
        guard let fileData = try? Data(contentsOf: fileURL) else {
            throw FileError.failureDataInitializing
        }
        
        guard let decodedFile = try? JSONDecoder().decode(T.self, from: fileData) else {
            throw FileError.failureDecoding
        }
        
        return decodedFile
    }
    
}

extension Bundle {
    
    enum FileError: Error {
        case notExistFile
        case failureDataInitializing
        case failureDecoding
    }
    
}
