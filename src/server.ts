import app, { init } from '@/app';
import RedisClient from './config/redisConfig';

const port = +process.env.PORT || 4000;

init().then(() => {
  app.listen(port, () => {
    /* eslint-disable-next-line no-console */
    RedisClient.connect();
    console.log(`Server is listening on port ${port}.`);
  });
});
