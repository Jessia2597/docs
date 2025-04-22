# Messages


## Consent Message Content

### Request

Example:

```
{
    "type":"Consent Request",
    "id":"xyz",
    "payload":{
        "caption":"Consent Request",
        "body":"<html>Here is your Text</html>"
        "options":["Allow","Deny"],
        "replyType":"Consent Reply"
    }
}
```


### Reply 

Example:

```
{
    "type":"Consent Reply",
    "id":"xyz",
    "payload":{
        "selectedOption":"Allow"
    }
}
```

## Notification Content

### Request

Example:

```
{
    "type":"Notification",
    "id":"xyz",
    "payload":{
        "caption":"Hello World!",
        "body":"<html>Hello world!</html>"
    }
}

