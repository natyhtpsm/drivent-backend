import { Response } from 'express';
import httpStatus from 'http-status';
import { AuthenticatedRequest } from '@/middlewares';
import { hotelsService } from '@/services';
import RedisClient from '@/config/redisConfig';

export async function getHotels(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const hotelRedis = await RedisClient.instance.get('hotels');
  if (hotelRedis) return res.status(httpStatus.OK).send(JSON.parse(hotelRedis));
  const hotels = await hotelsService.getHotels(userId);
  await RedisClient.instance.set('hotels', JSON.stringify(hotels), 'EX', 120);
  res.status(httpStatus.OK).send(hotels);
}

export async function getHotelsWithRooms(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const hotelId = Number(req.params.hotelId);
  const hotelRedisWithRoom = await RedisClient.instance.get('hotelWithRoom');
  if (hotelRedisWithRoom) return res.status(httpStatus.OK).send(JSON.parse(hotelRedisWithRoom));
  const hotelWithRooms = await hotelsService.getHotelsWithRooms(userId, hotelId);
  await RedisClient.instance.set('hotelWithRoom', JSON.stringify(hotelWithRooms), 'EX', 120);
  res.status(httpStatus.OK).send(hotelWithRooms);
}
