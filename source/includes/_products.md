# Resource - Products

The Products resource is a sub-resource of the Vehicle resource. It manages the lifecycle of advertising products that can be atached to an existing vehicle.

## Book an Ad Product

> ###Endpoint
> `POST` /vehicles/{vehicleId}/products

> ###Request Example
> Book a premium ad product for a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell

curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/products \
     -X POST \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
     -d '{ \
            "productId": "T30", \
            "subtitle": "Amazing Car" \
         }'
```

Attach an ad product to an existing vehicle.

Please note that product bookings will be charged to the dealer in question on a daily basis.

For product bookings an optional subtitle can be posted (Type=string, maxLength=55).
Subtitles will be shown as part of the vehicle information on a search result list page. The additional subtitle can be used to further highlight specific features of a vehicle.

**Semantic Rules**

The following semantic rules are applied when booking an ad product to a vehicle.

**Allowed products ( Only for dealers in Germany, France, Belgium, Luxemburg):**

T30 = PremiumInserat
(max. 30 images will be shown as part of the vehicle ad)

T20 = PlusInserat
(max. first 20 images will be shown as part of the vehicle ad)

**Important information:**

Attention: Product bookings for „PremiumInserat“ (T30) or „PlusInserat“ (T20) via API are being rejected if the dealer has activated automatic booking rules for his stock on AutoScout24.de.
Either T30 or T20 can be attached to a vehicle – not both at the same time.
**Should you wish to switch from T30 to T20 or vice versa you must delete the existing product booking first.**

Detailed information on these ad products in Germany can be found by clicking <a href="http://ww2.autoscout24.de/partner-infoportal/b2b-marketing-power.aspx">here</a>.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|

###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Content-Type|String|No|The mediatype used for the body of the request. *It should be: application/json*|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

### Payload Parameters

*Note: string length is counted as total of UFT-8 characters.*

|Field Name|Type|Mandatory|Format|Description|
|----|----|----|----|----|
|productId|string|yes||The ID of the ad product to be booked. Allowed values: T30, T20|
|subtitle|string|No|maxLength=55|Subtitles will be shown as part of the vehicle information on a search result list page. The additional subtitle can be used to further highlight specific features of a vehicle.|

> ###Response Example

```json

{
  "_links": {
    "self": {
      "href": null
    }
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/products",
    "body": "{\"productId\":\"T30\",\"subtitle\":\"Amazing Car\"}",
    "method": "POST"
  },
  "_response": {
    "type": "Success"
  }
}

```

###Response Payload Parameters

The HTTP response message that's received has the following body attributes:

|Field Name|Type|Description|
|----|----|----|
|_links|Object|The links object that has all the hypermedia links of the requested resource.|
|_request|<a href="#request-object">Request</a>|An object that contains information about the sent HTTP request message. This object is mostly needed for debugging, logging, and monitoring purposes.|
|_response|<a href="#response-object">Response</a>|An object that contains information about what happened on the server e.g. it gives information if the request was processed successfully.|


### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

##Retrieve Booked Ad Product

> ###Endpoint
> `GET` /vehicles/{vehicleId}/products

> ###Request Example
> Retrieve the booked ad product of a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell
curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/products \
     -X GET
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Retrieve ad product information for an existing vehicle.

Response shows whether at all and which ad product(s) are currently assigned to a given vehicle.
Accompanying, optional subtitle will also be returned.

**Attention:** A response showing product = T10 means that no paid ad product has been booked for this vehicle (T10 is the standard ad product “BasicInserat”).

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|

###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|


> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/products"
    },
    "products": [
      {
        "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/products/T30"
      }
    ]
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/products",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "products": [
      {
        "productId": "T30",
        "subtitle": "Amazing Car"
      }
    ]
  }
}
```

###Response Payload Parameters

The HTTP response message that's received has the following body attributes:

|Field Name|Type|Description|
|----|----|----|
|_links|Object|The links object that has all the hypermedia links of the requested resource.|
|_request|<a href="#request-object">Request</a>|An object that contains information about the sent HTTP request message. This object is mostly needed for debugging, logging, and monitoring purposes.|
|_response|<a href="#response-object">Response</a>|An object that contains information about what happened on the server e.g. it gives information if the request was processed successfully.|
|_data|<a href="#productsData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="productsData"></span>
###Products Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|products|array,<a href="#ProductObject">Product</a>|An array that contains information about the booked products.|


<span id="ProductObject"></span>
###Product Object

|Field Name|Type|Description|
|----|----|----|
|name|String|Name of the booked product.|
|productId|String|A unique identifier of the booked product.|
|subtitle|String|The additional subtitle can be used to further highlight specific features of a vehicle.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.


## Terminate Ad Booking

> ###Endpoint
> `DELETE` /vehicles/{vehicleId}/products/{productId}

> ###Request Example
> Terminate the T30 booking of the vehicle with id = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell

curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/product/T30 \
     -X DELETE \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Terminate an existing product booking for a given vehicle.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|
|productId|URI Parameter|Yes|Unique identifier for a given product.|


###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": null
    }
  },
  "_request": {
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/products/T30",
    "body": null,
    "method": "DELETE"
  },
  "_response": {
    "type": "Success",
    "messages": [
      {
        "code": 10003,
        "messageType": "Info",
        "text": "Product with id T30 was succesfully deleted."
      }
    ]
  }
}
```

###Response Payload Parameters

The HTTP response message that's received has the following body attributes:

|Field Name|Type|Description|
|----|----|----|
|_links|Object|The links object that has all the hypermedia links of the requested resource.|
|_request|<a href="#request-object">Request</a>|An object that contains information about the sent HTTP request message. This object is mostly needed for debugging, logging, and monitoring purposes.|
|_response|<a href="#response-object">Response</a>|An object that contains information about what happened on the server e.g. it gives information if the request was processed successfully.|


### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.
