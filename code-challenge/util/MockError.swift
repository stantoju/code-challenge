//
//  ResponseError.swift
//  code-challenge
//
//  Created by Toju on 30/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import Foundation

enum MockError: Error {
    case fieldRequired(err: Response)
    case noMatch(err: Response)
}
