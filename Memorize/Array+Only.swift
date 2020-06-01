//
//  Array+Only.swift
//  Memorize
//
//  Created by Zappts Development MacMini on 01/06/20.
//  Copyright © 2020 Eduardo Saito. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
