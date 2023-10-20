import app, { init } from '@/app';

const port = +process.env.PORT || 4000;

// redis://red-ckoqa38ujous73dsvs80:6379

init().then(() => {
  app.listen(port, () => {
    /* eslint-disable-next-line no-console */
    console.log(`Server is listening on port ${port}.`);
  });
});
