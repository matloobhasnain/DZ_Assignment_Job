//
//  NetworkLayer.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import Foundation
import ObjectMapper

struct Pagination : Mappable {
	var key : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		key <- map["key"]
	}

}
