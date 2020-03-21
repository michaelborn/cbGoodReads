# CBGoodReads

A GoodReads API wrapper based on [Hyper](https://forgebox.io/view/hyper).

I started this project as a sample application to interact with book reviews. Unfortunately, the GoodReads API worthless for retrieving reviews since it will only return an HTML iframe widget and not actual review data.

Feel free to take this over if you wish. :)

## Configuration

Use Coldbox's `ModuleSettings` configuration to configure the API key and BaseURI at a minimum. The API secret is also required for write requests.

```js
moduleSettings = {
    cbGoodReads : {
        "APIKey" : getSystemSetting( "GOODREADS_API_KEY" ),
        "APISecret" : getSystemSetting( "GOODREADS_API_SECRET" ),
        "baseURI" : getSystemSetting( "GOODREADS_BASE_URI", "https://www.goodreads.com" )
    }
}
```

The `getSystemSetting()` coldbox function will pull an environment variable from `server.system.environment`, or you can use [commandbox-dotenv]() with a `.env` file:

```bash
# .env in root of project.
# Please Ignore me from Git!
# GoodReads API secrets
GOODREADS_API_KEY=myKey
GOODREADS_API_SECRET=soSecret
GOODREADS_BASE_URI=https://www.goodreads.com
```

## Methods

### getReviewsByISBN

Retrieve a GoodReads book reviews widget for the given ISBN.

```js
var response = goodReads.getReviewsByISBN( isbn );
```

## TODO

* Flesh out all API calls.
* Complain to GoodReads that their API rots.
* Write tests for each method.