# Resource - Financing Offers

The Financing Offers resource is a sub-resource of the Vehicle resource. It manages the complete lifecycle of the financing offer of a specific vehicle on the AutoScout24 marketplace. This includes creating, updating, retrieving, and deleting a financing offer of a vehicle.

## Create a Financing Offer

> ###Endpoint
> `POST` /vehicles/{vehicleId}/financingoffers

> ###Request Example
> Create a financing offer and attaching it to a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell

curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers \
     -X POST \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Content-Type: application/json"
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
     -d '{ \
	  "annualPercentageRate": 4.99, \
	  "bank": "Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart", \
	  "currency": "EUR", \
	  "debitInterestType": 1, \
	  "debitInterestRate": 4.25, \
	  "duration": 12, \
	  "endingRate": 350.12, \
	  "financingType": "C", \
	  "grossCreditAmount": 6789.88, \
	  "initialPayment": 20.15, \
	  "monthlyRate": 300.63, \
	  "netCreditAmount": 4900.21, \
	  "paymentProtectionInsurance": 13.22 \
	}'
```

Add a new financing offer to the vehicle. *(This is only available to dealers in Germany and Italy.)*

Please note that AutoScout24 can only add one financing offer per vehicle at the moment.


**Semantic Rules**

- Financing offers are only accepted for vehicles inserted by German, Italian, Dutch or Belgian dealers. Financing offers added by dealers in another country are rejected.

- Only one financing offer can be added for each vehicle.

- Fields with type = string must not contain URLs, E-Mail addresses or prohibited characters < or > unless it is the *email* field itself.

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


### Payload Parameters

*Note: string length is counted as total of UFT-8 characters.*

|Field Name|Type|Mandatory|Format|Description|
|----|----|----|----|----|
|annualPercentageRate|Number|yes|Only between 0.00 and 99.99|Annual percentage rate in `%`.|
|bank|string|yes|600 character allowed|Name, legal form, address, postal code and city of bank partner need to be transmitted here (e.g. Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart) as well as other financing offer conditions: Please indicate here whether your financing offer requires the conclusion of an insurance contract or a contract for other supplementary benefits. If the cost of this contract cannot be determined in advance, please indicate the obligation to conclude this contract (e.g. compulsory conclusion of a comprehensive insurance contract).|
|debitInterestType|Enum|yes|Values: 1=bound , 2=changeable , 3=combined|Debit interest type (bound, changeable, combined) needs to be specified.|
|debitInterestRate|Number|yes|Only between 0.00 and 99.99|Debit interest rate in `%`|
|duration|Integer|yes|Only between 1 - 999|Indicates the duration of the loan contract in `months`.|
|endingRate|Number|no|Only between 0.00 and 999999999.99|Ending Rate in `EUR`.|
|financingType|Enum|yes|Values: C=Credit|Financing type needs to be specified. Currently only Credit type can be selected.|
|grossCreditAmount|Number|yes|Only between 0.01 and 999999999.99|Gross credit amount in `EUR`.|
|initialPayment|Number|no|Only between 0.00 and 999999999.99|Initial payment if applicable for the loan in `EUR`.|
|monthlyRate|Number|yes|Only between 0.00 and 999999999.99|Monthly rate in `EUR`.|
|netCreditAmount|Number|yes|Only between 0.00 and 999999999.99|Net credit amount in `EUR`.|
|paymentProtectionInsurance|Number|no|Only between 0.00 and 999999999.99|Payment protection insurance in `EUR`.|


> ###Response Example

```json

