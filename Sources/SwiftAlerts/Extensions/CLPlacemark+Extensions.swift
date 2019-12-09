//
//  CLPlacemark+Extensions.swift
//  Alerts&Pickers
//
//  Created by Lex on 04.10.2018.
//  Copyright © 2018 Supreme Apps. All rights reserved.
//

import Foundation
import CoreLocation
import Contacts

extension CLPlacemark {

    var postalAddressIfAvailable: CNPostalAddress? {
        return self.postalAddress
    }

}
