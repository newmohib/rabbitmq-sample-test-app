const ampq = require("amqplib/callback_api");

// connect to rabbitmq server

ampq.connect("amqp://localhost", (err, connection) => {
  if (err) {
    throw err;
  }
  connection.createChannel((err, channel) => {
    if (err) {
      throw err;
    }
    const queueName = "hello";
    channel.assertQueue(queueName, {
      durable: false,
    });
    // receive messages
    channel.consume(queueName, (msg) => {
      console.log("[x] Received ", msg.content.toString());
      channel.ack(msg);
    });
  });
});
