//
//  NetworkLayer.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import Foundation
import ObjectMapper

struct ProductListing : Mappable {
	var results : [Results]?
	var pagination : Pagination?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		results <- map["results"]
		pagination <- map["pagination"]
	}

}
