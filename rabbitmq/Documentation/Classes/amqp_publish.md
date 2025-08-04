# amqp_publish : amqp : \_CLI

`amqp_publish` is a subclass of `_CLI` to execute the `amqp-publish` program. 

## .connect() 

**.connect**($options : Object) : cs.amqp_publish

|option|value type|
|-|-|
|host|Text|
|port|Integer|
|username|Text|
|password|Text|
|ssl|Boolean|
|cafile|4D.File|
|cert|4D.File|
|key|4D.File|
|exchange|Text|
|routing|Text|
|message|Text or Blob|
|persistent|Boolean|
|replyTo|Text|
|contentType|Text|
