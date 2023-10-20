import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { eventsService } from '@/services';
import { Redis } from 'ioredis';

const redis = new Redis(
  'rediss://red-ckoqa38ujous73dsvs80:JT6f4Ch7OAEudIDwkcouOcAcwM7OBpNv@oregon-redis.render.com:6379',
);

export async function getDefaultEvent(_req: Request, res: Response) {
  const redisRes = await redis.get('event');
  if (redisRes) {
    console.info('Foi pelo Redis !!!');
    return res.status(httpStatus.OK).send(JSON.parse(redisRes));
  }
  const event = await eventsService.getFirstEvent();
  await redis.set('event', JSON.stringify(event));
  console.info('Foi banco normal');
  return res.status(httpStatus.OK).send(event);
}
