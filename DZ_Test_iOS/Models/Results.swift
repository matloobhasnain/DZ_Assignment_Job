//
//  NetworkLayer.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import Foundation
import ObjectMapper

struct Results : Mappable {
	var created_at : String?
	var price : String?
	var name : String?
	var uid : String?
	var image_ids : [String]?
	var image_urls : [String]?
	var image_urls_thumbnails : [String]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		created_at <- map["created_at"]
		price <- map["price"]
		name <- map["name"]
		uid <- map["uid"]
		image_ids <- map["image_ids"]
		image_urls <- map["image_urls"]
		image_urls_thumbnails <- map["image_urls_thumbnails"]
	}

}
