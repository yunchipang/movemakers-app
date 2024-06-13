//
//  ErrorHandling.swift
//  movemakers
//
//  Created by Yunchi Pang on 6/13/24.
//

import Foundation

struct APIErrorResponse: Codable {
    let detail: String
}

class ErrorHandling {
    static func parseAPIError(_ error: Error, completion: @escaping (String) -> Void) {
        if let apiError = error as? NSError,
           let responseData = apiError.userInfo[NSLocalizedRecoverySuggestionErrorKey] as? Data {
            // attempt to decode the error response
            do {
                let decodedError = try JSONDecoder().decode(APIErrorResponse.self, from: responseData)
                completion(decodedError.detail)
            } catch {
                completion("An unexpected error occurred. Please try again later.")
            }
        } else {
            completion(error.localizedDescription)
        }
    }
}
