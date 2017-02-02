# Resource - Image Order

## Get Image Order

> ###Endpoint
> `GET` /vehicles/{vehicleId}/imageorder

> ###Request Example
> Retrieve the image order of the vehicle with id = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell

curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/imageorder \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Retrieve sorting order and details of existing vehicle images.

The first image in the sequence identifies the vehicle’s main image.

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
      "href": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/imageorder"
    }
  },
  "_request": {
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/imageorder",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "imageOrder": [
      "1322014787",
      "1322014969"
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
|_data|<a href="#imageOrderData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="imageOrderData"></span>

###Image Order Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|imageOrder|array, String|An array that has the IDs of the images. The index of each String value in the array represents the the order of the image.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

## Update Image Order

> ###Endpoint
> `PUT` /vehicles/{vehicleId}/imageorder

> ###Request Example
> Update the image order of the vehicle with id = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell

curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/imageorder \
     -X PUT \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
     -d '[ \
       "1322014969", \
       "1322014787" \
     ]'
```

Update sorting order and details of existing vehicle images.

The first image in the sequence identifies the vehicle’s main image.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|


###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Content-Type|String|Yes|The mediatype used for the body of the request. *It should be: application/json*|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

### Request Payload Parameters

The HTTP request body is an array that contains the IDs of the images. The index of each String value in the array represents the the order of the image, e.g.:

`["1322014969","1322014787"]`

The above array would would set the image with ID = 1322014969 as the primary image of the clasiffied listing.

> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/imageorder"
    }
  },
  "_request": {
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/imageorder",
    "body": "[\n      \"1322014969\",\n      \"1322014787\"\n    ]",
    "method": "PUT"
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
