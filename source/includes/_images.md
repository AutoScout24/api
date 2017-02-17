# Resource - Images

The Images resource is a sub-resource of the Vehicle resource. It manages the complete lifecycle of the images of a specific vehicle on the AutoScout24 marketplace. This includes inserting, updating, retrieving, and deleting images of a vehicle.

## Upload an Image

> ###Endpoint
> `POST` /vehicles/{vehicleId}/images

> ###Request Example
> Uploading an image and attaching it to a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell

curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/images \
     -X POST \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
     -F "file=@carFoto.jpg"
```

Upload a new vehicle image.

- Using this method only one image can be uploaded at a time.
- Allowed image formats are `JPG` or `PNG`.
- Images are attached to the vehicle one after another. Initial image order is therefore dependent on successful upload dates and can be changed later.

The following overview shows how many images can be uploaded/shown per vehicle.

**Max. 30 images can be uploaded.**

Images will be shown according to selected ad product:

Premium Ad Product (T30): max. 30 images

Plus Ad Product (T20): max. first 20 images

Basic Ad Product (T10): max. first 15 images

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|

###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Content-Type|String|Yes|The mediatype used for the body of the request. *It should be: multipart/form-data*|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|


> ###Response Example

```json

{
  "_links": {
    "self": {
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/images/1321961722"
    }
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/images",
    "body": null,
    "method": "POST"
  },
  "_response": {
    "type": "Success",
    "objectId": "1321961722"
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

##Retrieve Vehicle's Images

> ###Endpoint
> `GET` /vehicles/{vehicleId}/images

> ###Request Example
> Retrieve all the images of a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell
curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/images \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Retrieve all existing images of a vehicle.

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
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/images"
    },
    "images": [
      {
        "href": "http://pic.autoscout24.net/images-big/014/470/0266470014001.jpg?35d21ba78abe"
      }
    ]
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/images",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "images": [
      {
        "id": "1321961722",
        "href": "http://pic.autoscout24.net/images-big/014/470/0266470014001.jpg?35d21ba78abe",
        "type": "image/jpeg"
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
|_data|<a href="#imagesData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="imagesData"></span>
###Images Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|images|array, <a href="#ImageObject1">Image</a>|An array that holds the images objects.|


<span id="ImageObject1"></span>
###Image Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|id|String|The unique ID of the image object.|
|href|String|The URI of the image object.|
|type|String|The type of the image objects. Possible values are: image/jpeg , image/png|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

##Retrieve an Image

> ###Endpoint
> `GET` /vehicles/{vehicleId}/images/{imageId}

> ###Request Example
> Retrieve the image of id = 1321961722 for the vehicle with id = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell
curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722 \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer 73a06d83-6e13-4444-a288-6aa8c4098c2f"
```

Retrieve details of an existing vehicle image.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleId|URI Parameter|Yes|Unique identifier for a given vehicle.|
|imageId|URI Parameter|Yes|Unique identifier for a given image.|


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
      "href": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722"
    }
  },
  "_request": {
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success",
    "objectId": "1321961722"
  },
  "_data": {
    "image": {
      "id": "1321961722",
      "href": "http://pic.autoscout24.net/images-big/014/470/0266470014001.jpg?35d21ba78abe",
      "type": "image/jpeg"
    }
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
|_data|<a href="#imageData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="imageData"></span>
###Image Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|image|<a href="#ImageObject2">Image</a>|An object that contains information about the requested image object.|


<span id="ImageObject2"></span>
###Image Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|id|String|The unique ID of the image object.|
|href|String|The URI of the image object.|
|type|String|The type of the image objects. Possible values are: image/jpeg , image/png|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.


## Update an Image

> ###Endpoint
> `PUT` /vehicles/{vehicleId}/images/{imageId}

> ###Request Example
> Update the image with id = 1321961722 of the vehicle with id = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell

curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722 \
     -X PUT \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
     -F "file=@carFoto.jpg"
```

Update an existing vehicle's image.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleId|URI Parameter|Yes|Unique identifier for a given vehicle.|
|imageId|URI Parameter|Yes|Unique identifier for a given image.|


###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Content-Type|String|Yes|The mediatype used for the body of the request. *It should be: multipart/form-data*|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|


> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722"
    }
  },
  "_request": {
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722",
    "body": null,
    "method": "PUT"
  },
  "_response": {
    "type": "Success",
    "objectId": "1321961722"
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


## Delete an Image

> ###Endpoint
> `DELETE` /vehicles/{vehicleId}/images/{imageId}

> ###Request Example
> Delete the image with id = 1321961722 of the vehicle with ID = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell

curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722 \
     -X DELETE \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Delete an existing vehicle image.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleId|URI Parameter|Yes|Unique identifier for a given vehicle.|
|imageId|URI Parameter|Yes|Unique identifier for a given image.|


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
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/images/1321961722",
    "body": null,
    "method": "DELETE"
  },
  "_response": {
    "type": "Success",
    "messages": [
      {
        "code": 10001,
        "messageType": "Info",
        "text": "Image with id 1321961722 was succesfully deleted."
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
