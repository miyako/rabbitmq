# amqp_consume : amqp : \_CLI

`rabbitmq_sub` is a subclass of `_CLI` to execute the `amqp-consume` program. 

## .connect() 

**.connect**($options : Object) : cs.amqp_consume

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
|queue|Text|
|exclusive|Boolean|
|noAck|Boolean|
|heartbeat|Integer|
|count|Integer|