{
  "_links": {
    "self": {
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee"
    }
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers",
    "body": "{\"bank\":\"Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart\",\"debitInterestType\":1,\"financingType\":\"C\",\"currency\":\"EUR\",\"endingRate\":350.12,\"duration\":12,\"initialPayment\":20.15,\"debitInterestRate\":4.25,\"annualPercentageRate\":4.99,\"monthlyRate\":300.63,\"grossCreditAmount\":6789.88,\"netCreditAmount\":4900.21,\"paymentProtectionInsurance\":13.22}",
    "method": "POST"
  },
  "_response": {
    "type": "Success",
    "objectId": "7e59591f-c5a3-974e-e452-2951040ae4ee"
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

##Retrieve Financing Offers

> ###Endpoint
> `GET` /vehicles/{vehicleId}/financingoffers

> ###Request Example
> Retrieve all the financing offers of a vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell
curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers \
     -X GET
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Retrieve a collection of all available financing offers for a specific vehicle. *(This is only avaialble to the dealers in Germany.)*

At the moment, only one offer can be added and retrieved for a specific vehicle.


**Semantic Rules**

- Financing offers can be added and retrieved by German, Italian, Dutch and Belgian dealers only.

- Currently, only one financing offer can be added and retrieved for each vehicle.

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
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers"
    },
    "financingoffers": [
      {
        "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee"
      }
    ]
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "financingoffers": [
      {
        "bank": "Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart",
        "debitInterestType": 1,
        "financingType": "C",
        "currency": "EUR",
        "endingRate": 350.12,
        "duration": 12,
        "initialPayment": 20.15,
        "debitInterestRate": 4.25,
        "annualPercentageRate": 4.99,
        "monthlyRate": 300.63,
        "grossCreditAmount": 6789.88,
        "netCreditAmount": 4900.21,
        "paymentProtectionInsurance": 13.22
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
|_data|<a href="#financingOffersData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="financingOffersData"></span>

###Financing Offers Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|financingoffers|array, <a href="#financingOfferObject1">FinancingOffer</a>|An array that holds the vehicle objects.|

<span id="financingOfferObject1"></span>
###Financing Offer Object

|Field Name|Type|Format|Description|
|----|----|----|----|
|annualPercentageRate|Number|Only between 0.00 and 99.99|Annual percentage rate in `%`.|
|bank|string|yes|150 character allowed|Name, legal form, address, postal code and city of bank partner need to be transmitted. e.g. Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart|
|debitInterestType|Enum|Values: 1=bound , 2=changeable , 3=combined|Debit interest type (bound, changeable, combined) needs to be specified.|
|debitInterestRate|Number|Only between 0.00 and 99.99|Debit interest rate in `%`|
|duration|Integer|Only between 1 - 999|Indicates the duration of the loan contract in `months`.|
|endingRate|Number|no|Only between 0.00 and 999999999.99|Ending Rate in `EUR`.|
|financingType|Enum|Values: C=Credit|Financing type needs to be specified. Currently only Credit type can be selected.|
|grossCreditAmount|Number|Only between 0.01 and 999999999.99|Gross credit amount in `EUR`.|
|initialPayment|Number|Only between 0.00 and 999999999.99|Initial payment if applicable for the loan in `EUR`.|
|monthlyRate|Number|Only between 0.00 and 999999999.99|Monthly rate in `EUR`.|
|netCreditAmount|Number|Only between 0.00 and 999999999.99|Net credit amount in `EUR`.|
|paymentProtectionInsurance|Number|Only between 0.00 and 999999999.99|Payment protection insurance in `EUR`.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.

##Retrieve a Financing Offer

> ###Endpoint
> `GET` /vehicles/{vehicleId}/financingoffers/{financingOfferId}

> ###Request Example
> Retrieve the financing offer of id = 7e59591f-c5a3-974e-e452-2951040ae4ee for the vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell
curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer 73a06d83-6e13-4444-a288-6aa8c4098c2f"
```

Retrieve the given financing offer information of a specific vehicle. (*This is only avaialble to the dealers in Germany. *).

Currently, only one offer can be added and retrieved for a specific vehicle.

**Semantic Rules**

- Financing offers can be added and retrieved by German, Italian, Dutch and Belgian dealers only.

- Currently, only one financing offer can be added and retrieved for each vehicle.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleId|URI Parameter|Yes|Unique identifier for a given vehicle.|
|financingOfferId|URI Parameter|Yes|Unique identifier for a given financing offer.|


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
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee"
    }
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success",
    "objectId": "7e59591f-c5a3-974e-e452-2951040ae4ee"
  },
  "_data": {
    "financingoffer": {
      "bank": "Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart",
      "debitInterestType": 1,
      "financingType": "C",
      "currency": "EUR",
      "endingRate": 350.12,
      "duration": 12,
      "initialPayment": 20.15,
      "debitInterestRate": 4.25,
      "annualPercentageRate": 4.99,
      "monthlyRate": 300.63,
      "grossCreditAmount": 6789.88,
      "netCreditAmount": 4900.21,
      "paymentProtectionInsurance": 13.22
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
|_data|<a href="#financingOfferData">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="financingOfferData"></span>

###Financing Offer Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|financingoffer|<a href="#financingOfferObject2">FinancingOffer</a>|An array that holds the vehicle objects.|

<span id="financingOfferObject2"></span>
###Financing Offer Object

|Field Name|Type|Format|Description|
|----|----|----|----|
|annualPercentageRate|Number|Only between 0.00 and 99.99|Annual percentage rate in `%`.|
|bank|string|yes|150 character allowed|Name, legal form, address, postal code and city of bank partner need to be transmitted. e.g. Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart|
|debitInterestType|Enum|Values: 1=bound , 2=changeable , 3=combined|Debit interest type (bound, changeable, combined) needs to be specified.|
|debitInterestRate|Number|Only between 0.00 and 99.99|Debit interest rate in `%`|
|duration|Integer|Only between 1 - 999|Indicates the duration of the loan contract in `months`.|
|endingRate|Number|no|Only between 0.00 and 999999999.99|Ending Rate in `EUR`.|
|financingType|Enum|Values: C=Credit|Financing type needs to be specified. Currently only Credit type can be selected.|
|grossCreditAmount|Number|Only between 0.01 and 999999999.99|Gross credit amount in `EUR`.|
|initialPayment|Number|Only between 0.00 and 999999999.99|Initial payment if applicable for the loan in `EUR`.|
|monthlyRate|Number|Only between 0.00 and 999999999.99|Monthly rate in `EUR`.|
|netCreditAmount|Number|Only between 0.00 and 999999999.99|Net credit amount in `EUR`.|
|paymentProtectionInsurance|Number|Only between 0.00 and 999999999.99|Payment protection insurance in `EUR`.|

### Error Codes

For the list of possible **error codes** in the `_response` object of the Response payload, please click <a href="#errors">here</a>.


## Update a Financing Offer

> ###Endpoint
> `PUT` /vehicles/{vehicleId}/financingoffers/{financingOfferId}

> ###Request Example
> Update the financing offer with id = 7e59591f-c5a3-974e-e452-2951040ae4ee of the vehicle with id = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell

curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee \
     -X PUT \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Content-Type: application/json"
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf" \
     -d '{ \
	  "annualPercentageRate": 4.99, \
	  "bank": "Santander Consumer Bank AG, Neue Brücke 1, 70173 Stuttgart", \
	  "currency": "EUR", \
	  "debitInterestType": 1, \
	  "debitInterestRate": 4.25, \
	  "duration": 12, \
	  "endingRate": 350.12, \
	  "financingType": "C", \
	  "grossCreditAmount": 6789.88, \
	  "initialPayment": 20.15, \
	  "monthlyRate": 300.63, \
	  "netCreditAmount": 4900.21, \
	  "paymentProtectionInsurance": 13.22 \
	}'
```

Update the information of the given financing offer. (*This is only avaialble to the dealers in Germany. *).


**Semantic Rules**

- Financing offers are only accepted for vehicles inserted by German dealers. Financing offers added by non-German dealers are rejected.

- Only one financing offer can be added for each vehicle.

- Fields with type = string must not contain URLs, E-Mail addresses or prohibited characters < or > unless it is the *email* field itself.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|
|financingOfferId|URI Parameter|Yes|Unique identifier for a given financing offer.|

###Headers

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
|annualPercentageRate|Number|yes|Only between 0.00 and 99.99|Annual percentage rate in `%`.|
|bank|string|yes|150 character allowed|Name, legal form, address, postal code and city of bank partner need to be transmitted. e.g. Mercedes-Benz Bank AG, Siemensstraße 7, 70469 Stuttgart|
|debitInterestType|Enum|yes|Values: 1=bound , 2=changeable , 3=combined|Debit interest type (bound, changeable, combined) needs to be specified.|
|debitInterestRate|Number|yes|Only between 0.00 and 99.99|Debit interest rate in `%`|
|duration|Integer|yes|Only between 1 - 999|Indicates the duration of the loan contract in `months`.|
|endingRate|Number|no|Only between 0.00 and 999999999.99|Ending Rate in `EUR`.|
|financingType|Enum|yes|Values: C=Credit|Financing type needs to be specified. Currently only Credit type can be selected.|
|grossCreditAmount|Number|yes|Only between 0.01 and 999999999.99|Gross credit amount in `EUR`.|
|initialPayment|Number|no|Only between 0.00 and 999999999.99|Initial payment if applicable for the loan in `EUR`.|
|monthlyRate|Number|yes|Only between 0.00 and 999999999.99|Monthly rate in `EUR`.|
|netCreditAmount|Number|yes|Only between 0.00 and 999999999.99|Net credit amount in `EUR`.|
|paymentProtectionInsurance|Number|no|Only between 0.00 and 999999999.99|Payment protection insurance in `EUR`.|


> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee"
    }
  },
  "_request": {
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee",
    "body": "{\"bank\":\"Santander Consumer Bank AG, Neue Brücke 1, 70173 Stuttgart\",\"debitInterestType\":1,\"financingType\":\"C\",\"currency\":\"EUR\",\"endingRate\":350.12,\"duration\":12,\"initialPayment\":20.15,\"debitInterestRate\":4.25,\"annualPercentageRate\":4.99,\"monthlyRate\":300.63,\"grossCreditAmount\":6789.88,\"netCreditAmount\":4900.21,\"paymentProtectionInsurance\":13.22}",
    "method": "PUT"
  },
  "_response": {
    "type": "Success",
    "objectId": "7e59591f-c5a3-974e-e452-2951040ae4ee"
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


## Delete a Financing Offer

> ###Endpoint
> `DELETE` /vehicles/{vehicleId}/images/{imageId}

> ###Request Example
> Delete the financing offer with id = 7e59591f-c5a3-974e-e452-2951040ae4ee of the vehicle with ID = 7e59591f-c5a3-974e-e452-2951040ae4ee:

```shell

curl https://api.autoscout24.com/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee \
     -X DELETE \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer e7c00b24-9f5f-4909-88de-38f8d7ca08bf"
```

Delete an existing vehicle's financing offer.

###Parameters

|Parameter Name|Type|Mandatory|Description|
|----|----|----|----|
|vehicleID|URI Parameter|Yes|Unique identifier for a given vehicle.|
|financingOfferId|URI Parameter|Yes|Unique identifier for a given financing offer.|

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
    "url": "/vehicles/7e59591f-c5a3-974e-e452-2951040ae4ee/financingoffers/7e59591f-c5a3-974e-e452-2951040ae4ee",
    "body": null,
    "method": "DELETE"
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
