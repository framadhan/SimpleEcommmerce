//
//  Category.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 13, 2020

import Foundation
import SwiftyJSON


class Category : NSObject, NSCoding{

    var id : Int!
    var imageUrl : String!
    var name : String!

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
        id = json["id"].intValue
        imageUrl = json["imageUrl"].stringValue
        name = json["name"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if id != nil{
        	dictionary["id"] = id
        }
        if imageUrl != nil{
        	dictionary["imageUrl"] = imageUrl
        }
        if name != nil{
        	dictionary["name"] = name
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		id = aDecoder.decodeObject(forKey: "id") as? Int
		imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
		name = aDecoder.decodeObject(forKey: "name") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if imageUrl != nil{
			aCoder.encode(imageUrl, forKey: "imageUrl")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}
