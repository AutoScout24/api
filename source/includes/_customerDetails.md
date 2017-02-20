# Resource - CustomerDetails

The CustomerDetails resource is used to display customer details based on the authentication token.

## Retrieve customer details

> ###Endpoint
> `GET` /customerdetails

### Request Example

Retrieve the customer details for access token = 73a06d83-6e13-4444-a288-6aa8c4098c2f


```shell
curl https://api.autoscout24.com/customerdetails \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Accept: application/json" \
     -H "Authorization: Bearer 73a06d83-6e13-4444-a288-6aa8c4098c2f"
```

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
      "href": "/customerdetails"
    }
  },
  "_request": {
    "url": "/customerdetails",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "customerdetails": {
      "sellId": "2142082683",
      "companyName": "VM TEST ACCOUNT",
      "address": {
        "street": "Am Falm 313",
        "zipCode": "27498",
        "city": "Helgoland",
        "country": "DE"
      }
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
|_data|<a href="#customerDetailsData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="customerDetailsData"></span>

### Customer Details Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|customerdetails|<a href="#customerDetailsObject">Customer Details</a>|An object that contains information about the requested customer details.

<span id="customerDetailsObject"></span>

### Customer Details Object

The following table shows the fields that are contained in the `customerdetails` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|sellId|String|Customer identification number from the AutoScout24 CRM system|
|companyName|String|The name of the customer company|
|address|Object|Object containing details of the address of the customer|

### Customer Details Address Object

The following table shows the fields that are contained in the `address` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|street|String|Main street of the customer|
|zipCode|String|The ZIP code of the customer|
|city|String|The city of the customer|
|country|String|The country of the customer|
