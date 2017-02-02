# Resource - Seals

The Seals resource offers the needed endpoints to retrieve information about the available vehicle seals that are supported by the AutoScout24 marketplace.

## Retrieve Seals List

> ###Endpoint
> `GET` /seals

> ###Request Example
> Get the list of seals that are supported by AutoScout24:

```shell

curl https://api.autoscout24.com/seals \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB"
```

Retrieve a list of supported car seals.

- Response also shows which country a given *seal* is valid for (e.g. German dealers should only attach German used car seals to their vehicles).
- Please note that all vehicles possessing a used car seal are subject to further checks by AutoScout24. Vehicles might therefore be listed without the initially requested car seal.


###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|

> ###Response Example

```json

{
  "_links": {
    "self": {
      "href": "/seals"
    },
    "seals": [
      {
        "href": "/seals/166"
      },
      {
        "href": "/seals/167"
      },
      ...
      {
        "href": "/seals/-1"
      }
    ]
  },
  "_request": {
    "url": "/seals",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "seals": [
      {
        "id": 166,
        "name": "VOLVO SELEKT",
        "country": "AT"
      },
      {
        "id": 167,
        "name": "A1 FORD GEBRAUCHTWAGEN PLUS",
        "country": "AT"
      },
      ...
      {
        "id": -1,
        "name": "NAP-Check",
        "country": "NL"
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
|_data|<a href="#sealsData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="sealsData"></span>

###Seals Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|seals|array, <a href="#sealObject1">Seal</a>|An array that holds the seal objects.|

<span id="sealObject1"></span>
###Seal Object

|Field Name|Type|Description|
|----|----|----|----|
|id|Integer|The unique identifier of the seal object.|
|name|String|The name of the seal.|
|country|Enum|The country where this seal is offered.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

##Retrieve Seal's Information

> ###Endpoint
> `GET` /seals/{sealId}

> ###Request Example
> Retrieve the information of the Volvo Selekt seal that has the ID = 166 :

```shell
curl https://api.autoscout24.com/seals/166 \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB"
```

Retrieve details of a given car seal.

- Response also shows which country a given *seal* is valid for (e.g. German dealers should only attach German used car seals to their vehicles).
- Please note that all vehicles possessing a used car seal are subject to further checks by AutoScout24. Vehicles might therefore be listed without the initially requested car seal.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|sealId|URI Parameter|Yes|Unique identifier for the requested seal.|

###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|

> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/seals/166"
    }
  },
  "_request": {
    "url": "/seals/166",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success",
    "objectId": "166"
  },
  "_data": {
    "seal": {
      "id": 166,
      "name": "VOLVO SELEKT",
      "country": "AT"
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
|_data|<a href="#sealData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="sealData"></span>

###Seal Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|seals|<a href="#sealObject2">Seal</a>|The object that holds information about the requested seal.|

<span id="sealObject2"></span>
###Seal Object

|Field Name|Type|Description|
|----|----|----|----|
|id|Integer|The unique identifier of the seal object.|
|name|String|The name of the seal.|
|country|Enum|The country where this seal is offered.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.
