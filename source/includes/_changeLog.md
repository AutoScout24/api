# Change Log

This section documents all the changes on the AutoScout24 RESTful API. This includes documentation for the new features, changes to old features, and deprecated features.

<aside> <b>Version 1.1 is the most recent version of the AutoScout24 RESTful API</b>. This version was introduced on February 22nd, 2016. For more information about AutoScout24&rsquo;s API evolution strategy, please refer to the <a href="#api-evolution">API Evolution section</a>.</aside>

##Versions

| Version | Release Date | Shutdown Date |
|----|----|----|
|1.1|22.02.2016| - |
|1.0|01.04.2015|22.08.2016 |

##August 9th, 2018 – API version 1.1


The following changes will be effective from the <span style="color:red"> **10th of September, 2018**</span>.

### Format changes for ImageID

The current ImageID, even if is not explicitly documented, is an unsigned integer. Current modifications will change the value to be be a string (UUID).

| Current Type | Future Type |
| :--- | :--- |
| ImageID: Unsigned Integer (ex: 1321961722) | ImageID: String (ex: 6fb6d93c-7189-471a-a0a2-169597a01cab) |

### Image Deduplication

After the change it will not be possible to upload multiple times the same image \(same md5 checksum\).

| Action | Current Response | Future Behavior |
| :--- | :--- | :--- |
| Upload image 1 (md5: 74b87337454200d4d33f80c4663dc5e5) | Success Response, ImageID: 12345, number of images: 1 | Success Response, ImageID: 704fa1b9-631d-460f-938f-6cf13d6b790f, number of images: 1 |
| Upload image 2 (md5: 74b87337454200d4d33f80c4663dc5e5) | Success Response, ImageID: 67890, number of images: 2 | Success Response, ImageID: 704fa1b9-631d-460f-938f-6cf13d6b790f, number of images: 1 |
| Upload image 3 (md5: 9448a1bf333fadd2a57965ec38487b89) | Success Response, ImageID: 65437, number of images: 3 | Success Response, ImageID: 6fb6d93c-7189-471a-a0a2-169597a01cab, number of images: 2 |

##September 27th, 2017 – API version 1.1

PUT method for update an image is no longer available.

##June 2nd, 2017 – API version 1.1

PUT method for update an image will be deprecated and no longer be available after 31st July 2017.

Please make sure that your application is no longer using this functionality until the end of July 2017!

##April 18th, 2017 - API version 1.1

###New features

#### - AlloyWheelSize

Introduction of AlloyWheelSize as a new attribute for car listings.

##February 20th, 2017 - API version 1.1

###New features

#### - CustomerDetails
Data providers can now retrieve customer details including the customer identification number (Sell-ID) for a valid access token.

##April 12th, 2016 - API version 1.1

###New Features

#### - Equipment Update:

|API ID|Equipment Name (German)|Equipment Name (English)|
|----|----|----|
|133|Abstandstempomat|Adaptive Cruise Control|
|134|Armlehne|Armrest|
|135|Beheizbare Frontscheibe|Electrically heated windshield|
|136|Beheizbares Lenkrad|Heated steering wheel|
|137|Berganfahr-Assistent|Hill holder|
|138|DAB-Radio|Digital radio|
|139|Elektrische Heckklappe|Electric tailgate|
|140|LED Scheinwerfer|LED Headlights|
|141|LED Tagfahrlicht|LED Daytime Running Lights|
|142|Lederlenkrad|Leather steering wheel|
|143|Luftfederung|Air suspension|
|145|Massagesitze|Massage seats|
|146|Müdigkeits-Warnsystem|Driver drowsiness detection|
|147|Nachtsicht-Assistent|Night view assist|
|148|Notbrems-Assistent|Emergency brake assistant|
|149|Notrufsystem|Emergency system|
|150|Reifendruck-Kontrollsystem|Tire pressure monitoring system|
|151|Schaltwippen|Shift paddles
|152|Schiebetür|Sliding door|
|153|Schlüssellose Zentralverriegelung|Keyless central door lock|
|154|Sitzbelüftung|Seat ventilation|
|155|Soundsystem|Sound system|
|156|Sprachsteuerung|Voice Control|
|157|Spurhalte-Assistent|Lane departure warning system|
|158|Totwinkel-Assistent|Blind spot monitor|
|159|Touchscreen|Touch screen|
|160|TV|Television|
|161|USB|USB|
|162|Verkehrszeichenerkennung|Traffic sign recognition|

#### - Interior Colors Update:

New Interior colors have been added that could give the vehicles a better description:

|API ID|Interior Color Name (German)|Interior Color Name (English)|
|----|----|----|
|6|Blau|Blue|
|7|Rot|Red|
|8|Grün|Green|
|9|Gelb|Yellow|
|10|Orange|Orange|
|11|Weiß|White|

##April 6th, 2016 - API version 1.1

###New Features

#### - Statistics:
Dealers can now retrieve the statistics of their entire stock as well as their individual vehicles.

#### - Bikes:
Dealers can now insert not only cars, but they can also insert bikes via the `/vehicles` endpoint.

#### - Financing Offers:
A new Financing Offers sub-resource `/vehicles/{vehicleId}/financingoffers` was added to the Vehicles resource. This would enable dealers to offer their customers the opportunity to get a financing offer when buying the vehicle. A dealer can now create, update, retrieve, and delete one financing offer for each vehicle.

#### - Detail Page URI:
The link to the detail page is now returned when published a vehicle on a specific channel. In addition, the Channel's respective detail page URI is returned when requesting information about the publication channels. For more information, please check the <a href="#resource-publications">/publications resource</a>.

#### - Version Header:
A new HTTP header `X-AS24-Version` was introduced to explicitly define which version the consumer application is trying to communicate with. This header is mandatory for all the requests to the API.

###Changes On v1.0

#### - New Response Structure:
A new data structure is introduced that unifies what the API responses look like. This new data structure would enable the consumers of the API to handle all the responses of the API in the same way. In addition, Hypermedia is used to represent the relationship to other resources. The new data structure will replace the old data structure that was used in v1.0.

#### - New data types for the Reference Object's fields:
`vehicleType` and `country` fields of the <a href="#referenceObject">Reference</a> object have been changed in version 1.1 to be of type array.

#### - New data type for the Make Object's fields:
`vehicleType` field of the <a href="#makeObject2">Make</a> object has been changed in version 1.1 to be of type array.
