//
//  ProductPromo.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 13, 2020

import Foundation
import SwiftyJSON


class ProductPromo : NSObject, Codable{

    var descriptionField : String!
    var id : String!
    var imageUrl : String!
    var loved : Int!
    var price : String!
    var title = ""

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
    override init(){
        super.init()
    }
    
	init(_ json: JSON!){
		if json.isEmpty{
			return
		}
        descriptionField = json["description"].stringValue
        id = json["id"].stringValue
        imageUrl = json["imageUrl"].stringValue
        loved = json["loved"].intValue
        price = json["price"].stringValue
        title = json["title"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if descriptionField != nil{
        	dictionary["description"] = descriptionField
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if imageUrl != nil{
        	dictionary["imageUrl"] = imageUrl
        }
        if loved != nil{
        	dictionary["loved"] = loved
        }
        if price != nil{
        	dictionary["price"] = price
        }
        dictionary["title"] = title
        
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(_ aDecoder: NSCoder)
	{
		descriptionField = aDecoder.decodeObject(forKey: "description") as? String
		id = aDecoder.decodeObject(forKey: "id") as? String
		imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
		loved = aDecoder.decodeObject(forKey: "loved") as? Int
		price = aDecoder.decodeObject(forKey: "price") as? String
		title = aDecoder.decodeObject(forKey: "title") as! String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(_ aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if imageUrl != nil{
			aCoder.encode(imageUrl, forKey: "imageUrl")
		}
		if loved != nil{
			aCoder.encode(loved, forKey: "loved")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
        aCoder.encode(title, forKey: "title")
		
	}

}
