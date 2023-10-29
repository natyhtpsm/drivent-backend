import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { eventsService } from '@/services';
import RedisClient from '@/config/redisConfig';

export async function getDefaultEvent(_req: Request, res: Response) {
  const eventRedis = await RedisClient.instance.get('event');
  if (eventRedis) {
    return res.status(httpStatus.OK).send(JSON.parse(eventRedis));
  }
  const event = await eventsService.getFirstEvent();
  await RedisClient.instance.set('event', JSON.stringify(event), 'EX', 120);
  console.info('Foi banco normal');
  return res.status(httpStatus.OK).send(event);
}
