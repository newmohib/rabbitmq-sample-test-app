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
    const message = "Hello World!";
    channel.assertQueue(queueName, {
      durable: false,
    });
    channel.sendToQueue(queueName, Buffer.from(message));
    console.log("[x] Sent ", message);

    setTimeout(() => {
      connection.close();
    }, 10000);
  });
});
