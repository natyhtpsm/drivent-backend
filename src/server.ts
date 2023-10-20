import app, { init } from '@/app';
import { Redis } from 'ioredis';

const port = +process.env.PORT || 4000;

export const redis = new Redis(
  'rediss://red-ckoqa38ujous73dsvs80:JT6f4Ch7OAEudIDwkcouOcAcwM7OBpNv@oregon-redis.render.com:6379',
);

init().then(() => {
  app.listen(port, () => {
    /* eslint-disable-next-line no-console */
    console.log(`Server is listening on port ${port}.`);
  });
});
