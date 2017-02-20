# Introduction

<p><strong>===========</strong></p>
<p><strong>ATTENTION: </strong></p>
<p><strong>- PLEASE NOTE THAT OUR API VERSION 1.0 WILL FINALLY BE SHUT DOWN SOON!</strong></p>
<p><strong>- PLEASE MAKE SURE THAT ALL OF YOUR REQUESTS CARRY THE NEW VERSION HEADER X-AS24-Version: 1.1 UNTIL 30 SEPTEMBER 2016!</strong></p>
<p><strong>Details about version 1.1 can be found here (<a href="#change-log">https://autoscout24.github.io/api/#change-log</a>)</strong></p>
<p><strong>===========</strong></p>

AutoScout24 is one of the biggest online car markets in Europe. On 4 market places are 2 million vehicles including new and used cars, motorbikes and trucks. AutoScout24 serves 20 million users (ACTA 2013) and over 40.000 dealers in seven countries.

The AutoScout24 API allows developers to manage the life cycle of classified listings on the AutoScout24 platform. Users of the API are able to read and write vehicle data, access make/model information or create classified ads.
The API offers a RESTful interface to interact with the resources. The format to resolve or submit data is JSON. To access most of the endpoints, you need to be authenticated, using the OAuth process.

These pages are the main source of documentation for developers working with our API. If this is your first time getting in touch with AutoScout24 API, we recommend to carefully read through these pages.

Should this comprehensive online documentation not answer your questions please feel free to contact us using the following E-Mail address: <a href="mailto:daten@autoscout24.de?Subject=RESTful%20API%20Access%20Information%20Request" target="_top">daten@autoscout24.de</a>


> ###API Endpoint:
> https://api.autoscout24.com


> ###The following resources are exposed by the AutoScout24 API:

```shell
/vehicles
/vehicles/{vehicledId}
/vehicles/{vehicledId}/images
/vehicles/{vehicledId}/images/{imageId}
/vehicles/{vehicledId}/imageorder
/vehicles/{vehicledId}/videos
/vehicles/{vehicledId}/videos/{videoId}
/vehicles/{vehicledId}/publications
/vehicles/{vehicledId}/publications/{channelId}
/vehicles/{vehicledId}/products
/vehicles/{vehicledId}/products/{poroductId}
/vehicles/{vehicledId}/financingoffers
/vehicles/{vehicledId}/financingoffers/{financingofferId}
/statistics
/statistics/statisticId
/customerdetails
/makes
/makes/{makeId}
/makes/{makeId}/models
/seals
/seals/{sealId}
/references
```

**The following image shows the graph of resources and sub-resources of the AutoScout24 RESTful API:**

![Resources Image][resources]

[resources]: images/resources.png
