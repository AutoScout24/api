# Resource - Videos

The Videos resource is a sub-resource of the Vehicle resource. Using this resource, youtube videos can be attached to a vehicle to be displayed on its detail page on the AutoScout24 marketplace. This resource manages the lifecycle of a vehicle's youtube video including creation, deletion, and retrieval of video URL.

## Attach a Youtube Video

> ###Endpoint
> `POST` /vehicles/{vehicleId}/videos

> ###Request Example
> Attach a video to a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee

```shell
curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/videos \
    -X POST \
    -H "X-AS24-Version: 1.1"  \
    -H "Accept-Language: en-GB" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
    -d '{ \
      "videoUrl": "https://www.youtube.com/watch?v=wnKJnWRa_Ks" \
    }'

```

Attach a new vehicle youtube video.

- Using this method only one video URL can be attached.
- The video can be only a youtube video.
- When attaching a video, you accept AutoScout24's video requirements and terms of use:

Anforderungen an Videos von AutoScout24:
Die eingestellten Videos dürfen nur das von Ihnen angebotene Fahrzeug wiedergeben. Sie verpflichten sich, nur solche Videos einzustellen, die nicht gegen Rechte Dritter verstoßen. Die verwendeten Videos dürfen nicht irreführend sein und müssen den tatsächlichen Zustand des angebotenen Fahrzeugs widerspiegeln.
AutoScout24 weist Sie darauf hin, dass bei der Erstellung der Videos die geltenden gesetzlichen Vorschriften, für gewerbliche Anbieter insbesondere die „Preisangabenverordnung“ (PAngV) oder die „Verordnung über Verbraucherinformationen zu Kraftstoffverbrauch und CO2-Emissionen neuer Personenkraftwagen“ (PKW-EnVKV) zu beachten sind.

AutoScout24 hat das Recht, Videos, die die oben stehenden Anforderungen nicht erfüllen oder gegen die Nutzungsbedingungen von YouTube verstoßen, zu löschen.


### Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|

### Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Content-Type|String|Yes|The mediatype used for the body of the request. *It should be: application/json*|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

### Payload Parameters

*Note: string length is counted as total of UFT-8 characters.*

|Field Name|Type|Mandatory|Format|Description|
|----|----|----|----|----|
|videoUrl|string|yes|youtube video URL|The URL of the vehicle video to be attached.|

### Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1"
    }
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee//videos",
    "body": "\"https://www.youtube.com/watch?v=XwhHYuP8Lfk\"",
    "method": "POST"
  },
  "_response": {
    "type": "Success",
    "objectId": "e1f3ac50-c184-42cc-b9e0-a82c141929b1"
  }
}
```

### Response Payload Parameters

The HTTP response message that's received has the following body attributes:

|Field Name|Type|Description|
|----|----|----|
|_links|Object|The links object that has all the hypermedia links of the requested resource.|
|_request|<a href="#request-object">Request</a>|An object that contains information about the sent HTTP request message. This object is mostly needed for debugging, logging, and monitoring purposes.|
|_response|<a href="#response-object">Response</a>|An object that contains information about what happened on the server e.g. it gives information if the request was processed successfully.|

### Error Codes

For the list of possible <strong>error codes</strong> in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

> ###Endpoint
> `GET` /vehicles/{vehicleId}/videos

> ###Request Example
> Retrieve the videos of a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell
curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/videos \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Accept: application/json" \
     -H "Authorization: Bearer 73a06d83-6e13-4444-a288-6aa8c4098c2f"
```

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
Accept|String||Yes|The Bearer authentication token that was received via the OAuth authentication process.|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

### Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/videos"
    },
    "videos": [{
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1"
      }]
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/videos",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "videos": [{
      "id": "e1f3ac50-c184-42cc-b9e0-a82c141929b1",
      "url": "https://www.youtube.com/watch?v=XwhHYuP8Lfk"
      }]
  }
}
```

### Response Payload Parameters

The HTTP response message that's received has the following body attributes:

|Field Name|Type|Description|
|----|----|----|
|_links|Object|The links object that has all the hypermedia links of the requested resource.|
|_request|<a href="#request-object">Request</a>|An object that contains information about the sent HTTP request message. This object is mostly needed for debugging, logging, and monitoring purposes.|
|_response|<a href="#response-object">Response</a>|An object that contains information about what happened on the server e.g. it gives information if the request was processed successfully.|
|_data|<a href="#videosData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="videosData"></span>

### Videos Data Object

The following table shows the fields that are contained in the *_data* object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|videos|array, <a href="#VideoObject1">Video</a>|An array that holds the video objects.|

<span id="VideoObject1"></span>

### Video Object

The following table shows the fields that are contained in the *_data* object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|id|String|The unique ID of the vehicles' youtube video.|
|url|String|The URL of the youtube video that's attached to the vehicle.|

## Retrieve a video

> ###Endpoint
> `GET` /vehicles/{vehicleId}/videos/{videoId}

### Request Example

Retrieve the video of id = e1f3ac50-c184-42cc-b9e0-a82c141929b1 for the vehicle with id = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell
curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1 \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Accept: application/json" \
     -H "Authorization: Bearer 73a06d83-6e13-4444-a288-6aa8c4098c2f"
```

Retrieve details of an existing vehicle's youtube video.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleId|URI Parameter|Yes|Unique identifier for a given vehicle.|
|videoId|URI Parameter|Yes|Unique identifier for a given video.|

### Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Accept|String|Yes|The mediatype to be received e.g. application/json.|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

> ### Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1"
    },
  },
  "_request": {
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success",
    "objectId": "e1f3ac50-c184-42cc-b9e0-a82c141929b1"
  },
  "_data": {
    "video": {
      "id": "e1f3ac50-c184-42cc-b9e0-a82c141929b1",
      "url": "https://www.youtube.com/watch?v=XwhHYuP8Lfk"
    }
  }
}
```

The HTTP response message that's received has the following body attributes:

|Field Name|Type|Description|
|----|----|----|
|_links|Object|The links object that has all the hypermedia links of the requested resource.|
|_request|<a href="#request-object">Request</a>|An object that contains information about the sent HTTP request message. This object is mostly needed for debugging, logging, and monitoring purposes.|
|_response|<a href="#response-object">Response</a>|An object that contains information about what happened on the server e.g. it gives information if the request was processed successfully.|
|_data|<a href="#videoData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="videoData"></span>

### Video Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|video|<a href="#VideoObject2">Video</a>|An object that contains information about the requested video object.

<span id="VideoObject2"></span>

### Video Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|videoUrl|String|The URL of the youtube video that&rsquo;s attached to the vehicle.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

## Delete a Video

> ###Endpoint
> `DELETE` /vehicles/{vehicleId}/videos/{videoId}

> ### Response Example

Delete the video with id = e1f3ac50-c184-42cc-b9e0-a82c141929b1 of the vehicle with ID = b78d27e2-671a-47w6-80ab-d3726d7782c7:

```shell
curl https://api.autoscout24.com/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1 \
     -X DELETE \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Accept: application/json" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Delete an existing vehicle's video.

### Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleId|URI Parameter|Yes|Unique identifier for a given vehicle.|
|videoId|URI Parameter|Yes|Unique identifier for a given video.|

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
    "url": "/vehicles/b78d27e2-671a-47w6-80ab-d3726d7782c7/videos/e1f3ac50-c184-42cc-b9e0-a82c141929b1",
    "body": null,
    "method": "DELETE"
  },
  "_response": {
    "type": "Success",
    "messages": [
      {
	"code": 10004,
	"messageType": "Info",
	"text": "Video with id e1f3ac50-c184-42cc-b9e0-a82c141929b1 was successfully deleted."
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
