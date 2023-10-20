import { Response } from 'express';
import httpStatus from 'http-status';
import { AuthenticatedRequest } from '@/middlewares';
import { hotelsService } from '@/services';
import { redis } from '@/server';

export async function getHotels(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const hotelRedis = await redis.get('hotels');
  if (hotelRedis) return res.status(httpStatus.OK).send(JSON.parse(hotelRedis));
  const hotels = await hotelsService.getHotels(userId);
  await redis.set('hotels', JSON.stringify(hotels), 'EX', 120);
  res.status(httpStatus.OK).send(hotels);
}

export async function getHotelsWithRooms(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const hotelId = Number(req.params.hotelId);
  const hotelRedisWithRoom = await redis.get('hotelWithRoom');
  if (hotelRedisWithRoom) return res.status(httpStatus.OK).send(JSON.parse(hotelRedisWithRoom));
  const hotelWithRooms = await hotelsService.getHotelsWithRooms(userId, hotelId);
  await redis.set('hotelWithRoom', JSON.stringify(hotelWithRooms), 'EX', 120);
  res.status(httpStatus.OK).send(hotelWithRooms);
}
