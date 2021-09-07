//
//  UserDefaults+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

extension UserDefaults {
    
    enum Keys: String {
        
        case favoriteMovie
        
        var description: String {
            return self.rawValue
        }
    }
    
    func saveImage(_ path: String?) {
        // Create URL
        guard let path = path, let url = URL(string: BasePath.getImagesTheMovieDBAPI + path) else { return }

        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            UserDefaults.standard.set(data, forKey: path)
        }
    }
    
    func loadImage(_ path: String?) -> Data? {
        guard let path = path, let data = UserDefaults.standard.data(forKey: path) else { return nil }
        return data
    }
    
    func saveMovie(_ object: [FavoriteMovie], forKey key: String = Keys.favoriteMovie.description) {
        
        var objects = getMovieDetailsObject(forKey: key) ?? []
        objects.append(contentsOf: object)
        
        let encoder = JSONEncoder()
        if let encodedObject = try? encoder.encode(objects) {
            UserDefaults.standard.set(encodedObject, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getMovieDetailsObject(forKey key: String = Keys.favoriteMovie.description) -> [FavoriteMovie]? {
        if let object = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let decodedObject = try? decoder.decode([FavoriteMovie].self, from: object) {
                return decodedObject
            }
        }
        return nil
    }
    
    func removeMovieDetailsObject(_ object: FavoriteMovie, forKey key: String = Keys.favoriteMovie.description) {
        let objects = getMovieDetailsObject(forKey: key)?.filter({ movieDetail in
            object.movieDetails?.id != movieDetail.movieDetails?.id
        }) ?? []
       
        let encoder = JSONEncoder()
        if let encodedObject = try? encoder.encode(objects) {
            UserDefaults.standard.set(encodedObject, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    func removeAllMovies(forKey key: String = Keys.favoriteMovie.description) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
