# Resource - Statistics

The Statistics resource offers information about the performance of vehicle listings. Using this resource, performance metrics about the entire stock of the dealer as well as individual vehicles are offered. Performance metrics could be used to measure the success of dealer's offers which could lead to better learning and understanding of how these offers could also be further improved.

## Retrieve Dealer&rsquo;s Stock Statistics

> ###Endpoint
> `GET` /statistics?start={startDate}&end={endDate}

> ###Request Example
> Get the aggregated dealer's stock statistics between 2015-11-15 and 2015-12-15:

```shell
curl https://api.autoscout24.com/statistics?start=2015-11-15&end=2015-12-15 \
    -X GET \
    -H "X-AS24-Version: 1.1"  \
    -H "Accept-Language: en-GB"

```

Retrieve performance metrics of the dealers stock. Using this endpoint, aggregated performance metrics of all the vehicles that are available (published and unpublished) on the AutoScout24 marketplace are offered.

<aside><b>Please note: You are not allowed to store or aggregate the data you receive.</b></aside>

**Semantic Rules**

- Statistics are calculated on a daily basis. It takes 24 hours to update the entire stock statistics.
- Statistics' results can be filtered based on a date period. The *start* and *end* URL query parameters are used to filter statistics results based on start and end date.
- The date is represented using the ISO 8601 format: YYYY-MM-dd.
  *start and *end* query parameters have to be specified, otherwise the statistics of the last 30 days are returned.
- Statistics are available for the past 365 days of the day of calling this endpoint. *It's important to note that the longer the filtered date period is, the longer it takes to receive the HTTP response message.*
- *end* date value should be set to a value that's up to a one day before the date of the day of sending the API request.


###Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|
|Authorization|String|Yes|The Bearer authentication token that was received via the OAuth authentication process.|

###Query Parameters

|Query parameter Name|Data Type|Mandatory|Description|
|----|----|----|----|
|start|date|Yes|The start date of when to fetch statistics. This value should be represented based on the ISO 8601 format: YYYY-MM-dd|
|end|date|Yes|The end date for the date period to fetch statistics. This value should be represented based on the ISO 8601 format: YYYY-MM-dd|


> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/statistics"
    }
  },
  "_request": {
    "url": "/statistics",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "stockstatistics": {
      "vehiclesCount": 49,
      "standingDays": {
        "average": 21,
        "competition": {
          "radius25Average": 23,
          "radius50Average": 26,
          "radius100Average": 28
        }
      },
      "performanceStats": {
        "start": "2015-11-15",
        "end": "2015-12-15",
        "searches": {
          "totalCount": 640,
          "averagePerDay": 21.33
        },
        "views": {
          "totalCount": 161,
          "averagePerDay": 5.36
        },
        "bookmarks": {
          "totalCount": 45,
          "averagePerDay": 1.5
        },
        "leads": {
          "calls": {
            "totalCount": 35,
            "averagePerDay": 1.16
          },
          "emails": {
            "totalCount": 56,
            "averagePerDay": 1.86
          },
          "printOuts": {
            "totalCount": 15,
            "averagePerDay": 0.5
          },
          "totalCount": 106,
          "averagePerDay": 3.53
        }
      }
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
|_data|<a href="#"statisticsData>Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="statisticsData"></span>

###Dealer's stock statistics Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|stockStatistics|<a href="#StockStatistics">StockStatistics</a>|The object that has statistics information.|

<span id="StockStatistics"></span>

###StockStatistics Object

|Field Name|Type|Description|
|----|----|----|
|standingDays|<a href="#StandingDays1">StandingDays</a>|The object that holds standing days statistics of the dealer's stock.|
|performanceStats|<a href="#PerformanceStats1">PerformanceStats</a>|The object that has the performance statistics of the dealer's stock within the specified period of time.|

<span id="StandingDays1"></span>

###StandingDays Object

|Field Name|Type|Description|
|----|----|----|
|average|number|The average standing days of the entire dealer's stock.|
|competition|<a href="#competition1">Competition</a>|The object that has the statistics of the performance statistics of the specified period of time.|

<span id="competition1"></span>

###Competition Object

|Field Name|Type|Description|
|----|----|----|
|radius25Average|number|The average standing days of dealer&rsquo;s competitors within a radius of 25 KM.|
|radius50Average|number|The average standing days of dealer&rsquo;s competitors within a radius of 50 KM.|
|radius100Average|number|The average standing days of dealer&rsquo;s competitors within a radius of 100 KM.

<span id="PerformanceStats1"></span>

###PerformanceStats Object

|Field Name|Type|Description|
|----|----|----|
|start|date|The start date of the period to which the performance statistics have been returned.|
|end|date|The end date of the period to which the performance statistics have been returned.|
|searches|<a href="#searches1">Searches</a>|The object that has the search KPIs of the entire stock of the dealer within the specified date period.|
|views|<a href="#views1">Views</a>|The object that has the vehicle classifieds&rsquo; detail page views KPIs of the entire stock of the dealer within the specified date period.|
|bookmarks|<a href="#bookmarks1">Bookmarks</a>|The object that has the bookmark KPIs of the entire stock of the dealer within the specified date period.|
|leads|<a href="#leads1">Leads</a>|The object that has the leads KPIs of the entire stock of the dealer within the specified date period.|

<span id="searches1"></span>

###Searches Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of appearances of the vehicles of the dealer in the list page of any search criteria within the specified date period|
|averagePerDay|number|The average value per day of the appearance of the dealer&rsquo;s vehicle listings in the list page of any search criteria within the specified date period.|

<span id="views1"></span>

###Views Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of detail page views of the dealer&rsquo;s vehicle listings within the specified date period.|
|averagePerDay|number|The average value per day of the detail page views of the dealer&rsquo;s vehicle listings within the specified date period.|

<span id="bookmarks1"></span>

###BookMarks Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of bookmarks of the dealer&rsquo;s vehicle listings within the specified date period.|
|averagePerDay|number|The average value per day of bookmarks of the dealer&rsquo;s vehicle listings within the specified date period.|

<span id="leads1"></span>

###Leads Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of leads of the dealer&rsquo;s vehicle listings within the specified date period.|
|averagePerDay|number|The average value per day of leads of the dealer&rsquo;s vehicle listings within the specified date period.|
|emails|<a href="#emails1">Emails</a>|The object that has the emails KPIs of the entire stock of the dealer within the specified date period.|
|printOuts|<a href="#printouts1">Printouts</a>|The object that has the printouts KPIs of the entire stock of the dealer within the specified date period.|
|calls|<a href="#calls1">Calls</a>|The object that has the calls KPIs of the entire stock of the dealer within the specified date period.|

<span id="emails1"></span>

### Emails Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of emails sent to the dealer within the specified date period.|
|averagePerDay|number|The average value per day of the emails sent to the dealer within the specified date period.|

<span id="printouts1"></span>

### Printouts Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of printouts of the dealer's vehicle listings within the specified date period.|
|averagePerDay|number|The average value per day of printouts of the dealer's vehicle listings within the specified date period.|

<span id="calls1"></span>

### Calls Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of calls the dealer has received within the specified date period.|
|averagePerDay|number|The average value per day of calls the dealer has received within the specified date period.|

## Retrieve Vehicles' Statistics

> ###Endpoint
> `GET` /statistics/{id}?start={startDate}&end={endDate}

> ###Request Example
> Get the statistics of the vehicle with ID = b78d27e2-671a-47w6-80ab-d3726d7782c7 between 2015-11-15 and 2015-12-15:

```shell
curl https://api.autoscout24.com/statistics/b78d27e2-671a-47w6-80ab-d3726d7782c7?start=2015-11-15&end=2015-12-15 \
     -X GET \
     -H "X-AS24-Version: 1.1" \
     -H "Accept-Language: en-GB" \
     -H "Authorization: Bearer 73a06d83-6e13-4444-a288-6aa8c4098c2f"
```

Retrieve performance metrics of a specific vehicle. Using this endpoint, performance metrics of a vehicle that is available (published and unpublished) on the AutoScout24 marketplace are offered.

<aside><b>Please note: You are not allowed to store or aggregate the data you receive.</b></aside>

**Semantic Rules**

- Statistics are calculated on a daily basis. The first statistics result might take up to 24 hours after having the vehicle listing on the AutoScout24 marketplace.
- Statistics results can be filtered based on a date period. The *start* and *end* URL query parameters are used to filter statistics results based on start and end date.
- The date is represented using the ISO 8601 format: YYYY-MM-dd.
- *start* and *end* query parameters have to be specified, otherwise the statistics of the vehicle since the creation date are returned.
- Statistics are available for the past 365 days of the day of calling this endpoint. *It's important to note that the longer the filtered date period is, the longer it takes to receive  the HTTP response message*.
- *end* date value should be set to a value that's up to a one day before the date of the day of sending the API request.

### Headers

|Header Name|Data Type|Mandatory|Description|
|----|----|----|----|
|X-AS24-Version|String|Yes|Defines the API version used to serve the request. Current version number is 1.1|
|Accept-Language|String|No|Language used for returning results, e.g. en-GB.|

### Query parameters

|Query parameter Name|Data Type|Mandatory|Description|
|----|----|----|----|
|start|date|yes|The start date of when to fetch statistics. This value should be represented based on the ISO 8601 format: YYYY-MM-dd|
|end|date|yes|The end date for the date period to fetch statistics. This value should be represented based on the ISO 8601 format: YYYY-MM-dd|

> ###Response Example

```json
{
  "_links": {
    "self": {
      "href": "/statistics/b78d27e2-671a-47w6-80ab-d3726d7782c7"
    }
  },
  "_request": {
    "url": "/statistics/b78d27e2-671a-47w6-80ab-d3726d7782c7",
    "body": null,
    "method": "GET"
  },
  "_response": {
    "type": "Success"
  },
  "_data": {
    "vehiclestatistics": {
      "creationDate": "2015-11-10",
      "standingDays": {
        "total": 35
      },
      "currentBookmarks": 3,
      "imageCount": 15,
      "videoCount": 0,
      "performanceStats": {
        "start": "2015-11-15",
        "end": "2016-12-15",
        "searches": {
          "totalCount": 42,
          "averagePerDay": 1.2
        },
        "views": {
          "totalCount": 19,
          "averagePerDay": 0.63
        },
        "bookmarks": {
          "totalCount": 9,
          "averagePerDay": 0.3
        },
        "leads": {
          "calls": {
            "totalCount": 5,
            "averagePerDay": 0.16
          },
          "emails": {
            "totalCount": 6,
            "averagePerDay": 0.2
          },
          "printOuts": {
            "totalCount": 1,
            "averagePerDay": 0.03
          },
          "totalCount": 12,
					"averagePerDay": 0.4
        }
      }
    }
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
|_data|<a href="#statisticsData1">Data</a>|The data object which contains the actual information that was asked for in the sent HTTP request. Below you can find the attributes that this object has.|

<span id="statisticsData1"></span>

### Vehicle's statistics Data Object

The following table shows the fields that are contained in the `_data` object of the Response Payload:

|Field Name|Type|Description|
|----|----|----|
|vehicleStatistics|<a href="#VehicleStatistics">VehicleStatistics</a>|The object that has statistics information.|

<span id="VehicleStatistics"></span>

### VehicleStatistics Object

|Field Name|Type|Description|
|----|----|----|
|creationDate|Date|The creation date of the vehicle on the AutoScout24 marketplace.|
|standingDays|<a href="#StandingDays2">StandingDays</a>|The object that holds standing days statistics of the vehicle.|
|currentBookmarks|integer|The number of bookmarks the vehicle has. This value is calculated once a day.|
|imageCount|integer|The number of images the vehicle has.|
|video|integer|The number of videos the vehicle has. Please note that AutoScout24 supports only one video upload currently.|
|performanceStats|<a href="#PerformanceStats2">PerformanceStats</a>|The object that has the performance statistics of the vehicle within specified period of time.|

<span id="StandingDays2"></span>

### StandingDays Object

|Field Name|Type|Description|
|----|----|----|
|total|integer|The total number of standing days of the vehicle.|

<span id="PerformanceStats2"></span>

### PerformanceStats Object

|Field Name|Type|Description|
|----|----|----|
|start|date|The start date of the period to which the performance statistics have been returned.|
|end|date|The end date of the period to which the performance statistics have been returned.|
|searches|<a href="#searches2">Searches</a>|The object that has the search KPIs of the vehicle within the specified date period.
|views|<a href="#views2">Views</a>|The object that has the vehicle classified&rsquo;s detail page views KPIs within the specified date period.|
|bookmarks|<a href="#bookmarks2">Bookmarks</a>|The object that has the bookmark KPIs of the vehicle within the specified date period.|
|leads|<a href="#leads2">Leads</a>|The object that has the leads KPIs of the vehicle within the specified date period.|

<span id="searches2"></span>

### Searches Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of appearances of the vehicle in the list page of any search criteria within the specified date period.|
|averagePerDay|number|The average value per day of the appearance of vehicle listing in the list page of any search criteria within the specified date period.|

<span id="views2"></span>

### Views Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of detail page views of the vehicle listing within the specified date period.|
|averagePerDay|number|The average value per day of the detail page views of the vehicle listing within the specified date period.|

<span id="bookmarks2"></span>

### BookMarks Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of bookmarks of the vehicle listing within the specified date period.|
|averagePerDay|number|The average value per day of bookmarks of the vehicle listing within the specified date period.|

<span id="leads2"></span>

### Leads Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of leads of the vehicle listing within the specified date period.|
|averagePerDay|number|The average value per day of leads of the vehicle listing within the specified date period.|
|emails|<a href="#emails2">Emails</a>|The object that has the emails KPIs of the vehicle within the specified date period.|
|printOuts|<a href="#printouts2">Printouts</a>|The object that has the printouts KPIs of the vehicle within the specified date period.|
|calls|<a href="#calls2">Calls</a>|The object that has the calls KPIs of the vehicle within the specified date period.|

<span id="emails2"></span>

### Emails Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of emails sent to the dealer for the vehicle within the specified date period.|
|averagePerDay|number|The average value per day of the emails sent to the dealer for the vehicle within the specified date period.|

<span id="printouts2"></span>

### Printouts Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of printouts of the vehicle listing within the specified date period.|
|averagePerDay|number|The average value per day of printouts of the vehicle listing within the specified date period.|

<span id="calls2"></span>

### Calls Object

|Field Name|Type|Description|
|----|----|----|
|totalCount|integer|The total number of calls the dealer has received for the vehicle within the specified date period.|
|averagePerDay|number|The average value per day of calls the dealer has received for the vehicle within the specified date period.|

### Error Codes

For the list of possible <strong>error codes</strong> in the `_response` object of the Response payload, please click <a href="#errors">here</a>.
